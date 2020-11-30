# Essential knowledge about VIM


## vim 단축키 모음  
(모르는 거 나올 때 마다 추가할 예정)

    ctrl + v
    블록을 열로 지정 할 수있게 해준다
	( ctrl + q로 해야하는 경우도 있음)

    dd
    열 잘라내기

> macro 만드는 법
>
> 1.  qa를 누르고 register에 a에 레코딩을 시작
> 2.  작업을 진행
> 3.  마지막으로 q를 눌러서 종료
> 4.  .vimrc에 let @a='
> 5.  ctrl+r \* 2 그리고 a를 누르면 register에 있는게 붙여넣어짐
> 6.  그럼 나중에도 @a로 사용가능
> 7.  참조 페이지
> 8.  https://vim.fandom.com/wiki/Macros

- 문제점!

  - command line을 사용거나 엔터등을 사용하면 제대로 저장이 안된다
  - 이럴 때는 marvim이라는 플러그인을 사용

- marvim 사용법
  - .vimrc에 플러그인 추가 (이때 Vundle이 편함)
  - commandline에 :PluginInstall하고 엔터
  - 그리고는 매크로 입력하고 F3 누르면 이름 정한다
  - 사용시는 F2를 누르고 이름 입력후 엔터
  - 한번 사용하면 q register에 저장됨
    - 100@q를 사용할 수 있다는이야기(반복가능)
  - marvim의 설정법은 다음에 추가
    - https://www.vim.org/scripts/script.php?script_id=2154
  -
  Marvim Hotkeys

```
 <F2> - Find and execute a macro or insert template from repository

 Visual <F2> - Replays last macro for each line >selected

 <F3> - Save default macro register by >name to the macro repository

 Visual <F3> - Save selection as template by name to >the macro repository

 <Tab> - On the Macro command line for >cycling through autocomplete

 <Control>+D - On the Macro command line for listing >autocomplete options
```

### vim-script사용시 알아야하는것들

In double-quote strings it is possible to use special characters. Here are a few useful ones:

    \t		<Tab>
    \n		<NL>, line break
    \r		<CR>, <Enter>
    \e		<Esc>
    \b		<BS>, backspace
    \"		"
    \\		\, backslash
    \<Esc>		<Esc>
    \<C-W>		CTRL-W

### 이제 생각하고 있는건 coc nvim으로 자동완성 및 ide기능

    이거랑 UltiSnips사용해서 환경 만들것
    :CocUninstall <plugin명> // plugin지우기
    <lead> rn 이름 바꾸기

setter getter

알아야한다

## nnoremap - > normal mode no remap

## **how to handle multiple files**

use buffer

    e: {fileName} // open file with new buffer
    :buffers // show list of buffer
    b1 or b2 // move around buffer
    <c-6> // move to last position of cursor

> 원래는 buffer에 변화가 없으면 이동이 안된다 그래서 set=hidden이라는 설정값이 필요하다

---

use window

## :s and :g (search and global or greedy)

They are different.
:g can execute commands for matched lines. :s is one of those commands. That is you can combine :g and s
:%s just do search and replace on whole buffer, even though it can do some other things with expression too, but it is not as straightforward as :g.
E.g.:

```vim
:g/foo/s/bar/blah/g
```

this will do bar->blah substitution on lines which contain foo. With :s we could:

```vim
:%s/foo/\=substitute(getline('.'), 'bar','blah','g')
```

so :g is easier.
So if you are dealing with substitution task, usually :s should come up first. If you want to do something like for all lines that matches xxx, I want to delete/join/indent/....... :g maybe helpful for you.

## mapping

1. basic mapping :

```
map - dd
```

> 이렇게 해야 무한 루프에 빠지지 않는다.

2. no recursive mapping :

```
nnoremap - dd
```

맵핑을 할 때 필요한 특수키들은 아래의 것들이 있다.

```vim
<c-r>, <esc>,<space> etc
```

> mapping 할 때 i, n, v 등이 앞에 붙는건 각각 insert, normal, visual을 의미 한다.

> [Vim] Live Markdown Plugin을 이용해서 vim에서도 라이브뷰를 볼 수 있다.

---

# 화면을 나누는 법

```vim
:split
:vsplit
```

## vim-surround에서 visual block을 감싸는 법

1. visual mode로 선택한다.
2. Capital S누르고 감싸고 싶은 캐릭터를 선택한다.

## vim script에 관한 내용 자세한 사이트
https://learnvimscriptthehardway.stevelosh.com/

## vimwiki에 관해서
1. vimwiki는 tagbar가 자동으로 생성되는 것이 중요하다
2. 

## vim autocommand에 관해서
```bash
    +---------------------------------------------------+
    |autocmd BufNewFile * :write                        |
    |        ^          ^ ^                             |
    |        |          | |                             |
    |        |          | The command to run.           |
    |        |          |                               |
    |        |          A "pattern" to filter the event.|
    |        |                                          |
    |        The "event" to watch for.                  |
    +---------------------------------------------------+
```
BufWritePre, BufRead  
FileType

## vim change current working directory
```vim
: cd {project_directory}
cd ~/programming_root/my_biseo   //ex
```


