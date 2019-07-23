FROM golang AS build-env
MAINTAINER kongsvip@163.com
ADD . /go/src/app
WORKDIR /go/src/app
RUN GOOS=linux go build -v -o /go/src/app/goweb-ci

FROM alpine
RUN apk add -U tzdata
RUN ls -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY --from=build-env /go/src/app/goweb-ci /usr/local/bin/goweb-ci
EXPOSE 80
CMD ["goweb-ci"]

