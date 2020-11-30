# zsh shell

## use vi key on terminal

By default, most shells use emacs-style key bindings for command-line editing and modification. For users of vi or vim, however, you can instead configure shells to use vi key bindings instead. This is done by editing ~/.bashrc in the case of bash, or ~/.zshrc in zsh and adding:

    set -o vi

in bash, and the following for zsh:

    bindkey -v

make real simple zsh shell script to make 3 bottom panels on tmux window

     #!/bin/zsh
     tmux split-window -v -p 30
     tmux split-window -h -p 66
     tmux split-window -h -p 50

make this shell script can be run from any directory

> setting PATH is needed

oh my zsh를 사용하고 있어서 .zshrc를 수정해줘야한다. 밑의 코드를 추가하고 저장

      # If you come from bash you might have to change your $PATH.

      IDE=~/
      export PATH=$HOME/bin:/usr/local/bin:$PATH:${IDE}

> 참조웹사이트
>
> > https://myjamong.tistory.com/152

## grep 명령어

`grep "foo" * -r`

이건 현재 있는 디렉토리에서 "foo"가 들어있는 라인을 모두 찾으라는것이고 -r옵션으로 하위폴더도 다 검색. -rn을 줘서 line number도 볼 수 있다.

---

## mendatory plugins

1. fzf
2. ripgrep
3. bat

## 새롭게 안 것
1. 알리아스팁
2. 위치 넣을 때 ‘which zsh’ 이렇게 해도 됨
