
# Mission Reflection

This laboratory activity helped me understand how Object Storage can be used in cloud applications. Object Storage is suitable for storing millions of photos because it is designed for unstructured data, such as images and videos. Instead of keeping all the photos inside a web server container, the application can store the files in a bucket and access them when needed. This separation can help organize application data and reduce dependence on the temporary storage of containers.

Docker made the deployment of MinIO easier because it allowed me to run the storage server using a container. Instead of installing and configuring every component manually, I used a Docker command to download the MinIO image, set the environment variables, and expose the required ports. I also learned that checking the running container with `docker ps` is important when verifying whether a service is working.

A bucket is a storage container used to organize objects in an object storage system. In this activity, I created a bucket named `client-photos` and uploaded a sample file through the MinIO Web Console. This helped me understand how files can be managed through a cloud storage interface.

Large enterprise companies can protect their object storage data by using backups, replication, access controls, monitoring, and recovery plans. They may also store copies of data in different locations so that a physical server failure does not permanently destroy the information. These methods help improve data availability and recovery.

My confidence in using the Linux command line is gradually improving. At first, Docker commands and port configurations required careful attention. After deploying MinIO and checking the container status, I became more comfortable entering commands, reading terminal output, and connecting a command-line environment to a web-based cloud service.
