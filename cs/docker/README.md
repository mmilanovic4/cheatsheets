# Docker - корисне наредбе

**Листинг свих слика/контејнера**

```
docker image ls
docker container ls -a
```

**Слике**

```
docker build -t hello:1.0 .
docker build --tag hello:1.0 .
```

**Контејнери**

```
docker run hello:1.0
docker run -p 127.0.0.1:1234:80 hello:1.0
docker run --publish 127.0.0.1:1234:80 hello:1.0
```

**Чишћење**

```
docker image rm 93fd78260bd1
docker container rm f108b1f96f09
```
