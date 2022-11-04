
$('#btn').click(function(){
         
    $('#tab').empty();
    
    console.log($("#search2").val());
    
    //서울시 공공데이터 공공자전거 json링크
    console.log($('#search').val());
    const api = "http://openapi.seoul.go.kr:8088/키입력/json/tbCycleStationInfo/1/" + $('#search').val();
    
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