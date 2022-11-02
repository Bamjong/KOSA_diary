# 📚 Day50_221102

Author: 고범종
Created Time: 2022년 11월 2일 오전 9:10
Status: 🖨 Published
Tags: jQuery, 함수
Updated Time: 2022년 11월 2일 오후 5:20

# 1. jQuery

## 사용법

```java
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
```

- 구글서버를 이용한 JQUERY CDN 이용

## 셀렉터

![https://user-images.githubusercontent.com/92353613/199366698-1582ae3d-3010-4a94-967e-e24074d8be34.png](https://user-images.githubusercontent.com/92353613/199366698-1582ae3d-3010-4a94-967e-e24074d8be34.png)

[https://www.w3schools.com/jquery/jquery_selectors.asp](https://www.w3schools.com/jquery/jquery_selectors.asp)

## 차이점

```jsx
window.onload = () =>{
            document.getElementById("btn").onclick = () =>{
                alert("DOM Script");
            }
        }
```

- 기존 DOM onload 실행방법

```jsx
$(document).ready(function(){
            $('#btn').click(function(){
                $(this).hide(); //button 감추어라
            });
        });

혹은

$(function(){

}

이런식으로 더 간단하게 쓸 수 있음
```

- jquery onload 실행방법

## Jquery 중요 함수

- Jquery
- 3개함수 (**val(), text(), html()**) > 값을 read, write > getter, setter
- ex) val('홍길동') > write(setter)
ex) val() > read(getter)

예시)

```jsx
// ***** write 모든 요소 적용가능
$('input[type=text]').val("hong");
$('input[type=password]').val("11111");
$('tr:odd').css("background","gray"); //1,3,5,...
$('tr:even').css("background","pink"); //0,2,4,...

// ***** read 처음 만나는 요소
console.log($('input[type=text]').val())
```

### 당연한 TIP!

JS와 Jquery는 같이 쓰여질 수 있다!

예시)

```jsx
setTimeout(() => {
          let value = $('select > option:selected').val();
          alert("select tag value: " + value);
     }, 3000);
```

- 3초뒤에 선택한 value의 값이 뜨도록함

## select 태그

```jsx
$('#select_hobby').change(function(){ // 값의 변화가 일어나면
  const text = $(':selected').text();
  console.log(text);

  const text2 = $('#select_hobby option:selected').text();
  console.log(text2);

  const val = $('#select_hobby').val(); //value가 없는경우 text를 value값으로 가져옴
  console.log(val);
```

```jsx
$('#txtpwd2').keyup(function(){
      if($('#txtpwd').val() != $('#txtpwd2').val()){
          $('#message').text("<h3>암호가 일치하지 않아요</h3>")
      }else{
          $('#message').html("<h3>암호가 일치 합니다.</h3>")
      }
  });
```

- text 방식으로 출력하면 <h3>이 그냥 보인다.
- html방식으로 출력하면 <h3>이 먹은 상태로 보여진다.

## Style 태그

```jsx
addClass() - Adds one or more classes to the selected elements
removeClass() - Removes one or more classes from the selected elements
toggleClass() - Toggles between adding/removing classes from the selected elements
css() - Sets or returns the style attribute
```

## Form 태그

```jsx
$('txtname').val("hong");
console.log($('#txtname').val());

$("input:radio").val(['M']); //F 값을 가진 요소 선택 checked
//value M, F 한다는 것은 >> checked 하겠다
```

```jsx
//select
//단일선택
console.log($('#isF').val()); //선택된 option 태그의 value값을 가지고옴
$('#isF').val('oracle'); //selected 선택

//다중선택이 가능한 select 태그
$('#isF2').val(['java','oracle']);

//btnok 클릭하면
//isF2 태그에 선택된 요소의 값을 모두 출력
$('#btnok').click(function(){
    const data = $('#isF2').val();
    console.log(data);
    for(let index in data){
        console.log("value: " + data[index]);
    }
    
})
```

### 예제)

아래 코드를 jQuery로 바꾸세요

DOM)

```jsx
let imgIdx = 0;
	window.onload = function()
	{
		let myphotos= [];
		let itemList = data.items;
		for( let index in itemList)
		{
			let media = itemList[index].media; //media객체
			myphotos.push (media.m);
		}

		document.getElementById("imgs").src = myphotos[0];
		
		document.getElementById("next").onclick = function()
		{
			
			if( ++imgIdx == myphotos.length)
			{
				imgIdx = 0;
			}
			document.getElementById("imgs").src = myphotos[imgIdx];
		}
		
		document.getElementById("prv").onclick = function()
		{
			if( imgIdx ==0)
			{
				imgIdx =  myphotos.length-1;
			}
			document.getElementById("imgs").src = myphotos[--imgIdx];
		}
	}
```

jQuery

```jsx
$(document).ready(function() {
		const mediaList = [];
		//console.log(data.items);
		$.each(data.items,function(index, element) {
			mediaList.push(element.media.m);
	     });
	
        let index=0;
        $('#imgs').attr('src', mediaList[0]);
        
        console.log("index : " + index);
        
        $('#prv').click(function() {
            if(index == 0){
              index = mediaList.length;
          }
            $('#imgs').attr('src', mediaList[--index]);
            console.log("index : " + index);
        });
        
        $('#next').click(function() {
            if(index == (mediaList.length-1)){
              index = -1;
          }
            $('#imgs').attr('src', mediaList[++index]);
            console.log("index : " + index);
        });
       
    });
```

## Append

- append() - Inserts content at the end of the selected elements
- prepend() - Inserts content at the beginning of the selected elements
- after() - Inserts content after the selected elements
- before() - Inserts content before the selected elements

### Remove

- remove() - Removes the selected element (and its child elements)
자기자신삭제(자식제거)
- empty() - Removes the child elements from the selected element
자식제거