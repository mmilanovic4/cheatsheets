# Docker

**Status/List all images/containers**

```
docker version

docker image ls
docker container ls -a
```

**Docker images**

```
docker image build -t hello:1.0 .
docker image build --tag hello:1.0 .
```

**Docker containers**

```
docker container run hello:1.0
docker container run -p 127.0.0.1:1234:80 hello:1.0
docker container run --publish 127.0.0.1:1234:80 hello:1.0
```

**Clean-up**

```
docker image rm 93fd78260bd1
docker container rm f108b1f96f09
```

**Run a command in a running container/Logs**

```
docker container run --interactive --tty ubuntu /bin/bash
docker container run -it ubuntu /bin/bash

docker logs 6178ada3cc94
```

[***Dockerfile* - example**](Dockerfile)
