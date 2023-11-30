# 基础镜像库

## 使用

### 登录

默认使用的是 [docker hub](https://hub.docker.com/) 来管理镜像库，如果用 [harbor](https://goharbor.io/) 等制品库进行管理，配置一下 docker 的 config
然后 `env.sh` 中的 `repo_url` 配置为对应制品库的 url 即可。

```shell
vi ~/.docker/config.json

{
  "auths": {
    "https://index.docker.io/v1/": {
        "auth": "yourauth"
    },
    "registry2.leangoo.com:4443": {
        "auth": "yourauth"
    },
  "experimental": "disabled",
  "stackOrchestrator": "swarm"
}%
```

使用`docker login`进行登录，方便以后进行`docker push`操作

### 构建并推送应用

1. 修改 env.sh 配置

2. 构建并推送

`proxy` 为本地机器的代理地址，最好使用代理来进行操作，不然各种网络问题

```shell
# 构建镜像
HTTPS_PROXY=http://host.docker.internal:1235  sh build.sh
# 推送到docker hub
sh push.sh
```
