---
layout  : wiki
title   : vimwiki
summary : 
date    : 2020-09-26 23:38:45 +0900
updated : 2020-09-26 23:48:33 +0900
tags    : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

# vimwiki  

## todo 리스트가 만들어지지 않을 때
> ' * '를 앞에 붙이고 Ctrl+Space 눌러야 한다.
```markdown
          +--------------------------+
          |* call mom                |
          |^                         |
          ||                         |    
          ||                         |
          |this is important         |
          +--------------------------+

          +--------------------------+
          |after ctrl + space        |
          |you get checkbox          |
          |   |                      |
          |   |                      |
          |   v                      |
          |* [ ] call mom            |
          +--------------------------+
```
