# tmux 사용법

터미널에서 시작

```bash
$ tmux

ctrl + b (prefix key) -> command key

```


모든 커맨드는 prefix key를 실행가능

현재 처음 tmux에 들어가자마자 panel을 나누는걸 쉘스크립트로 한다
> 맥북의 ide.sh참조

---

터미널 녹화
https://asciinema.org/~sa82trip

---

## modify panel size

    :resize-pane -D (Resizes the current pane down)
    :resize-pane -U (Resizes the current pane upward)
    :resize-pane -L (Resizes the current pane left)
    :resize-pane -R (Resizes the current pane right)
    :resize-pane -D 10 (Resizes the current pane down by 10 cells)
    :resize-pane -U 10 (Resizes the current pane upward by 10 cells)
    :resize-pane -L 10 (Resizes the current pane left by 10 cells)
    :resize-pane -R 10 (Resizes the current pane right by 10 cells)

---

## fix weird rendering 
```url
https://www.reddit.com/r/tmux/comments/7li8oj/help_why_am_i_getting_these_garbage_characters_in/
```

## tmuxinator
참조 사이트   
https://fabianfranke.de/use-tmuxinator-to-recreate-tmux-panes-and-windowstmuxinator-save-tmux-pane-and-window-layouts/  
http://pradeepclicks.com/tmux-a-true-save-complete-state-genius-for-terminal-and-command-line/  

1. installation
```bash
$ gem install tmuxinator
```
2. make new tmuxinator session
```bash
$ tmuxinator new daily
```

참조 사이트
tmux cheat
https://tmuxcheatsheet.com/?q=

## key bindings
```zsh
$ ctrl + prefix(a or b) , ?
```
