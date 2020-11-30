# git cmd 이용하기

<!-- vim-markdown-toc GFM -->

* [inital setup](#inital-setup)
* [새 브랜치 만들기(make a new branch from current branch)](#새-브랜치-만들기make-a-new-branch-from-current-branch)
* [리모트 브랜치와 동기화](#리모트-브랜치와-동기화)
* [keep upto date forked branch](#keep-upto-date-forked-branch)
* [git stash](#git-stash)

<!-- vim-markdown-toc -->

## inital setup

1. github에서 프로젝트를 만든다.
2. local에서 프로젝트 디렉토리를 만든다
3. 그 폴더에서 git init을 한다
```
$ git init
```
4. 일단 git remote add를 한다
```
$ git remote add origin {remote address}
```
1. 여기서 아무 변화를 만들고
```
$ git add .
```
1. 이렇게 모든 변화를 add(track)한다
2. 그 후에 commit 한다
```
$ git commit -m "initial commit"
```
1. 그리고는 push를 한다
```
$ git push -u origin master
```
2. master branch를 만들면서 push가 진행됨

```bash
$ git init
$ git remote add origin https://github.com/sa82trip/knowledge.git
$ git add .
$ git commit -m "inital commit"
$ git push -u origin master
```

---

## 새 브랜치 만들기(make a new branch from current branch)

```bash
$ git checkout -b new_branch
```

1. create branch
```bash
// local에서 branch만들기
$ git checkout -b {new_branch} {from_branch}
$ git branch {new_branch} 

// remote에 반영
$ git push origin {new_branch}

```
---

## 리모트 브랜치와 동기화

```bash
$ git pull
```

```bash
$ git fetch -p origin master
$ git reset --hard origin/master
```

[ git 관련 정리가 좋은 페이지 ](https://jeonghwan-kim.github.io/dev/2020/02/10/git-usage.html)

[git add 취소하기(cancel), git commit 취소하기, git push 취소하기](https://gmlwjd9405.github.io/2018/05/25/git-add-cancle.html)

## keep upto date forked branch

1. Clone your fork:

```bash
git clone git@github.com:YOUR-USERNAME/YOUR-FORKED-REPO.git

```

2. Add remote from original repository in your forked repository:

```bash
   cd into/cloned/fork-repo
   git remote add upstream git://github.com/ORIGINAL-DEV-USERNAME/REPO-YOU-FORKED-FROM.git
   git fetch upstream

```

3. Updating your fork from original repo to keep up with their changes:
 
## git stash
```bash
$ git stash (stash저장)
$ git stash save (stash저장) 
$ git stash pop(stash 꺼내기)
$ git stash drop(stash 지우기)
```
