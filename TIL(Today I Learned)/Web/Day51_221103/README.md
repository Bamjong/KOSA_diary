# 📚 Day51_221103

Author: 고범종
Created Time: 2022년 11월 3일 오전 9:14
Status: 🖨 Published
Tags: ajax, jQuery
Updated Time: 2022년 11월 3일 오후 8:53

# 1. jQuery

## 1.1 jQuery_Ajax

[https://api.jquery.com/category/ajax/](https://api.jquery.com/category/ajax/)

- Global Ajax Event Handlers  (10%)
- Helper Functions (10%)
- Low-Level Interface : 30% (모든 옵션을 개발자 제어) >> $.ajax()
- Shorthand Methods   : 50% (기본 옵션을 가지고 있는 함수) >> load() , get()

### ****Low-Level Interface****

내 입맛대로 요리를 하는 것처럼  설정을 어느정도 하고 써야하는 인터페이스

- jQuery.ajax()
- jQuery.ajaxPrefilter()
- jQuery.ajaxSetup()
- jQuery.ajaxTransport()

### ****Shorthand Methods****

웬만하게 다 만들어져있어 그냥 사용하면 되는 메소드

- jQuery.get()
- jQuery.getJSON()
- jQuery.getScript()
- jQuery.post()
- .load()

## $.load

```jsx
$(function(){
         $('#btn').click(function(){
               //비동기 서버에 요청
               //Jquery > load함수
               //Ex01_Server_Date.jsp?msg=hello
               $('#display').load("Ex01_Server_Date.jsp" ,{"msg":$('#msg2').val()} , 
                     function(responseText, textStatus , xhr){
                     //함수는 응답이 오면 [자동 호출] > readyState > 4번이라면
                     //responseText > 서버가 응답한 결과물 (html or text) 
                     //textStatus > (성공 (success) , 실패 (fail))
                     //Status > 상태번호 > 서버가 응답한 > 200 , 304 , 404 , 500
                     if(textStatus == "success"){
                        //응답 4이고 status code = 200
                        console.log("responseText : " + responseText);   
                     }else{
                        //응답 4이고 status code = 404 , 500
                        console.log("response fail : " + xhr.status + " , " + xhr.statusText);   
                     }
               });
               
               
               
         });
         
         $('#bts').click(function () {
        	 $('#dis').load("Ex01_Server_Date.jsp");
			
		})
         
      });
```

- $(’아이디’).load(”비동기 먹일 jsp”)

## $.post

```jsx
$(function() {
			/*
			jQuery.post( url [, data ] [, success ] [, dataType ] )	
			
			
			1. bad (가장 나쁜방법)
			$.post("Ex05_Server.jsp?name=hong&pwd=1004....")
			
			2. 
			const name = $('#name'.val());
			const pwd = $('#pwd'.val());
			const param = "name="+name+ "&pwd="+pwd; 
			$.post("Ex05_Server.jsp",param)
			
			3. json객체 parameter
			const data = {"name" : $('#name').val(),
							"pwd" : $('#pwd').val()}
			$.post("Ex05_Server.jsp", data)		
			*/
			
			$('#btn').click(function() {
				const data = {"name" : $('#name').val(),
							"pwd" : $('#pwd').val()}
				$.post("Ex05_Server.jsp",data,function(responsedata){
					//응답이 왔고 정상 건 이라면
					$('#message').html(responsedata);
				});
			})
		})
```

- JSON으로 값을 넘겨주기
- JSP,data를 넘겨주고 function으로 값을 받아옴

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
					 //img 태그를 생성하고 src 속성에 이미지 경로 설정 div append
				  });
			 });
		  });
	  });
```

# 실습)

- 따릉이(공공자전거)의 대여소의 주소들과 검색을 비동기 처리
- 카카오맵 API를 통해 위도,경도를 받아 위치 출력

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
		    
		 	// 마커가 표시될 위치입니다 
		    var markerPosition  = new kakao.maps.LatLng(s1, s2); 

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        position: markerPosition
		    });

		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
      
      });
   });
   
   </script>

</head>
<body class="m-5">
   출력 데이터 건수 입력 : <input type="text" id="search" value="1000">
   구 단위 검색 : <input type="text" id="search2">
   
   <input type="button" id="btn" value="검색">
   
   <div id="result" class="mt-5"></div>
   
   <div class="mt-5">
      <table class="table table-hover">
         <thead>
         <tr class="table-dark">
            <td>대여소그룹명</td>
            <td>대여소번호</td>
            <td>대여소명</td>
            <td>거치대수</td>
            <td>주소</td>
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