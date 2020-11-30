# Notes taking about CSS by Gil

## relative size 상대적 크기를 정하는 단위

### example code

```html
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <title>CSS</title>
        <style>
            html {
                font-size: 16px;
            }
            body {
                font-size: 1.5em;
            }
            .a {
                font-size: 2em;
            }
        </style>
    </head>
    <body>
        <p class="a">Lorem Ipsum Dolor</p>
    </body>
</html>
```

1. em

상위 요소크기의 몇배인지를 정하는 단위

```css
font-size: 1.5em;
```

> 이렇게 했을 때 a태그의 크기는 16 × 1.5 × 2 = 48

2. rem
   이건 최상위 요소의 몇배인지를 정하는 단위

```css
font-size: 1.5rem;
```

> 이렇게 바꾸면 16 \* 2 = 32

# inherit property

inherit속성

### example code

```css
span {
    color: blue;
}

.extra span {
    color: inherit;
}
```

> 이렇게 되면 span의 blue속성을 따라간다

# link style

link styles depend on link statuses

-   a:link { color: blue; }
-   a:visited { color: red; }
-   a:hover { color: green; }
-   a:active { color: ornge; }
> 기본, 방문이후, 마우스 올렸을 때, 클릭 했을 때

# & + &의 의미
```css
& + & {
    border-left: 1px solid;
}
```

would be translated as

```css
.tab + .tab {
    border-left: 1px solid;
}
```

This construct is common when you need to add a border between items: you add it to the left of any items which follows another one.

## block or inline?                                                                                                                                                                                   

    +---------------------------------------------------+
    | block tag                                         |
    |---------------------------------------------------|
    | <address> <article> <aside> <blockquote> <canvas> |
    | <dd> <div> <dl> <dt> <fieldset>                   |
    | <figcaption> <figure> <footer> <form> <h1>        |
    | -<h6> <header> <hr> <li> <main>                   |
    | <nav> <noscript> <ol> <p> <pre>                   |
    | <section> <table> <tfoot> <ul> <video             |
    +---------------------------------------------------+


    +----------------------------------------------+
    | inline tag                                   |
    |----------------------------------------------|
    | <a> <abbr> <acronym> <b>                     |
    | <bdo> <big> <br> <button> <cite> <code>      |
    | <dfn> <em> <i> <img> <input> <kbd> <label>   |
    | <map> <object> <output> <q> <samp> <script>  |
    | <select> <small> <span> <strong> <sub> <sup> |
    | <textarea> <time> <tt> <var>                 |
    +----------------------------------------------+


* 참조
> https://www.w3schools.com/html/html_blocks.asp

## flexbox  
flexbox를 컨테이너라고 생각하고 그 안에 들어있는 item들을 배치하는게 주요한 목적이라서 생각하면 편하다.    
reference_sites: https://studiomeal.com/archives/197

### display:flex
```css
.container {
	display: flex;
	/* display: inline-flex; */
	/* inline-flex는 flexbox가 주변 요소를 감싸는 모양을 정한다 */
    
}
```
축의 개념  
<img src="https://studiomeal.com/wp-content/uploads/2020/01/03.jpg" alt="" width="75%" style="border:solid black"><br/> 
inline-flex와의 차이점  
<img src="https://studiomeal.com/wp-content/uploads/2020/01/08-1.jpg" alt="" width="75%" style="border:solid black"> <br/>
### [flex direction](flex-direction) 
```css
.container {
	flex-direction: row;
	/* flex-direction: column; */
	/* flex-direction: row-reverse; */
	/* flex-direction: column-reverse; */
}
```
<img src="https://studiomeal.com/wp-content/uploads/2020/01/05-1.jpg" alt="" width="75%" style="border:solid black"> <br/>
### flex-wrap
컨테이너가 한줄에 표현할 수 있는 정도를 넘게되면 어떻게 할지 정하기
```css
.container {
	flex-wrap: nowrap;
	/* flex-wrap: wrap; */
	/* flex-wrap: wrap-reverse; */
}
```
<img src="https://studiomeal.com/wp-content/uploads/2020/01/06-1.jpg" alt="" width="75%" style="border:solid black"> <br/>

### flex-flow
flex-direction & flex-wrap을 한꺼번에 적용하기
횡으로 할지 종으로할지 넘칠때 어떻게 할지를 한번에 한다는 이야기
row, column, wrap
```css
.container {
	flex-flow: row wrap;
	/* 아래의 두 줄을 줄여 쓴 것 */
	/* flex-direction: row; */
	/* flex-wrap: wrap; */
}
```

기억할 것
> "justify"는 메인축(오뎅꼬치) 방향으로 정렬(저수준에서 판단한다고 생각, 축에서 벗어나지 않음)    
> "align"은 수직축(오뎅을 뜯어내는) 방향으로 정렬 (얼라인은 올린다고 생각하면 세로로 움직인다고 생각)

### justify-content
```css
.container {
	justify-content: flex-start;
	/* justify-content: flex-end; */
	/* justify-content: center; */
	/* justify-content: space-between; */
	/* justify-content: space-around; */
	/* justify-content: space-evenly; */
}
```
<img src="https://studiomeal.com/wp-content/uploads/2020/01/10-1.jpg" alt="" width="75%" style="border:solid black"> <br/>

### align-items
```css
.container {
	align-items: stretch;
	/* align-items: flex-start; */
	/* align-items: flex-end; */
	/* align-items: center; */
	/* align-items: baseline; */
}
```
### align-content
> flex-wrap: wrap;이 설정된 상태에서, 아이템들의 행이 2줄 이상 되었을 때의 수직축 방향 정렬을 결정하는 속성입니다.
```css
.container {
	flex-wrap: wrap;
	align-content: stretch;
	/* align-content: flex-start; */
	/* align-content: flex-end; */
	/* align-content: center; */
	/* align-content: space-between; */
	/* align-content: space-around; */
	/* align-content: space-evenly; */
}
```

---
flex-items


## grid


