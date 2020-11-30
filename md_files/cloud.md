# GCP무료 티어로 리눅스 서버 간단히 만들어 돌리기

https://youtu.be/u7LvG-deMOE

<!-- vim-markdown-toc GFM -->

* [1. ssh접속을 위한 key 생성시 주의해야할 사항](#1-ssh접속을-위한-key-생성시-주의해야할-사항)
   * [puttygen을 이용해서 만들 때 save public key로 하는게 아니고 위에 생성된 문자열을 '.pub'확장자로 저장해서 이용해야한다. 그렇지 않으면 PEM형식으로 저장이 되기 때문에 Oracle Cloud에선 받아드리지 않는다.](#puttygen을-이용해서-만들-때-save-public-key로-하는게-아니고-위에-생성된-문자열을-pub확장자로-저장해서-이용해야한다-그렇지-않으면-pem형식으로-저장이-되기-때문에-oracle-cloud에선-받아드리지-않는다)
* [2. oracle cloud](#2-oracle-cloud)
* [3. console접속에 관련 참조 페이지](#3-console접속에-관련-참조-페이지)
* [4. vm안에 설치한 mysql에 접속하기 위한 스텝](#4-vm안에-설치한-mysql에-접속하기-위한-스텝)
* [ssh openssh key and putty key](#ssh-openssh-key-and-putty-key)
* [기본 ssh포트 바꾸기](#기본-ssh포트-바꾸기)

<!-- vim-markdown-toc -->

## 1. ssh접속을 위한 key 생성시 주의해야할 사항

### puttygen을 이용해서 만들 때 save public key로 하는게 아니고 위에 생성된 문자열을 '.pub'확장자로 저장해서 이용해야한다. 그렇지 않으면 PEM형식으로 저장이 되기 때문에 Oracle Cloud에선 받아드리지 않는다.

참고한 페이지

> https://qiita.com/oradocter/items/f58116901186bf932b54

## 2. oracle cloud

1. oracle-free-instance-vim -> name of instance
2. ssh이용해서 접속
3. 사용 ssh파일 vim-gil
4. 비번은골뱅이와 에스로 시작

## 3. console접속에 관련 참조 페이지

> https://archmond.net/?p=10557

## 4. vm안에 설치한 mysql에 접속하기 위한 스텝

---

mysql을 설치하고 먼저 아무곳에서 접속할 수 있는 user를 만들고

```mysql
mysql> CREATE USER 'root'@'%' IDENTIFIED BY 'root';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
```

root에는 자신이 원하는 ID가 들어가면 된다.

https://stackoverflow.com/questions/50177216/how-to-grant-all-privileges-to-root-user-in-mysql-8-0/50197630

```
vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

이 파일의 bind-address=127.0.0.1부분을 주석처리 해준다
https://pjt3591oo.github.io/blog/database/2017/05/03/abou_mysql_remote_connect.html

---

1. vm을 만든다.
2. vm 만들 때 vcn을 구성한다
3. 구성을 한 곳(public subnet)에서 3306포트를 열어준다.
   ![image](post-img/cloud/92327421-ac9cba80-f094-11ea-8fb4-c6ba2a9ad715.png)

![image](post-img/cloud/92327421-ac9cba80-f094-11ea-8fb4-c6ba2a9ad715.png)

![image](post-img/cloud/92327421-ac9cba80-f094-11ea-8fb4-c6ba2a9ad715.png)

4. firewalld

```bash
$ sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
```

5.  ufw 활성화 또는 비활성화

```bash
$ sudo ufw enable
$ sudo ufw disable
$ sudo ufw allow 3306/tcp
```

https://lindarex.github.io/ubuntu/ubuntu-firewalld-installation/

6.  linux 재부팅

```
$ sudo reboot
```

7. 다른 터미널에서 접속 확인
   ![image](post-img/cloud/92327421-ac9cba80-f094-11ea-8fb4-c6ba2a9ad715.png)
   ![image](post-img/cloud/92327421-ac9cba80-f094-11ea-8fb4-c6ba2a9ad715.png)

마지막 연결 명령어

```bash
mysql -h 140.238.31.245 -u sa82trip -p
```

## ssh openssh key and putty key

이 두개의 키는 conversion을 해줘야 서로 쓸 수 있다.
그리고 oracle vm에 접속하기 위해서는 리눅스에서는 private key에 모드를 바꿔줘야 한다.

```bash
$ chmod 400 <private key>
```

현재 wsl2내 ssh파일 저장 장소

> /home/sa82trip/.ssh/final
> 여기서 vim-gil을 사용하면 됨

## 기본 ssh포트 바꾸기

> 보안에 좋지 않기 때문에 22에서 1만 이상의 번호를 가진 포트로 바꾸는게 좋다.

1. 방화벽에 포트 추가해주기

```bash
ufw allow {원하는포트번호}
```

2. etc/ssh/sshd_config 파일의 포트를 1과 같게 설정
3. ssh서버 재시작

```bash
$ sudo service ssh restart
```
