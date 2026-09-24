# Laboratory 03 — Multi-Cloud Explorer

## Linux Investigation

## Checkpoint 7 – Continue Your Linux Investigation

### System Information
- **Operating System**: Ubuntu 24.04 LTS
- **CPU Information**: 1–2 virtual cores
- **Memory**: 1.9 GiB total
- **Disk Space**: 19 GB total (8.9 GB free)

### Commands Used
```bash
cat /etc/os-release
lscpu
free -h
df -h

```
### If this Linux server were migrated to the cloud, which AWS, Azure, and GCP services could host it?
- **Amazon Web Services (AWS): Amazon EC2 (Elastic Compute Cloud)** — AWS provides scalable virtual machine instances with official Ubuntu Server images. You select an Ubuntu AMI, choose your CPU and memory size, and launch your server — the     same Linux environment runs unchanged.
- **Microsoft Azure: Azure Virtual Machine** — Azure offers pre-configured Ubuntu images. You create a virtual machine, select Ubuntu 24.04 LTS as your operating system, and run your Linux environment identically to KillerCoda.
- **Google Cloud Platform (GCP): Google Compute Engine (GCE)** — GCE provides official Ubuntu images from Canonical. You create a VM instance, pick Ubuntu as your OS, and your terminal, commands, and files work exactly as they do in the          KillerCoda playground.
# All three platforms support Ubuntu Linux fully — every command, file, and process used in this investigation will run without modification in the cloud.
