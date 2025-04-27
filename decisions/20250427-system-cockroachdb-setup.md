# Draft: CockroachDB v22.1 Systemd Service Setup

## The Context

CockroachDB provides a resilient and scalable SQL database solution suitable for backend services. For reliable operation within the V-Sekai infrastructure, managing CockroachDB (specifically version 22.1 as used in our stack) via systemd ensures consistent startup, monitoring, and recovery.

## The Problem Statement

Manually starting, stopping, and configuring a secure CockroachDB cluster node is cumbersome and prone to error. Without systemd management, the database process won't automatically restart on failure or system reboot, and applying security configurations consistently becomes challenging.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

This proposal outlines setting up a single CockroachDB v22.1 node as a secure systemd service on Linux.

**1. Installation:**
Download the CockroachDB v22.1 binary and place it in `/usr/local/bin/` (as described in #attachment).

```bash
# Download and extract
curl https://github.com/V-Sekai/cockroach/releases/download/v22.1.64b21683521d9a8735ad/cockroach-v22.1.64b21683521d9a8735ad.linux-amd64.tgz | tar -xz
sudo cp -i cockroach-v22.1.linux-amd64/cockroach /usr/local/bin/

# Optional: Install spatial libraries (if needed)
mkdir -p /usr/local/lib/cockroach
sudo cp -i cockroach-v22.1.linux-amd64/lib/libgeos.so /usr/local/lib/cockroach/
sudo cp -i cockroach-v22.1.linux-amd64/lib/libgeos_c.so /usr/local/lib/cockroach/
```

**2. Security Setup:**
Generate CA, node, and client certificates. Store them in a secure directory (e.g., `/var/lib/cockroach/certs`). Ensure appropriate permissions.

```bash
# Create directories
DATA_DIR="/var/lib/cockroach"
CERT_DIR="${DATA_DIR}/certs"
sudo mkdir -p "${CERT_DIR}"
sudo chown -R cockroach:cockroach "${DATA_DIR}" # Assuming a 'cockroach' user/group exists
sudo chmod 700 "${DATA_DIR}"

# Generate Certs (run as cockroach user or adjust permissions after)
cockroach cert create-ca --certs-dir="${CERT_DIR}" --ca-key="${CERT_DIR}/ca.key"
cockroach cert create-node localhost $(hostname -f) --certs-dir="${CERT_DIR}" --ca-key="${CERT_DIR}/ca.key"
cockroach cert create-client root --certs-dir="${CERT_DIR}" --ca-key="${CERT_DIR}/ca.key"
```

**3. Systemd Service:**
Create a systemd unit file `/etc/systemd/system/cockroachdb.service`.

```ini
# File: /etc/systemd/system/cockroachdb.service
[Unit]
Description=CockroachDB Single-Node SQL Database Server
After=network.target

[Service]
User=cockroach
Group=cockroach
WorkingDirectory=/var/lib/cockroach
# For a single-node setup:
ExecStart=/usr/local/bin/cockroach start-single-node \
    --certs-dir=/var/lib/cockroach/certs \
    --store=/var/lib/cockroach/data \
    --listen-addr=0.0.0.0:26257 \
    --http-addr=0.0.0.0:8080 \
    --cache=.25 \
    --max-sql-memory=.25

# For a multi-node cluster setup, replace ExecStart with:
# ExecStart=/usr/local/bin/cockroach start \
#     --certs-dir=/var/lib/cockroach/certs \
#     --store=/var/lib/cockroach/data \
#     --listen-addr=0.0.0.0:26257 \
#     --http-addr=0.0.0.0:8080 \
#     --join=<node1-ip>:26257,<node2-ip>:26257,<node3-ip>:26257 \
#     --cache=.25 \
#     --max-sql-memory=.25

TimeoutStopSec=60
Restart=always
RestartSec=10
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=cockroachdb
LimitNOFILE=1048576

[Install]
WantedBy=multi-user.target
```

_Note: The default `ExecStart` uses `cockroach start-single-node`. For a multi-node cluster, comment out the `start-single-node` command and uncomment/adjust the `cockroach start` command, ensuring the `--join` addresses are correct._
_Note: Create the `cockroach` user and group if they don't exist._
_Note: Create the data directory `/var/lib/cockroach/data` and set ownership._

**4. Enable & Start:**

```bash
sudo systemctl daemon-reload
sudo systemctl enable cockroachdb.service
sudo systemctl start cockroachdb.service
sudo systemctl status cockroachdb.service
```

## The Benefits

- **Reliability:** Automated startup, restarts, and management via systemd.
- **Security:** Enforces secure cluster communication using TLS certificates.
- **Consistency:** Standardized setup across different machines.
- **Manageability:** Easy to start, stop, check status using `systemctl`.

## The Downsides

- **Initial Complexity:** Certificate generation and systemd unit file creation require careful setup.
- **Systemd Dependency:** Relies on Linux distributions using systemd.
- **Configuration Management:** Cluster join info and other flags need proper management.

## The Road Not Taken

- **Manual Execution:** Running `cockroach start` manually in `screen` or `tmux` lacks robustness.
- **Docker/Kubernetes:** While viable (#attachment), direct systemd integration is chosen for simplicity in specific VM-based scenarios.
- **Insecure Mode:** Running without TLS certificates is not suitable for production or sensitive data.

## The Infrequent Use Case

- Running temporary, insecure, single-node instances for quick local testing (`cockroach demo` or `cockroach start-single-node --insecure`).

## In Core and Done by Us

Reliable database infrastructure is core to V-Sekai's backend. This setup will be implemented and maintained by the infrastructure team.

## Status

Status: Draft <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai Development Team / Infrastructure Team

## Tags

- CockroachDB, Database, Systemd, Linux, Security, Infrastructure, v22.1

## Further Reading

1. [Install CockroachDB on Linux (v22.1)](https://www.cockroachlabs.com/docs/v22.1/install-cockroachdb-linux.html) (#attachment)
2. [CockroachDB Manual Deployment](https://www.cockroachlabs.com/docs/v22.1/manual-deployment.html)
3. [CockroachDB `start` command](https://www.cockroachlabs.com/docs/v22.1/cockroach-start.html)
4. [Systemd Service Unit Documentation](https://www.freedesktop.org/software/systemd/man/systemd.service.html)

---

### Game Development Jargon

1. **CockroachDB**: A distributed SQL database designed for scalability and resilience.
2. **Systemd**: A system and service manager for Linux.
3. **CA (Certificate Authority)**: An entity that issues digital certificates.
4. **TLS Certificate**: A digital certificate used to establish secure communication channels (like HTTPS or secure database connections).
