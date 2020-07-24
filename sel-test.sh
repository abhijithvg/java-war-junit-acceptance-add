#!/bin/sh

docker_user=schogini
image_name=tc
build_id=39

if [ $# -eq 3 ]; then
  docker_user=$1
  image_name=$2
  build_id=$3
elif [ $# -eq 2 ]; then
  docker_user=$1
  build_id=$2
elif [ $# -eq 1 ]; then
	build_id=$1
fi

docker network create test-nw
docker inspect my-tcc2 >/dev/null 2>&1 && docker rm -f my-tcc2 || echo No container to remove. Proceed.
docker run --net=test-nw -id -p 7081:8080 --name my-tcc2 docker.io/"$docker_user"/"$image_name":"$build_id"
qq=$(docker run -ti --net=test-nw --rm -e tomcaturl=my-tcc2:8080 docker.io/"$docker_user"/selenium-tomcat-test|grep -o "Pass" | wc -l)

docker rm -f my-tcc2
docker network rm test-nw

if [ $qq -eq 2 ]; then
	echo "SUCCESS" > result.txt
else
	echo "FAILED" > result.txt
fi
cat result.txt

# sh sel-test.sh abhijithvg tomcat pipeline-18
