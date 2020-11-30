# typescript 시작

typescript로 프로젝트를 하려면 필요한 사항

일단 directory를 만든다  
npm, yarn 설치가 필요함

```bash
    npm i typescript -g
    yarn global add typescript

or

    npm i typescript --save -dev
    yarn add typesciprt --dev
```

이제 directory경로에서 tcs --init을 하면 typescript 프로젝트를 시작하는 것이다.

만약 TypeScript가 로컬에 설치되어 있을 경우, 로컬의 node_modules 폴더에서 tsc를 호출필요

./node_modules/.bin/tsc --init
npx tsc --init

이제 tsconfig.json file이 생성되었음

```json
{
  "compilerOptions": {
    "target": "es5",
    "module": "commonjs",
    "strict": true
  }
}
```

여기에 두개 항목 몇 개 추가해보자

    "outDir": "dist",
    "sourceMap": true

그럼 이렇게 된다

```json
        {
         "compilerOptions": {
           "target": "es5",
           "module": "commonjs",
           "strict": true
           "outDir": "dist",
            "sourceMap": true
         }
        }
```

이제 TypeScript 컴파일 결과의 JavaScript 파일들이 dist폴더에 생길 것이고, sourcemap도 생길 것.

이제 compile시간

> test.ts 파일 생성 후 type이 들어간 코드를 짜본다
> 그후에 트랜스 컴파일

```bash
    tsc
    # or
    npx tsc
```

이러면 아까 지정했던 dist 디렉토리에 js파일이 저장 된다

---

## Watch mode

코드의 수정이 있을 때 자동으로 읽어서 다시 컴파일해준다.

        $ tsc -w
        # or, for local tsc:
        $ npx tsc -w

이후의 것들은 일단 웹 페이지 참조  
https://velog.io/@hopsprings2/TypeScript-%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%ED%99%98%EA%B2%BD%EC%84%A4%EC%A0%95#%EB%8D%94-%EC%89%BD%EA%B2%8C-%EA%B0%91%EC%8B%9C%EB%8B%A4-gts%EB%A5%BC-%EC%82%AC%EC%9A%A9%ED%95%B4%EB%B3%B4%EC%84%B8%EC%9A%94
