set -e

docker images --format "{{.Repository}}" | grep -vE 'gcr.io|java' | while read IMAGE_NAME ; do
	REGISTRY_NAME=gcr.io/$GCLOUD_PROJECT_ID/$IMAGE_NAME
  docker tag $IMAGE_NAME $REGISTRY_NAME
  gcloud docker -- push $REGISTRY_NAME
done
