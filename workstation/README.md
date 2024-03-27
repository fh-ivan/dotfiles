# Creating custom workstations

Following the instructions in https://cloud.google.com/workstations/docs/customize-container-images

Need to create a repository in [artifact registry](https://console.cloud.google.com/artifacts/browse/fh-dev-svc?project=fh-dev-svc) (for example named "workstation")

```bash
# Authenticate gcloud for docker and our specific region
$ gcloud auth configure-docker asia-south1-docker.pkg.dev

# Build the image
# <location>-docker.pkg.dev/<project>/<registry name>/<image-name>:<tag>
$ docker build . -t asia-south1-docker.pkg.dev/fh-dev-svc/workstation/code-oss-terraform:latest

# Push the image to the repository (latest tag by default)
$ docker push asia-south1-docker.pkg.dev/fh-dev-svc/workstation/code-oss-terraform
```
