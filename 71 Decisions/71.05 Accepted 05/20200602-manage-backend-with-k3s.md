# Accepted: Manage backend resources on one or more physical machines with K3S

## Context and Problem Statement

We want a way to manage backend resources on one or more physical machines.

## Describe the proposed option and how it helps to overcome the problem or limitation

We are using a lightweight Kubernetes implementation, k3s, to provide management of backend resources

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

### System Setup (Done once)

Install Fedora 34 with a user account set as administrator.

Add authorized keys into ~/.ssh/authorized_keys

OPTIONAL: customize SSH port:
Set `Port 2345` in /etc/ssh/sshd_config.

```bash
sudo semanage port -a -t ssh_port_t -p tcp 2345
sudo firewall-cmd --add-port=2345/tcp
```

REQUIRED: set `PasswordAuthentication no` in /etc/ssh/sshd_config.

OPTIONAL: Configure default DNS server:

#### /etc/NetworkManager/conf.d/override-dns.conf

```ini
[main]
dns=none
[ipv4]
method=auto
dns=8.8.8.8;4.2.2.2;
ignore-auto-dns=true
```

#### /etc/resolv.conf

```bash
search localhost
nameserver 1.0.0.1
nameserver 1.1.1.1
```

#### sshd restart

```bash
sudo service sshd restart
sudo firewall-cmd --add-masquerade --permanent
sudo systemctl restart firewalld
sudo yum install redhat-lsb-core container-selinux selinux-policy-base podman
sudo rpm -i https://github.com/rancher/k3s-selinux/releases/download/v0.1.1-rc1/k3s-selinux-0.1.1-rc1.el7.noarch.rpm
# Validate that ssh logins work, then run:
sudo service NetworkManager stop; sudo service NetworkManager start
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
```

Now, reboot the system.

First, create a new LVM Logical Volume named kubepvc XFS 100GB mounted at `/kube`.
Add the following to /etc/fstab:

#### rancher

```
# If created manually, run `sudo blkid` and add:
# UUID=aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee /kube   auto  defaults   0 0
/kube/rancher /var/lib/rancher    none bind 0 0`
```

#### kube partition

Now, setup the partition:

```bash
sudo mkdir -p /kube
sudo mount /kube
sudo mkdir -p /kube/pvc /kube/rancher /var/lib/rancher /root/.kube
sudo chcon -R -t container_file_t /kube/pvc
sudo mount /var/lib/rancher
```

### SELinux patches

If your system uses SELinux, add the following SELinux module to allow dev-shm access. This will be necessary for python multiprocessing in containers, specifically usage of shm_lock, which is used by Emscripten.

#### dev-shm.te

```
module dev-shm 1.0;

require {
        type container_runtime_tmpfs_t;
        type container_t;
        class dir { getattr relabelto unlink ioctl execute append read setattr write lock create rename link search rmdir remove_name reparent add_name open };
        class file { map getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link execute_no_trans entrypoint execmod open };
        class shm { write destroy unix_write getattr create read setattr unix_read associate lock };
        class sock_file { getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link open };
        class fifo_file { getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link open };
        class lnk_file { getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link };
}
#============= container_t ==============
allow container_t container_runtime_tmpfs_t:dir { getattr relabelto unlink ioctl execute append read setattr write lock create rename link search rmdir remove_name reparent add_name open };
# domain_can_mmap_files
allow container_t container_runtime_tmpfs_t:file { map getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link execute_no_trans entrypoint execmod open };
allow container_t container_runtime_tmpfs_t:shm { write destroy unix_write getattr create read setattr unix_read associate lock };
allow container_t container_runtime_tmpfs_t:sock_file { getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link open };
allow container_t container_runtime_tmpfs_t:fifo_file { getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link open };
allow container_t container_runtime_tmpfs_t:lnk_file { getattr relabelto unlink ioctl execute append read setattr write lock create rename relabelfrom link };
```

Now, install it with:

```bash
checkmodule -M -m dev-shm.te -o dev-shm.mod
semodule_package -m dev-shm.mod -o dev-shm.pp
sudo semodule -i dev-shm.pp
```

### Install k3s (Start here if recreating)

```bash
curl -sfL https://raw.githubusercontent.com/rancher/k3s/master/install.sh | sh -s - server -o /root/.kube/config --default-local-storage-path /kube/pvc --disable=traefik --disable=servicelb --disable=flannel --disable=cni '--kubelet-arg=eviction-soft=memory.available<0%,imagefs.available<0%,nodefs.available<0%' '--kubelet-arg=eviction-hard=memory.available<0%,imagefs.available<0%,nodefs.available<0%'

```

Now you will need to obtain the DNS IAM credentials. In this example, we are working with these Route53 hosted domains: vsekai.org,vsekai.net,vsekai.com,vsekai.cloud,v-sekai.org,v-sekai.net,v-sekai.com,v-sekai.cloud,vsek.ai,v-sek.ai

Install Helm services:

```bash
ACCESSKEY=AKIAABCDEFGHIJKLMNOP
SECRETKEY=XXXXXXXXXXXXXXXXXXXX

sudo helm repo add gocd https://gocd.github.io/helm-chart
sudo helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
sudo helm repo add bitnami https://charts.bitnami.com/bitnami
sudo helm repo add jetstack https://charts.jetstack.io
sudo helm repo update

# We are still using 3.2.3 - I have not figured out the upgrade process yet for external-dns

sudo helm install external-dns --set provider=aws --set aws.zoneType=public --set registry=noop --set aws.credentials.accessKey="$ACCESSKEY" --set domainFilters='{vsekai.org,vsekai.net,vsekai.com,vsekai.cloud,v-sekai.org,v-sekai.net,v-sekai.com,v-sekai.cloud,vsek.ai,v-sek.ai}' --set aws.credentials.secretKey="$SECRETKEY"  bitnami/external-dns


# NOTE: Some of these commands may be outdated:
# They seem to refer to nginx-nginx-ingress but now it is nginx-ingress-nginx.
# Take the following with a grain of salt:

sudo kubectl create namespace ingress-nginx
sudo helm install --namespace ingress-nginx nginx ingress-nginx/ingress-nginx --set controller.replicaCount=2
sudo kubectl patch svc/nginx-nginx-ingress-controller -n kube-system --patch '{"spec":{"externalTrafficPolicy":"Local"}}'
sudo kubectl patch deployments/nginx-nginx-ingress-controller --patch '{"spec":{"template":{"spec":{"hostNetwork":true}}}}' -n kube-system

sudo kubectl get replicasets -n kube-system
# Find the oldest nginx-nginx-ingress-controller one and delete with
sudo kubectl delete replicasets -nginx-ingress-controller-abcdefg-whatever -n kube-system


# Some weird stuff we changed. I don't think any of it is needed other than the above
# externalTrafficPolicy and hostNetwork configuration changes.

cat > ingress-svc-edit.yaml
apiVersion: v1
kind: Service
metadata:
  annotations:
    meta.helm.sh/release-name: nginx
    meta.helm.sh/release-namespace: ingress-nginx
    metallb.universe.tf/address-pool: default
  creationTimestamp: "2021-04-30T02:33:02Z"
  finalizers:
  - service.kubernetes.io/load-balancer-cleanup
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: nginx
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/version: 0.45.0
    helm.sh/chart: ingress-nginx-3.29.0
  name: nginx-ingress-nginx-controller
  namespace: ingress-nginx
spec:
  clusterIP: 10.43.219.102
  clusterIPs:
  - 10.43.219.102
  externalTrafficPolicy: Local
  healthCheckNodePort: 32689
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - name: http
    nodePort: 32595
    port: 80
    protocol: TCP
    targetPort: http
  - name: https
    nodePort: 31937
    port: 443
    protocol: TCP
    targetPort: https
  selector:
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: nginx
    app.kubernetes.io/name: ingress-nginx
  sessionAffinity: None
  type: LoadBalancer
status:
  loadBalancer:
    ingress:
    - ip: 999.999.999.999

Ctrl-D to save

sudo kubectl apply -f ingress-svc-edit.yaml

sudo kubectl patch -n ingress-nginx services/nginx-ingress-nginx-controller --patch '{"metadata":{"annotations":{"metallb.universe.tf/address-pool":"default"}},"spec":{"externalTrafficPolicy":"Local"}}
sudo kubectl patch deployments/nginx-ingress-nginx-controller --patch '{"spec":{"template":{"spec":{"hostNetwork":true}}}}' -n ingress-nginx





sudo kubectl create namespace cert-manager
# Used --version v0.15.1 before; now v1.3.1
sudo helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.3.1 --set installCRDs=true
sudo kubectl --namespace cert-manager create secret generic prod-route53-credentials-secret --from-literal=secret-access-key="$SECRETKEY"
```

#### ingress.yaml (edit accessKeyID)

```yaml
apiVersion: cert-manager.io/v1alpha2
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
  namespace: cert-manager
spec:
  acme:
    # The ACME server URL
    server: https://acme-v02.api.letsencrypt.org/directory
    # Email address used for ACME registration
    email: example@example.com
    # Name of a secret used to store the ACME account private key
    privateKeySecretRef:
      name: letsencrypt-prod
    # Enable the HTTP-01 challenge provider
    solvers:
      - http01:
          ingress:
            class: nginx
    #solvers:
    #- dns01:
    #   route53:
    #     region: us-east-1
    #     accessKeyID: AKIAABCDEFGHIJKLMNOP
    #     secretAccessKeySecretRef:
    #       name: prod-route53-credentials-secret
    #       key: secret-access-key
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: core-ingress
  annotations:
    kubernetes.io/ingress.class: "nginx"
    cert-manager.io/cluster-issuer: "letsencrypt-prod"
    nginx.ingress.kubernetes.io/hsts: "false"
    # nginx.ingress.kubernetes.io/add-base-url: "true"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/configuration-snippet: |
      if ($host ~ ^(?!(ci))) {
        more_clear_headers "Strict-Transport-Security";
      }
      if ($host ~ ^(.*\.?)vsekai\.([a-z]*)$ ) {
          set $subd $1;
          set $tld $2;
          set $newdomain v-sekai.$tld;
          rewrite ^/(.*)$ https://$subd$newdomain/$1;
      }
spec:
  tls:
    - hosts:
        - vsekai.cloud
        - v-sekai.cloud
        - uro.vsekai.cloud
        - uro.v-sekai.cloud
        - radiance.v-sekai.cloud
        - ci.radiance.v-sekai.cloud
        - ci.v-sekai.cloud
        - radiance.vsekai.cloud
        - ci.radiance.vsekai.cloud
        - ci.vsekai.cloud
        - hls.vsek.ai
      secretName: radiance-cert-secret1
  rules:
    - host: vsekai.cloud
    - host: v-sekai.cloud
    - host: uro.vsekai.cloud
    - host: uro.v-sekai.cloud
      http:
        paths:
          - path: /
            backend:
              serviceName: uro
              servicePort: 4000
    - host: hls.vsek.ai
      http:
        paths:
          - path: /
            backend:
              serviceName: nginx-rtmp-service
              servicePort: 80
    - host: radiance.vsekai.cloud
    - host: radiance.v-sekai.cloud
      http:
        paths:
          - path: /debug_headers
            backend:
              serviceName: echo-service
              servicePort: 8099
          - path: /
            backend:
              serviceName: echo1
              servicePort: 80
    - host: ci.vsekai.cloud
    - host: ci.v-sekai.cloud
      http:
        paths:
          - path: /
            backend:
              serviceName: gocd-server
              servicePort: 8153
    - host: ci.radiance.vsekai.cloud
    - host: ci.radiance.v-sekai.cloud
      http:
        paths:
          - path: /
            backend:
              serviceName: gocd-server
              servicePort: 8153
```

Then:

```bash
sudo kubectl apply -f ingress.yaml
```

### Setting up metallb:

#### metalconfig.yaml

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 108.85.109.49/32 # <--- this is the external. HOST IP
```

```bash
sudo kubectl create namespace metallb-system
sudo kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
sudo kubectl apply -f metalconfig.yml
sudo kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
```

### Setting up osxcross

(Optional in theory, but you have to remove enabled platforms in gocd):

Start by grabbing a legitimate copy of `MacOSX10.15.sdk.tar.xz` from your local MacBook or Mac Mini.

Then do the following to build:

```bash
cd /opt
sudo chown `whoami` .
git clone https://github.com/tpoechtrager/osxcross.git /opt/osxcross
sudo chown root .
cd /opt/osxcross
mv MacOSX10.15.sdk.tar.xz /opt/osxcross/tarballs
UNATTENDED=1 ./build.sh

# In case host OS is newer than guest OS:
cp -p /lib64/libstdc++.so.6 /opt/osxcross/target/bin/
```

On SELinux systems, you may need to give containers read permissions:

```bash
sudo chcon -R unconfined_u:object_r:container_share_t:s0  /opt/osxcross
```

### Setting up gocd:

#### gocd_values.yaml

```yaml
agent:
  image:
    # agent.image.repository is the GoCD Agent image name
    repository: "groupsinfra/gocd-agent-centos-8-groups" # agent.image.tag is the GoCD Agent image's tag
    tag: v20.7.0-groups-0.5.3
    # agent.image.pullPolicy is the GoCD Agent image's pull policy

    pullPolicy: "IfNotPresent" # agent.replicaCount is the GoCD Agent replicas Count. Specify the number of GoCD agents to run
  replicaCount: 6
  security:
    ssh:
      enabled: true
      secretName: gocd-ssh
server:
  shouldPreconfigure: false
  security:
    ssh:
      enabled: true
      secretName: gocd-ssh
  env:
    extraEnvVars:
      - name: GOCD_PLUGIN_INSTALL_gitlab-oauth-authorization-plugin
        value: https://github.com/gocd-contrib/gitlab-oauth-authorization-plugin/releases/download/v2.0.1-52-exp/gitlab-oauth-authorization-plugin-2.0.1-52.jar
```

##### Keygen

```bash
ssh-keygen -t rsa -b 4096 -C "gocd-ssh-key" -f gocd-ssh -P ''
( ssh-keyscan gitlab.com ; ssh-keyscan github.com ) > gocd_known_hosts
sudo kubectl create secret generic gocd-ssh --from-file=id_rsa=gocd-ssh --from-file=id_rsa.pub=gocd-ssh.pub --from-file=known_hosts=gocd_known_hosts

# Chart version 1.37.0 is gocd v21.2.0
sudo helm install -f gocd_values.yaml gocd gocd/gocd --version 1.37.0
sudo chcon -R -t container_file_t /kube/pvc
# Installs a trash service on port 80 by default. Let's delete it:
sudo kubectl delete ingress gocd-server
# Instead of using "kubectl scale", scale agents by editing gocd_values.yaml
# and do "sudo helm upgrade -f ...."
sudo helm install -f gocd_values.yaml gocd gocd/gocd --version 1.37.0
# Make sure to enable the agents in the web UI, and assign them to Resources and Environments.
```

#### Upgrade process (**make sure to `sudo kubectl delete ingress gocd-server` after every upgrade**):

```bash
# Disable and Delete all agents in the AGENTS tab of gocd.
Edit gocd_values.yaml and set agent version to latest (e.g. v21.2.0-groups-0.5.8)
sudo helm upgrade -f gocd_values.yaml gocd gocd/gocd --version 1.37.0
sudo kubectl delete ingress gocd-server
# Upgrade gocd-agent-dind:
sudo kubectl patch deployments/gocd-agent-dind --patch '{"spec":{"template":{"spec":{"containers":[{"name":"gocd-agent-dind","image":"gocd/gocd-agent-docker-dind:v21.2.0"}]}}}}'
# You can also use patch to upgrade gocd-agent and gocd-server instead of upgrading via helm chart. I sometimes do it that way.
# Delete the old Agents on the web interface. Wait for the new agents to come up, and enable them and assign them as appropriate.
```

#### DockerHub

Create DockerHub permissions: Create an account if you do not have one. Visit https://hub.docker.com/settings/security and create an Access Token. Copy the token.

```bash
sudo  kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=dockerhubuser --docker-password=XXXX --docker-email=your.dockerhub.email@example.com
```

#### OSXCROSS

For osxcross (OSX cross compiling), make sure the OSX compiler SDK _you created on mac_ os located at /opt/osxcross.

If you do not have osxcross (no access to Apple hardware), then you must create an empty directory at /opt/osxcross or remove the relevant volume mounts (and remove from enabled build targets in the gocd pipelines).

Now create Docker-in-Docker, and apply this file with `kubectl create -f dind.yaml` or `kubectl apply -f dind.yaml`

#### dind.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: gocd
    component: agent-dind
  name: gocd-agent-dind
  namespace: default
spec:
  progressDeadlineSeconds: 600
  replicas: 2
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: gocd
      component: agent-dind
      release: gocd
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: gocd
        component: agent-dind
        release: gocd
    spec:
      containers:
        - env:
            - name: GO_SERVER_URL
              value: http://gocd-server:8153/go
          image: gocd/gocd-agent-docker-dind:v21.2.0
          imagePullPolicy: IfNotPresent
          name: gocd-agent-dind
          resources: {}
          securityContext:
            privileged: true
          terminationMessagePath: /dev/termination-log
          terminationMessagePolicy: File
          volumeMounts:
            - mountPath: /root/.ssh
              name: ssh-secrets
              readOnly: true
            - mountPath: /root/.docker
              name: kaniko-secret
            - mountPath: /opt/osxcross
              name: opt-osxcross-volume
              readOnly: true
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext:
        fsGroup: 0
        runAsGroup: 0
        runAsUser: 0
      serviceAccount: default
      serviceAccountName: default
      terminationGracePeriodSeconds: 30
      volumes:
        - name: ssh-secrets
          secret:
            defaultMode: 256
            secretName: gocd-ssh
        - name: kaniko-secret
          secret:
            secretName: regcred
            items:
              - key: .dockerconfigjson
                path: config.json
        - name: opt-osxcross-volume
          hostPath:
            path: /opt/osxcross
            type: Directory
```

### OSXCROSS GOCD Agents

To add osxcross support to the main agents, create the following patch:

gocd-agent-patch.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: gocd-agent
spec:
  template:
    spec:
      containers:
        - name: gocd-agent
          volumeMounts:
            - mountPath: /opt/osxcross
              name: opt-osxcross-volume
              readOnly: true
      volumes:
        - name: opt-osxcross-volume
          hostPath:
            path: /opt/osxcross
            type: Directory
```

and apply with:

```bash
sudo kubectl patch deployments/gocd-agent -p "$(cat gocd-agent-patch.yaml)"
```

Make sure to enable the Agents when they come up on the GoCD Dashboard. Add every server to the "`development`" environment. Also, assign linux servers to "`mingw`" and "`linux`". Assign the dind agents to "`dind`".

For GitLab, go to https://ci.v-sekai.cloud/go/admin/security/auth_configs and select `Create new authorization configuration` -> `gitlab-auth-config` / `GitLab Authentication plugin` / follow documentation here: https://github.com/gocd-contrib/gitlab-oauth-authorization-plugin/blob/master/INSTALL.md - **Do not check Allow only known users to login yet**. If this works, you can skip the text auth step and corresponding passwd commands.

Create Guest login:

1. Go to auth_configs, `Create new authorization configuration` -> `guest-login` / `Guest Login Plugin` / Fill out Go server URL / Username `view` / Display name `Guest`.
2. Now, go to Roles Management. Create role `guest`. Add Deny for all types and Resources `*` as desired.
3. In an Incognito window, visit the CI system and login as Guest. Close the incognito window.
4. Now, go to Users Management. Select view / Guest and select Roles -> `guest`
5. Admin -> Pipelines. Select Pipeline Group `beta`, click + on the top right of the whole _group_, go to Roles, add `guest`, and only check **View**. Save this.

At this point, Guest should have permission to view pipelines, see logs, download artifacts but nothing else.

For text auth, go to https://ci.v-sekai.cloud/go/admin/security/auth_configs and select `Create new authorization configuration` -> `file-auth-config` / `Password File Authentication plugin` / `/godata/config/password.properties`

```bash
sudo kubectl exec gocd-server-6d77846995-5l244 -- touch /godata/config/password.properties
sudo yum install httpd-tools
htpasswd -c -B passwd admin
cat passwd | sudo kubectl exec gocd-server-6d77846995-5l244 -- sudo tee /kubepvc/pvc/*/godata/config/password.properties
```

Now go to users page, edit your user and enable `Global Admin`.

Now go to file-auth-config, edit configuration, enable Allow only known users to login

### gocd config repositories:

Go to **Admin -> Config Repositories**

- **Config #repository Name:** groups-gocd-pipelines
- **Plugin ID:** JSON Configuration Plugin
- **Material Type:** Git
- **URL:** git@gitlab.com:godot-groups/groups-gocd-pipelines
- **Branch:** master
- **GoCD pipeline files pattern:** \*.gopipeline.json
- **GoCD environment files pattern:** \*.goenvironment.json

**Rules**

- **Allow:** Pipeline Group: beta
- **Allow:** Environment: development

### Setup of flux2 GitOps:

```bash
curl -L https://github.com/fluxcd/flux2/releases/download/v0.24.1/flux_0.24.1_linux_amd64.tar.gz | tar -zxf - flux
sudo cp flux /usr/local/bin/flux
sudo chmod +x /usr/local/bin/flux
sudo kubectl apply -f https://github.com/fluxcd/flux2/releases/download/v0.24.1/install.yaml
```

Fork the flux-config #repository from here https://github.com/V-Sekai/flux-config into your own github account, and set GHUSER=your github account.

Now, in your fork of flux-config, go to project Settings -> Deploy Keys and add the result of the above identity command. Make sure to check **Allow write access**.

Once you have done this, you can continue with the flux setup using your newly forked repository.

```bash
export GHUSER="xxxxxxxxx"
sudo flux install
sudo flux create source git gitrepo --url=https://github.com/$GHUSER/flux-config  --branch=flux2
sudo flux create kustomization workloads --source=GitRepository/gitrepo --path="./workloads/"
sudo flux get all
```

FOR DEBUGGING ONLY: `sudo setenforce permissive` - this appears to have no effect, so there is a different problem.

### Setting up cockroachdb:

#### cockroachdb.values.yaml

```yaml
statefulset:
  resources:
    limits:
      memory: "8Gi"
    requests:
      memory: "8Gi"
conf:
  cache: "2Gi"
  max-sql-memory: "2Gi"
tls:
  enabled: true
```

#### CockroachDB install

```bash

# Helm version MAY be deprecated. We will switch to operator below.

#sudo helm install cockroachdb --values cockroachdb.values.yaml cockroachdb/cockroachdb
#sudo kubectl certificate approve default.node.cockroachdb-0
#sudo kubectl certificate approve default.node.cockroachdb-1
#sudo kubectl certificate approve default.node.cockroachdb-2
#sudo kubectl certificate approve default.client.root

wget https://raw.githubusercontent.com/cockroachdb/cockroach-operator/master/manifests/operator.yaml -O cockroach-operator.yaml
sudo kubectl apply -f cockroach-operator.yaml

wget https://raw.githubusercontent.com/cockroachdb/cockroach-operator/master/config/crd/bases/crdb.cockroachlabs.com_crdbclusters.yaml
sudo kubectl apply -f crdb.yaml

cat > cockroachdb_extra_resource_certgen.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: cockroachdb
  labels:
    app: cockroachdb
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: cockroachdb
  labels:
    app: cockroachdb
rules:
- apiGroups:
  - ""
  resources:
  - secrets
  verbs:
  - create
  - get
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cockroachdb
  labels:
    app: cockroachdb
rules:
- apiGroups:
  - certificates.k8s.io
  resources:
  - certificatesigningrequests
  verbs:
  - create
  - get
  - watch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: cockroachdb
  labels:
    app: cockroachdb
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: cockroachdb
subjects:
- kind: ServiceAccount
  name: cockroachdb
  namespace: default
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cockroachdb
  labels:
    app: cockroachdb
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cockroachdb
subjects:
- kind: ServiceAccount
  name: cockroachdb
  namespace: default

Ctrl-D


# Note: may need to set up physicalVolume and physicalVolumeClaim objects for each cockraoch node.

# The permissions may be set wrong if you are upgrading. Fix them with:
sudo chown -R 1000581000 /kube/pvc/pvc-aaaaaaaaaaaaaaaaaa /kube/pvc/pvc-bbbbbbbbbbbbbbb /kube/pvc/pvc-cccccccccccccccccccccccccccccccc

# OLD curl -o client-secure.yaml https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/client-secure.yaml
# OLD sudo kubectl apply -f client-secure.yaml

wget https://raw.githubusercontent.com/cockroachdb/cockroach-operator/master/examples/client-secure-operator.yaml
sudo kubectl apply -f client-secure-operator.yaml

sudo kubectl certificate approve default.client.uro-prod

sudo kubectl exec -it cockroachdb-client-secure -- ./cockroach sql --certs-dir=/cockroach-certs --host=cockroachdb-public
```

In SQL, write:

```sql
CREATE DATABASE uro_prod;
CREATE USER 'uro-prod' WITH PASSWORD 'blablablablaSOMEDATABASEPASSWORD';
GRANT ALL ON DATABASE uro_prod to "uro-prod";
```

To make backups:

```bash
sudo kubectl exec -it cockroachdb-client-secure -- ./cockroach dump --certs-dir=/cockroach-certs --host=cockroachdb-public uro_prod > uro_prod_backup.txt
```

Apply secrets:

```bash
(On dev machine) MIX_ENV=prod mix phx.gen.secret
# Copy the output of above, and copy the database password from above:
sudo kubectl create secret generic uro-prod --from-literal=secret-key-base='GENERATED_WITH_ABOVE_COMMAND' --from-literal=pass='blablablablaSOMEDATABASEPASSWORD'

sudo kubectl apply -f https://raw.githubusercontent.com/V-Sekai/uro/master/kubernetes.yaml
```

### Keeping the system and cluster up-to-date

#### Rotating client kubectl certificates (default ones expire after only one year)

k3s set the default client cert for root to expire after a year or so. This leads to a problem where you can't administer your own cluster because your root account's cert is expired. So I had to figure out how to fix this.

For the most part, the process I came up with matches this more concise post here: https://github.com/k3s-io/k3s/issues/2342#issuecomment-713016341

First approach, how to rotate kube client certificates:
Because we need to modify /root/.kube/config, I ran `sudo -i` to login as a root shell.

1. mkdir tls and create `tls/config.txt` with the following lines:

```
# --------------------- tls/config.txt -----------
[ req ]
distinguished_name                           = req_distinguished_name
req_extensions                                   = v3_req
prompt = no
[ req_distinguished_name ]
organizationName       = system:masters
commonName             = system:admin
[ v3_req ]
basicConstraints                                 = CA:FALSE
keyUsage                                           = critical, digitalSignature, keyEncipherment
extendedKeyUsage                            = clientAuth
# -------------------------------------------------
```

2. `cp /kube/rancher/k3s/server/tls/client-ca.crt tls/client-ca.crt`
3. `openssl ecparam -name prime256v1 -genkey -noout -out tls/new-key.pem`
4. `openssl req -new -key tls/new-key.pem -sha256 -nodes -out tls/new-req.csr -config tls/config.txt`
5. `openssl x509 -req -days 3000 -in tls/new-req.csr -CA tls/client-ca.crt -CAkey /kube/rancher/k3s/server/tls/client-ca.key -set_serial 4294742997922865905 -extensions v3_req -extfile tls/config.txt -out tls/new-client.crt`
6. `cat tls/new-client.crt tls/client-ca.crt | base64 -w0; echo`
7. `cat tls/new-key.pem | base64 -w0; echo`
8. edit .kube/config and update client-certificate-data: and client-key-data: respectively.

How to upgrade the rest of the certs.

```
find /var/lib/rancher/k3s/server/tls -name '*.crt' | while read fn; do echo $fn ===========; openssl x509 -text -in $fn | grep Not\ After | grep '202[012]'; done
```

Here is the script I ran:

```
#!/bin/bash
set -
set -x
[ -e "$1.csr" ] || openssl x509 -x509toreq -in "$1.crt" -out "$1.csr" -signkey "$1.key"
mv -i "$1.crt" "$1.crt.bak.$(date +%s)"
openssl x509 -req -in "$1.csr" -CA "client-ca.crt" -CAkey "client-ca.key" -CAcreateserial -days 3650 -out "$1.crt"
cat "client-ca.crt" >> "$1.crt"
```

you can use this process to update the client cert for /root/.kube/config

Note that etcd/client.crt actually uses its own `server-ca.key` instead of `client-ca` within the etcd folder, so you need a slight modification of the script for this one. I don't know what any of these certs do so I just did all of them

Finally, `client-k3s-controller.crt` and `client-kube-proxy.crt` must be copied from `/var/lib/rancher/k3s/server/tls` to `/var/lib/rancher/k3s/agent`

#### Upgrading fedora

Start the upgrade process with:

```bash
sudo dnf upgrade --refresh
sudo dnf install dnf-plugin-system-upgrade
sudo dnf system-upgrade download --releasever=34
```

Answer `y` to all prompts confirming list of packages and new GPG keys, if any. Once successful, it displays:

```bash
Download complete! Use 'dnf system-upgrade reboot' to start the upgrade.
To remove cached metadata and transaction use 'dnf system-upgrade clean'
The downloaded packages were saved in cache until the next successful transaction.
You can remove cached packages by executing 'dnf clean packages'.
```

Complete the upgrade with:

```bash
sudo dnf system-upgrade reboot
```

This will bring the system down for about an hour.

#### Upgrading nginx and cert-manager

```bash
sudo helm repo update
# If the stable/nginx-ingress chart is still installed, make sure to helm uninstall nginx first.
sudo helm upgrade --namespace ingress-nginx nginx ingress-nginx/ingress-nginx --set controller.replicaCount=2
sudo helm upgrade cert-manager jetstack/cert-manager --namespace cert-manager --set installCRDs=true
### I was not able to get external-dns to upgrade, but it is not user-facing so we keep running the old version.
# sudo helm upgrade external-dns --reuse-values bitnami/external-dns
```

#### Upgrading k3s

```bash
curl -sfL https://raw.githubusercontent.com/rancher/k3s/master/install.sh | sh -s - server -o /root/.kube/config --default-local-storage-path /kube/pvc --no-deploy=servicelb --disable=traefik --disable=servicelb
```

#### Upgrading cockroachdb

Run the shell:

```bash
sudo kubectl exec -it cockroachdb-client-secure -- ./cockroach sql --certs-dir=/cockroach-certs --host=cockroachdb-public
```

At the top of the shell prompt, it will say something like this. Copy the first two numbers from the CockroachDB CCL line. In this case, `20.2`

```bash
#
# Welcome to the CockroachDB SQL shell.
# All statements must be terminated by a semicolon.
# To exit, type: \q.
#
# Server version: CockroachDB CCL v20.2.2 (x86_64-unknown-linux-gnu
```

Replace `some.version` in the following command with the value we found above:

```sql
SET CLUSTER SETTING cluster.preserve_downgrade_option = 'some.version';
```

Finally, perform the upgrade:

```bash
sudo kubectl delete job cockroachdb-init
sudo helm upgrade cockroachdb cockroachdb/cockroachdb --values cockroachdb.values.yaml
curl -o client-secure.yaml https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/client-secure.yaml
sudo kubectl delete pods/cockroachdb-client-secure
sudo kubectl create -f client-secure.yaml
```

## Positive Consequences <!-- optional -->

- Knowledge gains about service creation
- Operation experience

## Negative Consequences <!-- optional -->

- Constant maintenance

## Option graveyard: <!-- same as above -->

- Option: Dedicated Servers
- Option: Virtual Machines

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Yes, it is possible to deploy this system using docker or in the root system.

## Is there a reason why this should be core and done by us?

Having experience with kubernetes and maintaining discipline will make scaling or service upgrades smoother in the future.

## References <!-- optional -->

- https://k3s.io/

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
