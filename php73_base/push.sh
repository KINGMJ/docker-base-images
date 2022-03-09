#!/bin/sh

# 从配置文件中读取配置
source ./env.sh

# 打标签的命令
tag_command="docker image tag ${image_name}:${version} ${repo_url}/${image_name}:${version}"
# push 命令
push_command="docker push ${repo_url}/${image_name}:${version}"

# 执行打标签操作
echo "${tag_command}"
$tag_command

# 执行推送镜像操作
echo "${push_command}"
$push_command

