# Two-Tier Architecture

## Web / Application Tier
This is the part users interact with directly. It serves the Nextcloud interface, handles all HTTP requests, manages file uploads and downloads, and processes user actions. It acts as the front-facing gateway to the system and communicates with the database behind the scenes.

## Database Tier
This tier stores all persistent information including user accounts, credentials, file metadata, and application settings. It runs MariaDB, a reliable open-source database system, and is designed to keep data safe, organized, and durable.

## Why Separate Them?
Separating the web application and the database into different containers makes the system more flexible and reliable. Each component can be updated, scaled, or restarted independently without affecting the other. It also improves security — the database is not exposed directly to the internet — and allows each service to run with its own optimized resources and configurations.
