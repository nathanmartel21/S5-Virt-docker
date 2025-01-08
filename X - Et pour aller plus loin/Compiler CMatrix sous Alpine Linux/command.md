Contenu du Dockerfile : 

```
FROM alpine
LABEL org.opencontainers.image.authors="Nathan MARTEL"
LABEL org.opencontainers.image.description="Container image for CMatrix"
WORKDIR /cmatrix
RUN apk add git && git clone https://github.com/abishekvashok/cmatrix . && apk add autoconf && apk add automake && autoreconf -i && apk add alpine-sdk && mkdir -pv /usr/lib/kbd/consolefonts && mkdir -pv /usr/share/consolefonts && apk add ncurses-dev ncurses-static && ./configure LDFLAGS="-static" && make
CMD ["./cmatrix"]
```
Lancement : 

```
docker build -t nathanmartel21/cmatrixbyme .
docker run --rm -it nathanmartel21/cmatrixbyme
```
