#!/bin/bash
# 博客工作目录
export BLOG_PATH=/develop/hexo
# 待上传的博客静态文件目录
export UPLOAD_PATH=/develop/hexo/public

# FTP空间访问地址
export FTP_HOST=101.200.201.68
# FTP空间网站根路径
export FTP_ROOT_PATH=/htdocs
# FTP用户名
export FTP_USERNAME=byu7335040001
# FTP密码
export FTP_PASSWORD=yaoziyi123,

open $FTP_HOST
user $FTP_USERNAME $FTP_PASSWORD
