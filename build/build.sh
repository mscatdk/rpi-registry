export APP_VERSION=2.7.1

mkdir -p /go/src/github.com/docker

cd /go/src/github.com/docker
pwd
git clone https://github.com/docker/distribution.git
cd distribution/
git checkout tags/v$APP_VERSION -b release/v$APP_VERSION

go get ./...
GOOS=linux GOARCH=arm make binaries

echo "Build completed... Run docker cp $(hostname):/go/bin/registry ./binary"

while true
do
    echo "Press [CTRL+C] to stop.."
    sleep 5
done
