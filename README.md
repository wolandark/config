# OS and Apps Configuration Script

## Overview

This bash script automates the setup and installation of essential tools and applications on my Linux system. It includes the installation of popular software such as VSCodium, Spotify, Google Chrome, Zsh, Oh My Zsh, and Python packages.

## Prerequisites

- A Debian-based operating system
- Bash shell

## Usage

1. Open a terminal.

2. Clone the repository:

   ```bash
   git clone https://github.com/AFzOfficial/config.git
   ```

3. Navigate to the script directory:

   ```bash
   cd config
   ```

4. Make the script executable:

   ```bash
   chmod +x setup.sh
   ```

5. Run the script:

   ```bash
   ./setup.sh
   ```

## Configuration

The script performs the following actions:

- Updates the package list using `apt`.
- Installs essential tools: Vim, Git, Curl, and Wget.
- Installs VSCodium, a free and open-source distribution of Visual Studio Code.
- Installs Spotify and applies a fix to the desktop file.
- Installs Google Chrome.
- Installs Zsh and Oh My Zsh with autosuggestions plugin.
- Installs Python 3, pip, and virtual environment tools.

## Notes

- Ensure that your user account has sudo privileges.
- Review the script content before execution to understand the actions it performs.
- Address any errors or warnings that may occur during execution.

**Disclaimer:** Use this script at your own risk. It is recommended to review and understand the commands before running the script on your system.