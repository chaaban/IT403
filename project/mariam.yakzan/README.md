# Automated Backup Script

The Automated Backup Script is a bash script that automates the process of backing up important files and directories on a Linux server.It provides an efficient way to create backups, compress them using various compression methods and verify their integrity.

## Features

- Copy specified files and directories to a backup destination.
- Create a timestamped directory for each backup session.
- Create a log file to record the progress and errors encountered during the backup process.
- Compress backup files into a single archive using zip, gzip, or lzma compression methods.
- Verify the integrity of the backup archive.

### Prerequisites

- Linux server with root privileges.
- Bash shell.

#### Usage

1. Clone the repository or download the backup script to your Linux server.

2. Make the script executable by running the following command:

  ` sudo backup.sh zip or gzip` or lzma
