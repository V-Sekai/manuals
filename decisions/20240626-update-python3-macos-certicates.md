# Proposed: Update python3 macOS Certificates

## The Context

In the current scenario, all Python network certificates are not functioning as expected. This is causing a significant hindrance in the smooth execution of network-related tasks and operations.

## The Problem Statement

All python network certificates don't work on the Macos.

## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams

Here is a Python script that installs or updates a set of default Root Certificates for the SSL module using the certificates provided by the certifi package:

```python
# Install_Certificates.command
# install_certifi.py
#
# sample script to install or update a set of default Root Certificates
# for the ssl module.  Uses the certificates provided by the certifi package:
#       https://pypi.python.org/pypi/certifi

import os
import os.path
import ssl
import stat
import subprocess
import sys

STAT_0o775 = ( stat.S_IRUSR | stat.S_IWUSR | stat.S_IXUSR
             | stat.S_IRGRP | stat.S_IWGRP | stat.S_IXGRP
             | stat.S_IROTH |                stat.S_IXOTH )


def main():
    openssl_dir, openssl_cafile = os.path.split(
        ssl.get_default_verify_paths().openssl_cafile)

    print(" -- pip install --upgrade certifi")
    subprocess.check_call([sys.executable,
        "-E", "-s", "-m", "pip", "install", "--upgrade", "certifi"])

    import certifi

    # change working directory to the default SSL directory
    os.chdir(openssl_dir)
    relpath_to_certifi_cafile = os.path.relpath(certifi.where())
    print(" -- removing any existing file or link")
    try:
        os.remove(openssl_cafile)
    except FileNotFoundError:
        pass
    print(" -- creating symlink to certifi certificate bundle")
    os.symlink(relpath_to_certifi_cafile, openssl_cafile)
    print(" -- setting permissions")
    os.chmod(openssl_cafile, STAT_0o775)
    print(" -- update complete")

if __name__ == '__main__':
    main()
```

## The Benefits

The proposed solution will ensure that the Python network certificates are updated and functioning correctly. This will facilitate smooth network operations and tasks.

## The Downsides

There might be some initial downtime during the update process. Also, any issues with the certifi package could potentially affect the certificate update process.

## The Road Not Taken

An alternative approach could have been to manually update each certificate. However, this would have been a time-consuming and error-prone process.

## The Infrequent Use Case

This solution may not be applicable for systems that do not use Python or where network certificates are managed differently.

## In Core and Done by Us

The proposed solution is core to our operations as it directly impacts the functionality of our network operations. The implementation will be done by us, the V-Sekai development team.

## Status

Status: Proposed <!-- Draft | Proposed | Rejected | Accepted | Deprecated | Superseded by -->

## Decision Makers

- V-Sekai development team

## Tags

- V-Sekai

## Further Reading

1. [V-Sekai · GitHub](https://github.com/v-sekai) - Official GitHub account for the V-Sekai development community focusing on social VR functionality for the Godot Engine.
2. [V-Sekai/v-sekai-game](https://github.com/v-sekai/v-sekai-game) is the GitHub page for the V-Sekai open-source project, which brings social VR/VRSNS/metaverse components to the Godot Engine.

AI assistant Aria assisted with this article.
