# coc nvim how to setting

## coc 이녀석으로 많은걸 할 수 있음

1. 자동완성
   1. 각종 언어별로 CocInstall 명령어를 이용하면 됨.
      1. > CocInstall coc-python
2. prettier연동 (javascript, typescript는 저장시 포멧 가능)
   1. 이것도 플러그인 형태로 제공하고
   2. 설정은 CocConfig 명령어로 들어가서 함
   3. > https://github.com/neoclide/coc-prettier
3. java는 좀 더 연구를 해야함. prettier는 있지만 바로 적용이 안됨
   1. CocConfig애서 적용 가능
      1. > "coc.preferences.formatOnSaveFiletypes": ["css", "markdown","typescript","javascript","html","java"]
4. plugIn이 적용이 안되거나 깨졌을 때 내용 다 지우고 다시 깔면 된다.(자바의 경우 )
   1. > None of the above worked for me. What I did was to forcefully remove the content of coc-java folder.
      > So rm -rf ~/.config/coc/extensions/coc-java-data/\* then launch nvim in my project root dir and open an arbitrary java file from the project. First coc.nvim displayed jdt.ls not found it's being downloaded message followed by starting java language server message and finally it started.
   2. > reference<br>
      > https://github.com/neoclide/coc-java/issues/12
