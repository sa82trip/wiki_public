---
layout  : wiki
title   : nginx
summary : 
date    : 2020-11-10 23:32:21 +0900
updated : 2020-11-11 00:02:08 +0900
tags    : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

# 

## initial server setting
1. 설치
2. make own app nginx file in /etc/nginx/sites-available  
3. make simbolic link
```bash
sudo ln -s {sites-available} {sites-enable}
```
4. config ex)
```
server {
    listen 80;
    root /home/ubuntu/react-flask-app/build;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}

```
5. make virtual enviroment for python flask and source it
```bash
$ python3 -m venv venv
```
6. install gunicorn
```zsh
$ pip install gunicorn
```
7. try to start gunicorn
```zsh
$ gunicorn -b 127.0.0.1:5000 api:app
```
8. check if it is running correctly(use web browser)
