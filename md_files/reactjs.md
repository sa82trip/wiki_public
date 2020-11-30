# react js

<!-- vim-markdown-toc GFM -->

    * [component 종류에는 두가지가 있다.](#component-종류에는-두가지가-있다)
    * [state](#state)
* [함수형 컴포넌트에서 state 사용하기](#함수형-컴포넌트에서-state-사용하기)
    * [ref를 사용해야 하는 경우](#ref를-사용해야-하는-경우)
    * [redux에 관해서](#redux에-관해서)
    * [css to reaty inline style](#css-to-reaty-inline-style)

<!-- vim-markdown-toc -->
## component 종류에는 두가지가 있다.

1. **functional component**

    ```javascript
    import React from "react";
    import "./App.css";

    function App() {
        const name = "리액트";
        return <div className="react">{name}</div>;
    }

    export default App;
    ```

2. **class component**

    ```javascript
    import React, { Component } from "react";

    class App extends Component {
        render() {
            const name = "react";
            return <div className="react">{name}</div>;
        }
    }
    export default App;
    ```

---

> 클래스형 컴포넌트와 함수형 컴포넌트의 차이점은 클래스형 컴포넌트의 경우 이후 배울 state 기능 및 라이프사이클 기능을 사용할 수 있다는 것과 임의 메서드를 정의할 수 있다는 것

---

**ES6의 클래스 문법**

ES6 이전에는 자바스크립트에 클래스(class)가 없었습니다. 개념 자체는 있었지만, 그것을 구현하려면 class 대신에 prototype이라는 문법을 사용하여 다음과 같이 작업해야 했습니다.

```javascript
function Dog(name) {
    this.name = name;
}

Dog.prototype.say = function () {
    console.log(this.name + ": 멍멍");
};
var dog = new Dog("검둥이");
dog.say(); // 검둥이: 멍멍
```

ES6 문법부터는 이것과 기능이 똑같은 코드를 class를 사용하여 다음과 같이 작성할 수 있습니다.

```javascript
class Dog {
    constructor(name) {
        this.name = name;
    }
    say() {
        console.log(this.name + ": 멍멍");
    }
}

const dog = new Dog("흰둥이");
dog.say(); // 흰둥이: 멍멍
```

> 화살표 함수(익명함수)  
> 둘의 차이점을 알아야함.
> 둘이 가리키는 this가 다르다는점.  
> 전자는 자신이 속한 객체  
> 후자는 자신이 속한 인스턴스

```javascript
function BlackDog() {
    this.name = "흰둥이";
    return {
        name: "검둥이",
        bark: function () {
            console.log(this.name + ": 멍멍!");
        },
    };
}

const blackDog = new BlackDog();
blackDog.bark(); // 검둥이: 멍멍!

function WhiteDog() {
    this.name = "흰둥이";
    return {
        name: "검둥이",
        bark: () => {
            console.log(this.name + ": 멍멍!");
        },
    };
}

const whiteDog = new WhiteDog();
whiteDog.bark(); // 흰둥이: 멍멍!
```

바로 리턴할 때는 {}는 안써도 됨

```javascript
const triple = (value) => value * 3;
```

class component가 아니면 안되는 기능(state를 사용 등)들이 hook이라는 기능을 사용함으로써 가능하게 되었다고 함

> children이란 component사이에 들어있는 문자열

```javascript
//부모쪽
import React from "react";
import MyComponent from "./MyComponent";

const App = () => {
    return <MyComponent name="Joon">리액트</MyComponent>;
};

export default App;

//자식쪽
import React from "react";
//비구조화 할당 문법으로 바로 파라미터로 받기
const MyComponent = ({ name, children }) => {
    return (
        <div>
            Hello {name} this is awesome Component!!
            <br />
            children 값은 {children} 입니다.
        </div>
    );
};
```

> 클래스 컴포넌트에서 default and propTypes를 정의 하는 다른 방법

```javascript
import React, { Component } from 'react';
import PropTypes from 'prop-types';

class MyComponent extends Component {
  static defaultProps = {
    name: 'JOON'
  };
  static propTypes = {
    name: PropTypes.string,
    favoriteNumber: PropTypes.number.isRequired
  };
  render() {
    const { name, favoriteNumber, children } = this.props; // 비구조화 할당
    return (...);
  }
}

export default MyComponent;
```

## state

> 리액트에서 state는 컴포넌트 내부에서 바뀔 수 있는 값을 의미합니다. props는 컴포넌트가 사용되는 과정에서 부모 컴포넌트가 설정하는 값이며, 컴포넌트 자신은 해당 props를 읽기 전용으로만 사용할 수 있습니다. props를 바꾸려면 부모 컴포넌트에서 바꾸어 주어야 합니다. 예를 들어 현재 상황에서는 App 컴포넌트에서 MyComponent를 사용할 때 props를 바꾸어 주어야 값이 변경될 수 있는 것이죠. 반면 MyComponent에서는 전달받은 name 값을 직접 바꿀 수 없습니다.
>
> 리액트에는 두 가지 종류의 state가 있습니다. 하나는 클래스형 컴포넌트가 지니고 있는 state이고, 다른 하나는 함수형 컴포넌트에서 useState라는 함수를 통해 사용하는 state입니다.

클래스형 컴포넌트에서 state를 초기화 하는 방법은 2개

1. constructor

```javascript
class Counter extends Component {
constructor(props) {
    super(props);
    // state의 초깃값 설정하기
    this.state = {
      number: 0,
      fixedNumber: 0
    };
  }
  (...)
```

2. state ={}

```javascript
class Counter extends Component {
 state = {
    number: 0,
    fixedNumber: 0
  };
  (...)
```

state를 경신 하는 방법

1. this.setState({})
2. this.setStete(()=>{})

위의 두가지 경우 모두 state가 경신된 후call back을 사용할 수 있다.

```javascript
this.setState(
    (prevState) => {
        return {
            number: prevState.number + 1,
        };
    },
    () => {
        alert("call back");
    }
);
```

```javascript
// 객체 리터럴 표현을 반환하기 위해서는 함수 본문(body)을 괄호 속에 넣음:
params => ({foo: bar})

// 나머지 매개변수 및 기본 매개변수를 지원함
(param1, param2, ...rest) => { statements }
(param1 = defaultValue1, param2, …, paramN = defaultValueN) => { statements }

// 매개변수 목록 내 비구조화도 지원됨
var f = ([a, b] = [1, 2], {x: c} = {x: a + b}) => a + b + c;
f();  // 6
```

# 함수형 컴포넌트에서 state 사용하기

> Hooks라는 것을 사용해서 useState라는 함수를 사용하여 함수형 컴포넌트에서도 state를 사용

> 배열 비구조화를 알아야 함

```javascript
const array = [1, 2];
const one = array[0];
const two = array[1];
// array 안에 있는 값을 one과 two에 담아 주는 코드인데요. 위 코드는 배열 비구조화 할당을 사용하면 다음과 같이 표현할 수 있습니다.
const array = [1, 2];
const [one, two] = array;
```

https://thebook.io/080203/ch03/04/02/

## ref를 사용해야 하는 경우

> 5.1.3 DOM을 꼭 사용해야 하는 상황
>
> 앞 예제에서는 state를 사용하여 우리에게 필요한 기능을 구현했지만, 가끔 state만으로 해결할 수 없는 기능이 있습니다. 어떤 상황인지 알아볼까요?
>
> • 특정 input에 포커스 주기
>
> • 스크롤 박스 조작하기
>
> • Canvas 요소에 그림 그리기 등
>
> 이때는 어쩔 수 없이 DOM에 직접적으로 접근해야 하는데, 이를 위해 바로 ref를 사용합니다.

```javascript
 import React, { Component } from 'react';

class ScrollBox extends Component {

  scrollToBottom = () => {
    const { scrollHeight, clientHeight } = this.box;
    /* 앞 코드에는 비구조화 할당 문법을 사용했습니다.
       다음 코드와 같은 의미입니다.
       const scrollHeight = this.box.scrollHeight;
       const clientHeight = this.box.cliengHeight;
    */
    this.box.scrollTop = scrollHeight - clientHeight;
  }

  render() {
      const style = {
      border: '1px solid black',
      height: '300px',
      width: '300px',
      overflow: 'auto',
      position: 'relative'
    };

    const innerStyle = {
      width: '100%',
      height: '650px',
      background: 'linear-gradient(white, black)'
    }
    return(
        <div
            style={style}
            ref={(ref) => {this.box=ref}}>
            <div style={innerStyle}/>
        </div>
    )

}

export default ScrollBox;
```

```javascript
import React, { Component } from "react";
import ScrollBox from "./ScrollBox";

class App extends Component {
    render() {
        return (
            <div>
                <ScrollBox ref={(ref) => (this.scrollBox = ref)} />
                <button onClick={() => this.scrollBox.scrollToBottom()}>
                    맨 밑으로
                </button>
            </div>
        );
    }
}

export default App;
```

> 여기서 주의!! 문법상으로는 onClick = {this.scrollBox.scrollBottom} 같은 형식으로 작성해도 틀린 것은 아닙니다. 하지만 컴포넌트가 처음 렌더링될 때는 this.scrollBox 값이 undefined이므로 this.scrollBox.scrollToBottom 값을 읽어 오는 과정에서 오류가 발생합니다. 화살표 함수 문법을 사용하여 아예 새로운 함수를 만들고 그 내부에서 this.scrollBox.scrollToBottom 메서드를 실행하면, 버튼을 누를 때(이미 한 번 렌더링을 해서 this.scrollBox를 설정한 시점) this.scrollBox.scrollToBottom 값을 읽어 와서 실행하므로 오류가 발생하지 않습니다.

> this is what i need to know
>
> > https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax

## redux에 관해서 
https://velog.io/@lchyung1998/React-React-Redux%EB%A1%9C-%EC%83%81%ED%83%9C-%EA%B4%80%EB%A6%AC%ED%95%98%EA%B8%B0
https://react-redux.js.org/6.x/introduction/basic-tutorial#providing-the-store
* redux 적용하기
    * prerequisit       
        * project 구조   
```bash
tree 
.                   
├── App.js
├── App.test.js
├── actions
│   ├── apiActions.js
│   ├── index.js
│   └── postActions.js
├── components
│   ├── ApplyerTable.js
│   ├── Button.js
│   ├── Input.js
│   ├── Post.js
│   ├── Text.js
│   └── temp.js
├── confidential.js
├── index.css
├── index.js
├── reducers
│   ├── apiReducer.js
│   ├── index.js
│   └── postReducer.js
├── serviceWorker.js
├── setupTests.js

```




1. npm install redux redux-react 설치
```bash
$npm install redux react-redux
```
2. index.js에 적용하기
```javascript
...
//reducer들의 root
import rootReducer from "./reducers/index";
import { Provider  } from "react-redux";
import { createStore  } from "../node_modules/redux";
...

const store = createStore(rootReducer, applyMiddleware(thunk));

ReactDOM.render(
// provider로 App을 감싸줌
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById("root")
);
```
3. rootReducer 만들기
```javascript
import postReducer from "./postReducer";
import apiReducer from "./apiReducer";
import { combineReducers } from "redux";

const rootReducer = combineReducers({ postReducer, apiReducer });

export default rootReducer;

```
4. calculationReducer 만들기
* node모듈 못찾는 상태가 될 때나 프로젝트가 시작 안될 때
    node 모듈 디렉토리를 지우고 npm install
    jsconfig파일에 "moduleResolution": "node"를 추가
* 그리고 설치할 때 --save-dev 추가하고 하자
5. calculationAction 만들기
6. 그 이후로는 dispatch랑 useSelector를 이용하고
7. dispath(allActions.calculationAction.plus())같이 이용가능
8. 이 부분은 다시 정리 할 것이고 리덕스 적용은 연습 자주 해야할 것 같다.

## css to reaty inline style
https://staxmanade.com/CssToReact/
