### wsl root password reset

```bash
C:\Windows\system32>wsl --user root
root@AnSangKil:/mnt/c/Windows/system32# passwd
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully

root@AnSangKil:/mnt/c/Windows/system32#
root@AnSangKil:/mnt/c/Windows/system32# passwd sa82trip

Enter new UNIX password:
Retype new UNIX password:



root@AnSangKil:/mnt/c/Windows/system32# exit
logout

C:\Windows\system32>bash
mezzo@AnSangKil:/mnt/c/Windows/system32$
```

## memory leaking
C:\Users\<사용자이름>\.wslconfig 파일을 하나 만들어서 아래 내용 입력
```

[wsl2]

memory=3GB

swap=0


```


파워쉘 열어서

# 현재 실행중인 배포판 확인

 wsl -l --running

# WSL 2 해당 배포판 종료

wsl -t Ubuntu-20.04


