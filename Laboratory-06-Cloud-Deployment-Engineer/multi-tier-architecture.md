# Two-Tier Application Architecture

## Web / Application Tier
This is the front-facing layer that users interact with directly. It serves the Nextcloud user interface, handles all HTTP requests, manages file uploads and downloads, and executes user-initiated actions. It communicates with the database tier behind the scenes to store and retrieve information. This tier runs the Nextcloud application and is the only part exposed to the network.

## Database Tier
This tier stores all persistent data including user accounts, credentials, file metadata, preferences, and application settings. It uses MariaDB — a reliable, open-source relational database system — to organize, store, and protect information. This tier is not accessible directly from outside; only the application tier can connect to it.

## Why Separate Them?
Separating the web application and database into independent containers offers several key advantages. Each component can be updated, restarted, or scaled independently without affecting the other. It also improves security — the database remains private and is never exposed directly to the public internet. Additionally, each service can be optimized for its own resource needs, making the entire system more reliable, maintainable, and easier to manage.
