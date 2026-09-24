
# Storage Types Research

## Comparison of Cloud Storage Types

| Storage Type | Description | Primary Use Case | Cloud Provider Example |
|---|---|---|---|
| Block Storage | Stores data in fixed-sized blocks that can be attached to a virtual machine as a storage volume. | Operating system disks, databases, and applications that need direct access to storage volumes. | Amazon Elastic Block Store (AWS EBS) |
| File Storage | Stores data in files and folders that can be accessed through a shared file system. | Shared folders, team file storage, and applications that require a common file system. | Amazon Elastic File System (AWS EFS) |
| Object Storage | Stores data as objects that include the file, metadata, and a unique identifier. Objects are organized inside containers called buckets. | Images, videos, backups, documents, and other unstructured data. | Amazon Simple Storage Service (Amazon S3) |

## Why Object Storage Is Suitable for the Client

Object Storage is suitable for the client's photo-sharing application because it is designed to store large amounts of unstructured data, such as user-uploaded images. The images can be stored as objects inside a bucket, while the application can access them through storage services. This approach helps separate the uploaded photos from the web server container and supports organized data management.
