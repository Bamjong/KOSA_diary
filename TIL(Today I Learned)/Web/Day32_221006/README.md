# π Day32_221006

Author: κ³ λ²μ’
Created Time: 2022λ 10μ 6μΌ μ€μ  9:23
Status: π¨ Published
Tags: CSS, html, λ°μ΄ν° λͺ¨λΈλ§
Updated Time: 2022λ 10μ 6μΌ μ€ν 9:00

# 1. λ°μ΄ν° λͺ¨λΈλ§

---

| μ€μμ± | μ€λͺ |
| --- | --- |
| μμ μ±
(Completeness) | μλ¬΄μμ νμλ‘ νλ λͺ¨λ  λ°μ΄ν°κ° λ°μ΄ν° λͺ¨λΈμ μ μλμ΄μΌ ν¨ |
| μ€λ³΅λ°°μ 
(Non-Redundancy) | λμΌν μ¬μ€μ λ°λμ ν λ²λ§ κΈ°λ‘νμ¬μΌ ν¨ |
| μλ¬΄κ·μΉ
(Business Rules) | μλ¬΄κ·μΉμ΄ λ°μ΄ν° λͺ¨λΈμ ννλμ΄μΌ ν¨
(μ: μ¬μμλ μ κ·μ§, μμμ§μ΄ μμΌλ©°, μ κ·μ§λ§ νΈλ΄ μ λ³΄λ₯Ό κ°μ§) |
| λ°μ΄ν° μ¬μ¬μ©
(Data Reusability) | νμ¬ μ μ²΄ κ΄μ μμ κ³΅ν΅ λ°μ΄ν°λ₯Ό λμΆνκ³ , μ΄λ₯Ό μ  μμ­μμ μ¬μ©ν  μ μλλ‘ μ€κ³ν΄μΌ ν¨ |
| ν΅ν©μ±
(Integration) | λμΌν λ°μ΄ν°λ μ‘°μ§μ μ μ²΄μμ ν λ²λ§ μ μλκ³ , μ΄λ₯Ό μ¬λ¬ λ€λ₯Έ μμ­μμ μ°Έμ‘°, νμ©ν΄μΌ ν¨ |

![https://user-images.githubusercontent.com/92353613/194188955-8238738d-9a00-4634-a06a-6e55fdefc196.png](https://user-images.githubusercontent.com/92353613/194188955-8238738d-9a00-4634-a06a-6e55fdefc196.png)

## μν°ν°(Entity) = νμ΄λΈ

μν°ν° μ μ

- μλ¬΄ μνμ μν΄ λ°μ΄ν°λ‘ κ΄λ¦¬λμ΄μ ΈμΌ νλ μ¬λ, μ¬λ¬Ό, μ₯μ, μ¬κ±΄ λ±
μ¦, κ΅¬μΆνκ³ μ νλ μλ¬΄μ λͺ©μ κ³Ό λ²μ, μ λ΅μ λ°λΌ λ°μ΄ν°λ‘ κ΄λ¦¬ λμ΄μ ΈμΌ νλ ν­λͺ¨κΈγΉ μν°ν°λ‘ μ μ

## μμ±(Attribute) = μ»¬λΌ

μμ± μ μ

- μμ±μ΄λ μ λ³΄λ₯Ό λνλ΄λ μ΅μμ λ¨μλ‘μ¨ μν°ν°μ μ±μ§, λΆλ₯, μλ, μν νΉμ± λ±μ λνλ΄λ μΈλΆ ν­λͺ©
- λ μ΄μ λΆλ¦¬λμ§ μλ μ΅μμ λ°μ΄ν° λ¨μμ΄λ€.

| κΈ°μ΄μμ± | μλ¬΄λ‘λΆν° μλ κ°μ§κ³  μλ κ°μ₯ κΈ°λ³Έμ μΈ μν°ν°μ μΌλ° μμ± |
| --- | --- |
| μ€κ³μμ± | κΈ°μ΄ μμ±μΌλ‘λΆν° κ°κ³΅μ²λ¦¬(κ³μ°) λ±μ ν΅ν΄ μλ‘ λ§λ€κ±°λ λ³ννμ¬ μ μνλ μμ± |
| μΆμΆμμ± | μ€μ λ‘ μ‘΄μ¬νμ§λ μμΌλ μμ€νμ ν¨μ¨μ±μ λλͺ¨νκΈ° μν΄ μ€κ³μκ° μμλ‘ λΆμ¬νλ μμ± |

## μΈμ€ν΄μ€(Instance) = ν

μΈμ€ν΄μ€ μ μ

- λ°μ΄ν°λ² μ΄μ€μ μ μ₯λ λ°μ΄ν° λ΄μ©μ μ μ²΄ μ§ν©μ μλ―Ένλ€.

## μλλ¦¬μ€ (κ°λμ  λͺ¨λΈλ§) ν΄μ¦

- [λ¬Έμ  1]
    
    νμκ΄λ¦¬ μ£Όμ  ... μΌλΆ λ΄μ©
    
    λͺ¨λΈλ§κ³Ό λ°μ΄ν°λ² μ΄μ€μ μ€κ³ λ° κ΅¬μΆμ ν¬ν¨ν IT κΈ°μ μ μ λ¬Έμ μΌλ‘ κ°μνλ μ°λ¦¬νμμλ κ°μ¬κ° 10λͺμ΄ μμΌλ©° κ°κ°μ κ°μ¬λ μμ μ΄ λ΄λΉνλ κ³Όλͺ©μ΄ νκ³Όλͺ©μΈ κ°μ¬λ μκ³  λ κ³Όλͺ©μ΄μ κ°μνλ κ°μ¬λ μλ€. μ°λ¦¬ νμμ κ°μ€λ κ³Όλͺ©μ μ΄ 17κ°μ κ³Όλͺ©μ΄λ©° κ°μμ€μ 6κ°κ° μ‘΄μ¬νλ―λ‘ κ°μ κ³νμ μ μλ¦½νμ¬μΌ νλ€. κ°μκ° λλλ©΄ κ·Έ μ£Όμ κ°μνλ λ΄μ©μ λν΄ μκ°μμΌλ‘λΆν° μ€λ¬Έμ§λ₯Ό λ°μ λ€μ κ°μμ μ°Έκ³  μλ£λ‘ μ΄μ©νλ€. λ§€ μ£Ό 1νμ© κ°μ¬νμλ₯Ό νμ¬ μλ‘μ κ°μλ΄μ©κ³Ό μκ°μμ λν μ΄μΌκΈ°λ₯Ό μ£Όκ³  λ°λλ€. κ³Όλͺ©μ λ°λΌμλ μ μκ³Όλͺ©μ λ£μ§ μμΌλ©΄ μκ°ν  μ μλ κ³Όλͺ©λ μ‘΄μ¬νλ€.
    
    μν°ν° , μ΄νΈλ¦¬λ·°νΈ , μλ³μ , κ΄κ³ λ§λ€μ΄ λ³΄μΈμ
    
    [μ°λ¦¬μ‘° νκ²]
    
    ![https://user-images.githubusercontent.com/92353613/194302609-740d62b6-3446-4578-9942-4b1b479ca4da.png](https://user-images.githubusercontent.com/92353613/194302609-740d62b6-3446-4578-9942-4b1b479ca4da.png)
    
    - μλ²½ν λ΅μ μλμμ§λ§ μ μΌ κ·Όμ νκ±° κ°λ€κ³  κ΅μλκ»μ λ§μνμ¨λ€.

- [λ¬Έμ  2]
    
    νμ¬λ μ¬λ¬κ°μ λΆμλ‘ κ΅¬μ±λμ΄ μλ€
    
    κ° λΆμλ λΆμλͺ , λΆμλ²νΈ , λΆμ λ΄ μ§μμ, κ·Έλ¦¬κ³  λΆμλ₯Ό κ΄λ¦¬νλ μ§μ(κ΄λ¦¬μ)μ μ λ³΄λ₯Ό κ°μ§κ³  μλ€
    
    μ§μμ μ΅λ νλμ λΆμλ₯Ό κ΄λ¦¬ν  μ μλ€, ννΈ ν΄λΉ μ§μμ΄ λΆμκ΄λ¦¬μλ‘ κ·Όλ¬΄λ₯Ό μμν μ λ³΄λ μ μ₯ν΄μΌ νλ€.
    
    κ° λΆμλ μ¬λ¬ μ§μ­μ μμΉνκ³  μμ μ μμΌλ©° κ° λΆμλ μ¬λ¬ νλ‘μ νΈλ₯Ό λμμ κ΄λ¦¬ ν  μ μλ€. κ° νλ‘μ νΈλ κ³ μ μ νλ‘μ νΈλͺ, νλ‘μ νΈ λ²νΈλ₯Ό κ°μ§λ©° νλμ νλ‘μ νΈλ νλμ μ§μ­μμλ§ μ§νλλ€.
    
    μ§μμ λν μ§μλͺ , μ£Όλ―Όλ²νΈ , μ£Όμ(μ/λ ,μμΈμ£Όμ) , κΈμ¬, μ±λ³ , μλμμΌμ μ λ³΄λ₯Ό μ μ₯νλ€.
    
    κ° μ§μμ νλμ λΆμμ μμλμ΄ μμΌλ©° μ¬λ¬ νλ‘μ νΈμ μ°Έμ¬ν  μ μλ€.
    
    ννΈ κ° μ§μμ΄ μ°Έμ¬ν νλ‘μ νΈ λν ν΄λΉ μ§μμ μ£ΌλΉκ·Όλ¬Έμκ° μ λ³΄λ₯Ό κ΄λ¦¬ν΄μΌ νλ€.
    
    κ° μ§μμ λν ν΄λΉ μ§μμ μ§μμμ¬(κ°λμ)μ λν μ λ³΄λ₯Ό κ΄λ¦¬νλ€.
    
    κ° μ§μμ μΌλ¬ λͺμ λΆμκ°μ‘±μ κ°μ§ μ μλ€, λΆμ κ°μ‘±μ κ°κ°μ λν λΆμκ°μ‘±λͺ , μ±λ³ , μλμμΌ , κ·Έλ¦¬κ³  ν΄λΉ μ§μκ³Όμ κ΄κ³μ λν μ λ³΄λ₯Ό κ΄λ¦¬νλ€
    
    [μ°λ¦¬μ‘° νκ²]
    
    ![https://user-images.githubusercontent.com/92353613/194303950-c086b0de-3f23-400b-b4dc-7c2130233ecd.png](https://user-images.githubusercontent.com/92353613/194303950-c086b0de-3f23-400b-b4dc-7c2130233ecd.png)
    
    - μμ§ λ΅μ λ³΄μ§ λͺ»νλ€.
    

# 2. HTML

[λ°°μΈμ¬μ΄νΈ] [https://www.w3schools.com/html/html_intro.asp](https://www.w3schools.com/html/html_intro.asp) 
κΈ°λ³Έμ μΌλ‘ **βChromeβ** μ¬μ©

[μμ ]

```html
<!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>My First Heading</h1>
<p>My first paragraph.</p>

</body> 
```

- μμκ°μ μ½λλ μλμ κ°μ κ΅¬μ‘°λ‘ λμ΄μλ€.

![https://user-images.githubusercontent.com/92353613/194224609-03951f7a-6661-417d-b72f-7148a749f342.png](https://user-images.githubusercontent.com/92353613/194224609-03951f7a-6661-417d-b72f-7148a749f342.png)

## λ¬Έλ²

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		1.HTML describes the structure of a Web page
		<br>
		2. μΉλΈλΌμ°μ λ ν΄μκΈ°λ€ (html, css, javascript)
		<br>
		<h3>μ λͺ©</h3>
		<a href="https://www.naver.com">λ€μ΄λ² κ°κΈ°</a>
		<br>
		<img src="images/chicken.png" alt="κ²½λ‘κ° λ§μ§ μμμ" width="300" height="300">
		<img alt="κ²½λ‘x" src="images/chicken.png">
		<p>
		λ¬Έλ¨νκ·Έ<br>μν° μ²λ¦¬ν©λλ€<br>μ λ§
		μ
		κΈΈλ€
		μ λ§
		</p>
		<p title="John 'shotgun' nelson"> λ°μ΄ν° νν</p>
		<p title='John "shotgun" nelson'> λ°μ΄ν° νν</p>
		<hr>
		<pre>
		   *
		  ***
		 *****
		*******
		   *
		   *
		   *
		</pre>
	  	<hr>
	  	<!-- html μ£Όμμ²λ¦¬λ μ΄λ κ² ν©λλ€ -->
	  	<!-- ctrl + shift + / -->
	  	<h3>htmlμ μ μ²΄μ μΈ κ΅¬μ‘°λ₯Ό μ μνλ μΈμ΄... λμμΈ μμ νκ³κ° μλ€</h3>
	  	<h3>cssλ₯Ό ν΅ν΄μ λμμΈ μμμ ν©λλ€.</h3>
	  	<font style="color: gold; font-family: κΆμμ²΄"> κΈμμ μ </font>
	  	<br>
	  	htmlλ μμ±μ μ¬μ©νλ©΄ λμμΈ ....
	  	<br>
	  	<font color="red" size="10px" face="λͺμ‘°μ²΄">κΈμμ°μ΅</font>
	</body>
</html>
```

```html
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cssμ μ©νκΈ°</title>
	<!-- Internal ..page λ΄λΆ μ μ© -->
		<style type="text/css">
			body {background-color: gray;}
			h3 {color: pink;}
		</style>
		<link rel="stylesheet" href="css/common.css">
</head>
<body>
<!-- 
Cascading Style Sheets (CSS) is used to format the layout of a webpage.

CSS can be added to HTML documents in 3 ways:

1. Inline - by using the style attribute inside HTML elements
2. Internal - by using a <style> element in the <head> section
3. External - by using a <link> element to link to an external CSS file
 -->
 <h3>1. Inline λ°©μ(νν¬ μμͺ½)</h3>
 <p style="background-color: aqua;">λ¬Έλ¨νκ·Έ</p> <!-- Inline λ°©μ ##μ€μ λ‘ μ¬μ© x-->
 <h3 style="color:green;">λλ λ¬΄μ¨μ(μμͺ½ μμ±μ΄ μ°μ μμ)</h3>
 <h3>νν¬μμΈκ°</h3>
 <h1>μΈλΆ νμΌμ μ°Έμ‘°ν©λλ€.</h1>
 <h3>μΉμμμμ μ λκ²½λ‘</h3>
 <img src="https://www.baemin.com/_next/static/images/qrcode@3x.png">
</body>
</html>
```

# 3. WAS

1. κ°λ
    - WEB μλ²λ HTML λ¬Έμκ°μ μ μ  μ»¨νμΈ λ₯Ό μ²λ¦¬νλ κ²μ΄κ³  (HTTP νλ‘ν μ½μ ν΅ν΄ μ½ν μ μλ λ¬Έμ)
    - WAS μλ²λ asp, php, jsp λ± κ°λ° μΈμ΄λ₯Ό μ½κ³  μ²λ¦¬νμ¬ λμ  μ»¨νμΈ , μΉ μμ© νλ‘κ·Έλ¨ μλΉμ€λ₯Ό μ²λ¦¬νλ κ²μ΄λ€.
    
    [https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcfs2.tistory.com%2Fupload_control%2Fdownload.blog%3Ffhandle%3DYmxvZzgwMjY1QGZzMi50aXN0b3J5LmNvbTovYXR0YWNoLzAvNzIuanBn%22&type=cafe_wa740](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fcfs2.tistory.com%2Fupload_control%2Fdownload.blog%3Ffhandle%3DYmxvZzgwMjY1QGZzMi50aXN0b3J5LmNvbTovYXR0YWNoLzAvNzIuanBn%22&type=cafe_wa740)
    
    [https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fpostfiles9.naver.net%2F20130525_184%2Fidbankbox_1369409035491Jmh2C_PNG%2F052413_1523_WA1.png%3Ftype%3Dw2%22&type=cafe_wa740](https://dthumb-phinf.pstatic.net/?src=%22http%3A%2F%2Fpostfiles9.naver.net%2F20130525_184%2Fidbankbox_1369409035491Jmh2C_PNG%2F052413_1523_WA1.png%3Ftype%3Dw2%22&type=cafe_wa740)
    
    ## μΉμλ²
    
    - μΉλΈλΌμ°μ μ μμ²­μ λ°μμ μ²λ¦¬ν κ²°κ³Όλ₯Ό μΉλΈλΌμ°μ μκ² μ λ¬νλ μ­ν . λ§μ½ νλ‘κ·Έλ¨ μ²λ¦¬κ° νμνλ€λ©΄ μ΄νλ¦¬μΌμ΄μ μλ²λ₯Ό μ¬μ©νκ±°λ νλ‘κ·Έλ¨μ μ§μ  νΈμΆνμ¬ κ²°κ³Όλ₯Ό μμ±.
    - μ£Όλ‘ μ μ μΈ HTML, IMAGE, CSS, μλ°μ€ν¬λ¦½νΈ νμΌμ μΉλΈλΌμ°μ μκ² μ κ³΅ν  λ μΉμλ²λ₯Ό μ¬μ©νλ€.
    
    EX) Apache, nginxλ±
    
    ## **μ΄νλ¦¬μΌμ΄μμλ²**
    
    - μΉμλ²κ° μ²λ¦¬νμ§ λͺ»νλ κ²°κ³Όκ°μ μ²λ¦¬ν΄μΌνλ μ°μ°μ΄λΌλμ§μ μ²λ¦¬λ₯Όνκ³ λμ κ²°κ³Όλ₯Ό μΉμλ²μκ² μ λ¬νλ μ­ν μ νλ€.
    - μΉμλ²μμλ μ μ μΈκ²λ€μ μ²λ¦¬νκ³ , μ΄νλ¦¬μΌμ΄μμλ²κ° νλ‘κ·Έλ¨κΈ°λ₯μ μ κ³΅νλ μ΄μ λ μ±λ₯λλ¬Έμ΄λ€.
    
    EX) Tomcat, Jbossλ±
    
    μΌλ°μ μΌλ‘ μΉμλ²κ°μκ²½μ° μ μ μΈ htmlμ΄λ cssλ₯Ό μ κ³΅νλλ° μ΄μ μ΄ λ§μΆμ΄μ Έ μκ³ , ν°μΊ£μ΄λ μΉλ‘μ§ κ°μ μ΄νλ¦¬μΌμ΄μ μλ²λ jsp,servletκ³Ό κ°μ νλ‘κ·Έλ¨μ μ€ννμ¬ κ²°κ³Όλ₯Ό μ κ³΅νλλ° μ΄μ μ΄ λ§μΆμ΄μ Έ μλ€.