# π Day51_221103

Author: κ³ λ²μ’
Created Time: 2022λ 11μ 3μΌ μ€μ  9:14
Status: π¨ Published
Tags: ajax, jQuery
Updated Time: 2022λ 11μ 3μΌ μ€ν 8:53

# 1. jQuery

## 1.1 jQuery_Ajax

[https://api.jquery.com/category/ajax/](https://api.jquery.com/category/ajax/)

- Global Ajax Event Handlers  (10%)
- Helper Functions (10%)
- Low-Level Interface : 30% (λͺ¨λ  μ΅μμ κ°λ°μ μ μ΄) >> $.ajax()
- Shorthand Methods   : 50% (κΈ°λ³Έ μ΅μμ κ°μ§κ³  μλ ν¨μ) >> load() , get()

### ****Low-Level Interface****

λ΄ μλ§λλ‘ μλ¦¬λ₯Ό νλ κ²μ²λΌ  μ€μ μ μ΄λμ λ νκ³  μ¨μΌνλ μΈν°νμ΄μ€

- jQuery.ajax()
- jQuery.ajaxPrefilter()
- jQuery.ajaxSetup()
- jQuery.ajaxTransport()

### ****Shorthand Methods****

μ¬λ§νκ² λ€ λ§λ€μ΄μ Έμμ΄ κ·Έλ₯ μ¬μ©νλ©΄ λλ λ©μλ

- jQuery.get()
- jQuery.getJSON()
- jQuery.getScript()
- jQuery.post()
- .load()

## $.load

```jsx
$(function(){
         $('#btn').click(function(){
               //λΉλκΈ° μλ²μ μμ²­
               //Jquery > loadν¨μ
               //Ex01_Server_Date.jsp?msg=hello
               $('#display').load("Ex01_Server_Date.jsp" ,{"msg":$('#msg2').val()} , 
                     function(responseText, textStatus , xhr){
                     //ν¨μλ μλ΅μ΄ μ€λ©΄ [μλ νΈμΆ] > readyState > 4λ²μ΄λΌλ©΄
                     //responseText > μλ²κ° μλ΅ν κ²°κ³Όλ¬Ό (html or text) 
                     //textStatus > (μ±κ³΅ (success) , μ€ν¨ (fail))
                     //Status > μνλ²νΈ > μλ²κ° μλ΅ν > 200 , 304 , 404 , 500
                     if(textStatus == "success"){
                        //μλ΅ 4μ΄κ³  status code = 200
                        console.log("responseText : " + responseText);   
                     }else{
                        //μλ΅ 4μ΄κ³  status code = 404 , 500
                        console.log("response fail : " + xhr.status + " , " + xhr.statusText);   
                     }
               });
               
               
               
         });
         
         $('#bts').click(function () {
        	 $('#dis').load("Ex01_Server_Date.jsp");
			
		})
         
      });
```

- $(βμμ΄λβ).load(βλΉλκΈ° λ¨ΉμΌ jspβ)

## $.post

```jsx
$(function() {
			/*
			jQuery.post( url [, data ] [, success ] [, dataType ] )	
			
			
			1. bad (κ°μ₯ λμλ°©λ²)
			$.post("Ex05_Server.jsp?name=hong&pwd=1004....")
			
			2. 
			const name = $('#name'.val());
			const pwd = $('#pwd'.val());
			const param = "name="+name+ "&pwd="+pwd; 
			$.post("Ex05_Server.jsp",param)
			
			3. jsonκ°μ²΄ parameter
			const data = {"name" : $('#name').val(),
							"pwd" : $('#pwd').val()}
			$.post("Ex05_Server.jsp", data)		
			*/
			
			$('#btn').click(function() {
				const data = {"name" : $('#name').val(),
							"pwd" : $('#pwd').val()}
				$.post("Ex05_Server.jsp",data,function(responsedata){
					//μλ΅μ΄ μκ³  μ μ κ±΄ μ΄λΌλ©΄
					$('#message').html(responsedata);
				});
			})
		})
```

- JSONμΌλ‘ κ°μ λκ²¨μ£ΌκΈ°
- JSP,dataλ₯Ό λκ²¨μ£Όκ³  functionμΌλ‘ κ°μ λ°μμ΄

## $.getJSON

```jsx
$(function(){
		  $('#btn').click(function(){
			 const flickerAPI = "https://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?" 
			 //tags=raccoon&tagmode=any&format=json
			 const data={tags:$('#search').val() ,tagmode:"any" ,format:"json"}
			 console.log(data);
			 $.getJSON(flickerAPI,data,function(data,textStatus,xhr){

				  
				  $('#images').empty();
				  $.each(data.items, function(index,obj){
					 $('<img>').attr("src",obj.media.m).appendTo("#images");
					 //img νκ·Έλ₯Ό μμ±νκ³  src μμ±μ μ΄λ―Έμ§ κ²½λ‘ μ€μ  div append
				  });
			 });
		  });
	  });
```

# μ€μ΅)

- λ°λ¦μ΄(κ³΅κ³΅μμ κ±°)μ λμ¬μμ μ£Όμλ€κ³Ό κ²μμ λΉλκΈ° μ²λ¦¬
- μΉ΄μΉ΄μ€λ§΅ APIλ₯Ό ν΅ν΄ μλ,κ²½λλ₯Ό λ°μ μμΉ μΆλ ₯

```jsx
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
   
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8eb4cb628a81967386ed7ffb18fc3ff6"></script>

   <script type="text/javascript">
      
   $(function(){
      $('#btn').click(function(){
         
         $('#tab').empty();
         
         console.log($("#search2").val());
         
         const api = "http://openapi.seoul.go.kr:8088/717042515a70617239396150684670/json/tbCycleStationInfo/1/" + $('#search').val();
         
         $.getJSON(api, function(data){
            
            $(data.stationInfo.row).each(function(){
               
               if($("#search2").val() == this.STA_LOC || $("#search2").val() == ""){
                  let html = "";
                  html += "<tr>";
                  html += "<td>" + this.STA_LOC + "</td>";
                  html += "<td>" + this.RENT_NO + "</td>";
                  html += "<td>" + this.RENT_NM + "</td>";
                  html += "<td>" + this.HOLD_NUM + "</td>";
                  html += "<td>" + this.STA_ADD1 + "</td>";
                  html += "<td id='btn2'><i class='bi bi-geo-alt-fill'></i><div class='visually-hidden-focusable' id='lat'>" + this.STA_LAT + "</div><div class='visually-hidden-focusable' id='long'>" + this.STA_LONG + "</div></td>" 
                  html += "</tr>";
               
                  $('#tab').append(html);
               }
            });
            
         });
         
      });
      
      $(document).on('click', "#btn2", function(){
    	  
    	  $('#result').empty();
    	  
   			const html3 = "<div id='map' style='width:100%;height:400px;'></div>";
     		$('#result').append(html3);
     		
     		const s1 = $(this).children('#lat').text();
     		const s2 = $(this).children('#long').text();
     		
     		console.log(s1 + "/" + s2);
     		
     		var container = document.getElementById('map');
		    var options = {
		    	center: new kakao.maps.LatLng(s1, s2),
		        level: 2
		    };
		    
		    var map = new kakao.maps.Map(container, options);
		    
		 	// λ§μ»€κ° νμλ  μμΉμλλ€ 
		    var markerPosition  = new kakao.maps.LatLng(s1, s2); 

		    // λ§μ»€λ₯Ό μμ±ν©λλ€
		    var marker = new kakao.maps.Marker({
		        position: markerPosition
		    });

		    // λ§μ»€κ° μ§λ μμ νμλλλ‘ μ€μ ν©λλ€
		    marker.setMap(map);
      
      });
   });
   
   </script>

</head>
<body class="m-5">
   μΆλ ₯ λ°μ΄ν° κ±΄μ μλ ₯ : <input type="text" id="search" value="1000">
   κ΅¬ λ¨μ κ²μ : <input type="text" id="search2">
   
   <input type="button" id="btn" value="κ²μ">
   
   <div id="result" class="mt-5"></div>
   
   <div class="mt-5">
      <table class="table table-hover">
         <thead>
         <tr class="table-dark">
            <td>λμ¬μκ·Έλ£Ήλͺ</td>
            <td>λμ¬μλ²νΈ</td>
            <td>λμ¬μλͺ</td>
            <td>κ±°μΉλμ</td>
            <td>μ£Όμ</td>
            <td></td>
         </tr>   
         </thead>
         <tbody id="tab">
         
         </tbody>
      </table>
   </div>
   
   
</body>
</html>
```