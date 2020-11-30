---
layout  : wiki
title   : javascript
summary : 
date    : 2020-09-14 01:03:02 +0900
updated : 2020-09-28 13:36:00 +0900
tags    : 
toc     : true
public  : true
parent  : 
latex   : false
---
* TOC
{:toc}

<!-- vim-markdown-toc GFM -->

* [javascript 공부](#javascript-공부)
    * [1. javascript core](#1-javascript-core)
        * [객체](#객체)
        * [프로토타입(prototype)이란?](#프로토타입prototype이란)
        * [2. prototype 프로퍼티 & \_\_proto\_\_](#2-prototype-프로퍼티--__proto_)
        * [3. 화살표 함수(arrow function)](#3-화살표-함수arrow-function)
        * [4. spread, rest](#4-spread-rest)
    * [2. algorithms with javascript](#2-algorithms-with-javascript)

<!-- vim-markdown-toc -->


# javascript 공부
## 1. javascript core
### 객체  
    > primitiv형과 객체형의 복사 방식은 다르다. 
### 프로토타입(prototype)이란?
> 모든 객체는 속성을 상속하는 프로토타입 객체에 연결되어있다.
```markdown
                      +-----------------+
              +-----> | Object.prototype|
              |       +-----------------+
              |
              |
              |
              |
              |
              |
              |
              |
 +--------------------------+
 |객체 리터럴로 생성된 객체 |
 +--------------------------+
  
  
  
  

```
* 참조
```javascript
let a = {};
let b = a; // 참조에 의한 복사

alert( a == b ); // true, 두 변수는 같은 객체를 참조합니다.
alert( a === b ); // true
```
* 독립된 객체
```javascript
let a = {};
let b = {}; // 독립된 두 객체

alert( a == b ); // false
```
### 2. prototype 프로퍼티 & \_\_proto\_\_
### 3. 화살표 함수(arrow function)
화살표 함수 - JavaScript | MDN에 따르면
화살표 함수의 경우 괄호()로 감싸진 부분이 return 된다(return문을 작성하지 않아도 return 됨).
반면에 중괄호{}로 감싸진 다음과 같은 함수는 return문이 없다면 return 값을 반환하지 않는다.

### 4. spread, rest
```javascript
const arr = ['a', 'b', 'c']
console.log(arr) // ['a', 'b', 'c']
console.log(...arr) // 'a' 'b' 'c'

const arr2 = [1, 2, 3]
console.log([...arr, ...arr2]) // ['a', 'b', 'c', 1, 2, 3]
// 배열 합치기에 사용할 수 있습니다.

const copiedArr = [...arr]
console.log(copiedArr) // ['a', 'b', 'c']
// 배열 복사에도 사용할 수 있습니다.
```

## 2. algorithms with javascript
[https://github.com/TheAlgorithms/Javascript/blob/master/DIRECTORY.md]

