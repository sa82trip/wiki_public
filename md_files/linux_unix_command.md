# command list

1. cp command
1. copy file or directory

```bash
cp .vimrc ~/documents/test/.vimrcCP
```

이러면 뒤에 있는 경로에 .vimrcCP이름의 파일로 복사

2. scp command

SSH로 server.com에 git 폴더 내용을 복사.

```bash
$ scp -rp ./git user@server.com:~
```

3. rsync command

SSH 또는 로컬 파일 동기화. (차이가 있는 부분만 복사)

```bash
$ rsync -avz user@server.com:/git /git
```

4. 기타

바로 전 폴더로 돌아가기

```bash
$ cd -
```

5. 파일 만들기

```bash
$ touch test.md
```

파일 상태 감시하면서 보기(주로 로그)

```bash
$ tail -f test.md
```

6. 명령어 위치 찾기

```bash
$ which python
```

7. symbolic link 만들기

```bash
ln -s {taget file} {resut file}
```

> result file이 링크가 되는것.
