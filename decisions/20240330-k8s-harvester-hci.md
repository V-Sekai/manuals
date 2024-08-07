# Accepted: k8s on harvester hci

## The Context

Kubernetes is a standard for managing containerized applications. Harvester, an open-source HCI software built on Kubernetes, manages virtual machines, storage, and network resources. Installing Rancher on Harvester enhances Kubernetes management.

## The Problem Statement

The challenge is installing Rancher directly on a Harvester VM using the `rancher-vcluster` addon, which allows Rancher Manager to run as a workload on the Harvester cluster.

## Solution

The solution involves:

1. Installing the `rancher-vcluster` Addon
   The `rancher-vcluster` addon is not packaged with Harvester, but you can find it in the experimental-addons repository.

Assuming you are using the Harvester kubeconfig, you can run the following command to apply the YAML file:

```bash
ssh rancher@xxx.xxx.xxx.xx
sudo kubectl apply -f https://raw.githubusercontent.com/harvester/experimental-addons/main/rancher-vcluster/rancher-vcluster.yaml
# Users can define the rancher url and password via addon interface.
# hostname: "rancher.172.19.108.3.sslip.io"
# password: "hunter2"
# Open https://rancher.192.168.0.65.sslip.io/dashboard/auth/setup
```

This command will fetch the `rancher-vcluster.yaml` file from the `experimental-addons` repository and apply it to your Kubernetes cluster.

2. **Configuring the Addon**: Configure the addon through the Harvester UI under Advanced > Addons. Edit the config for the `rancher-vcluster` addon, specify a hostname that points to the Harvester VIP and set a bootstrap password for Rancher.
3. **Accessing Rancher**: Access Rancher using the DNS hostname provided during configuration after installation.

This approach integrates Rancher into Harvester, leveraging Harvester's infrastructure to manage both VMs and containers centrally.

### To forcefully remove a Kubernetes namespace that is stuck in the `Terminating` state, you can follow these steps:

1. **Edit the namespace to remove its finalizers:**

   First, you'll need to edit the namespace to remove any finalizers that are preventing it from being deleted.

   ```sh
   kubectl get namespace rancher-vcluster -o json > tmp.json
   ```

2. **Open the `tmp.json` file and remove the `finalizers` field:**

   Look for the `spec` section and remove the `finalizers` array. It should look something like this:

   ```json
   "spec": {
     "finalizers": [
       "kubernetes"
     ]
   }
   ```

   After removal, it should look like this:

   ```json
   "spec": {}
   ```

3. **Apply the modified JSON back to the cluster:**

   ```sh
   kubectl replace --raw "/api/v1/namespaces/rancher-vcluster/finalize" -f ./tmp.json
   ```

4. **Verify the namespace has been deleted:**

   ```sh
   kubectl get namespaces
   ```

If the namespace still does not delete, you may need to manually clean up resources within the namespace before retrying the above steps.

#### Important Note:
Forcefully removing a namespace can lead to orphaned resources. Ensure that you understand the implications of this action and have backups if necessary.

## The Benefits

This setup enables creation and management of Kubernetes clusters through Harvester's integration with Rancher and deployment of a Kubernetes cluster based on specific requirements (K3s).

## The Downsides

The process can be complex and requires attention to detail. Misconfiguration could lead to issues with the installation or operation of Harvester and Rancher.

## The Road Not Taken

An alternative could be a network-based installation method, not feasible in an air-gapped environment.

## The Infrequent Use Case

This setup is useful in environments where internet access is restricted or unavailable, necessitating the use of the `rancher-vcluster` addon.

## In Core and Done by Us

The user performs the entire process of installing and configuring the `rancher-vcluster` addon with guidance from this proposal.

## Status

Status: Accepted

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) - GitHub page for the V-Sekai open-source project bringing social VR/VRSNS/metaverse components to the Godot Engine
3. [Rancher Vcluster](https://docs.harvesterhci.io/v1.2/advanced/addons/rancher-vcluster)

AI assistant Aria assisted with this article.
