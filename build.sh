#--no-cache
docker image build -t hugh/myflask .
docker rmi $(docker images -q --filter "dangling=true")
docker images