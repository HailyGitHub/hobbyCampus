<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=09e575b6e58e258e273960eece5ed355&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), 
        level: 3 
    };  


var map = new kakao.maps.Map(mapContainer, mapOption); 


var geocoder = new kakao.maps.services.Geocoder();



geocoder.addressSearch(mapAddr, function(result, status) {

   
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">수업 위치</div>'
        });
        infowindow.open(map, marker);

        
        map.setCenter(coords);
    } 
});    
</script>

</body>
</html>