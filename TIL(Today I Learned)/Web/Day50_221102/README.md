# π Day50_221102

Author: κ³ λ²μ’
Created Time: 2022λ 11μ 2μΌ μ€μ  9:10
Status: π¨ Published
Tags: jQuery, ν¨μ
Updated Time: 2022λ 11μ 2μΌ μ€ν 5:20

# 1. jQuery

## μ¬μ©λ²

```java
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
```

- κ΅¬κΈμλ²λ₯Ό μ΄μ©ν JQUERY CDN μ΄μ©

## μλ ν°

![https://user-images.githubusercontent.com/92353613/199366698-1582ae3d-3010-4a94-967e-e24074d8be34.png](https://user-images.githubusercontent.com/92353613/199366698-1582ae3d-3010-4a94-967e-e24074d8be34.png)

[https://www.w3schools.com/jquery/jquery_selectors.asp](https://www.w3schools.com/jquery/jquery_selectors.asp)

## μ°¨μ΄μ 

```jsx
window.onload = () =>{
            document.getElementById("btn").onclick = () =>{
                alert("DOM Script");
            }
        }
```

- κΈ°μ‘΄ DOM onload μ€νλ°©λ²

```jsx
$(document).ready(function(){
            $('#btn').click(function(){
                $(this).hide(); //button κ°μΆμ΄λΌ
            });
        });

νΉμ

$(function(){

}

μ΄λ°μμΌλ‘ λ κ°λ¨νκ² μΈ μ μμ
```

- jquery onload μ€νλ°©λ²

## Jquery μ€μ ν¨μ

- Jquery
- 3κ°ν¨μ (**val(), text(), html()**) > κ°μ read, write > getter, setter
- ex) val('νκΈΈλ') > write(setter)
ex) val() > read(getter)

μμ)

```jsx
// ***** write λͺ¨λ  μμ μ μ©κ°λ₯
$('input[type=text]').val("hong");
$('input[type=password]').val("11111");
$('tr:odd').css("background","gray"); //1,3,5,...
$('tr:even').css("background","pink"); //0,2,4,...

// ***** read μ²μ λ§λλ μμ
console.log($('input[type=text]').val())
```

### λΉμ°ν TIP!

JSμ Jqueryλ κ°μ΄ μ°μ¬μ§ μ μλ€!

μμ)

```jsx
setTimeout(() => {
          let value = $('select > option:selected').val();
          alert("select tag value: " + value);
     }, 3000);
```

- 3μ΄λ€μ μ νν valueμ κ°μ΄ λ¨λλ‘ν¨

## select νκ·Έ

```jsx
$('#select_hobby').change(function(){ // κ°μ λ³νκ° μΌμ΄λλ©΄
  const text = $(':selected').text();
  console.log(text);

  const text2 = $('#select_hobby option:selected').text();
  console.log(text2);

  const val = $('#select_hobby').val(); //valueκ° μλκ²½μ° textλ₯Ό valueκ°μΌλ‘ κ°μ Έμ΄
  console.log(val);
```

```jsx
$('#txtpwd2').keyup(function(){
      if($('#txtpwd').val() != $('#txtpwd2').val()){
          $('#message').text("<h3>μνΈκ° μΌμΉνμ§ μμμ</h3>")
      }else{
          $('#message').html("<h3>μνΈκ° μΌμΉ ν©λλ€.</h3>")
      }
  });
```

- text λ°©μμΌλ‘ μΆλ ₯νλ©΄ <h3>μ΄ κ·Έλ₯ λ³΄μΈλ€.
- htmlλ°©μμΌλ‘ μΆλ ₯νλ©΄ <h3>μ΄ λ¨Ήμ μνλ‘ λ³΄μ¬μ§λ€.

## Style νκ·Έ

```jsx
addClass() - Adds one or more classes to the selected elements
removeClass() - Removes one or more classes from the selected elements
toggleClass() - Toggles between adding/removing classes from the selected elements
css() - Sets or returns the style attribute
```

## Form νκ·Έ

```jsx
$('txtname').val("hong");
console.log($('#txtname').val());

$("input:radio").val(['M']); //F κ°μ κ°μ§ μμ μ ν checked
//value M, F νλ€λ κ²μ >> checked νκ² λ€
```

```jsx
//select
//λ¨μΌμ ν
console.log($('#isF').val()); //μ νλ option νκ·Έμ valueκ°μ κ°μ§κ³ μ΄
$('#isF').val('oracle'); //selected μ ν

//λ€μ€μ νμ΄ κ°λ₯ν select νκ·Έ
$('#isF2').val(['java','oracle']);

//btnok ν΄λ¦­νλ©΄
//isF2 νκ·Έμ μ νλ μμμ κ°μ λͺ¨λ μΆλ ₯
$('#btnok').click(function(){
    const data = $('#isF2').val();
    console.log(data);
    for(let index in data){
        console.log("value: " + data[index]);
    }
    
})
```

### μμ )

μλ μ½λλ₯Ό jQueryλ‘ λ°κΎΈμΈμ

DOM)

```jsx
let imgIdx = 0;
	window.onload = function()
	{
		let myphotos= [];
		let itemList = data.items;
		for( let index in itemList)
		{
			let media = itemList[index].media; //mediaκ°μ²΄
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
μκΈ°μμ μ­μ (μμμ κ±°)
- empty() - Removes the child elements from the selected element
μμμ κ±°