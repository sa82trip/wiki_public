# mysql basic setting

1.  install
2.  use homebrew

```bash
brew install mysql // 설치
mysql_secure_installation //보안 설정
mysql.server start //서버 실행
mysql -uroot -p // 서버 접속
exit 또는 quit // logout
MySQL 서버 종료: mysql.server stop
```

3.  MySQL 삭제

아래의 명령어들을 입력해준다.

```bash
sudo rm -rf /usr/local/var/mysql
sudo rm -rf /usr/local/bin/mysql\*
sudo rm -rf /usr/local/Cellar/mysql
```

4.  spring boot -> application.properties에 db접속 정보를 넣어야 한다.

# user 생성하고 password와 권한 주는 방법

     [mysql공식](https://dev.mysql.com/doc/refman/8.0/en/create-user.html)
     https://stackoverflow.com/questions/50177216/how-to-grant-all-privileges-to-root-user-in-mysql-8-0/50197630
