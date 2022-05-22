<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fa752bb8bee88bb512ff3ddcbd04a52f&libraries=services"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), 
	mapOption = {
	    center: new daum.maps.LatLng(37.537187, 127.005476), 
	    level: 5 
	};
	var map = new daum.maps.Map(mapContainer, mapOption);
	var geocoder = new daum.maps.services.Geocoder();
	var marker = new daum.maps.Marker({
	position: new daum.maps.LatLng(37.537187, 127.005476),
	map: map
	});
	function sample5_execDaumPostcode() {
	new daum.Postcode({
	    oncomplete: function(data) {
	        var addr = data.address; 
	        document.getElementById("offline_addr").value = addr;	  
	        geocoder.addressSearch(data.address, function(results, status) {
	            
	            if (status === daum.maps.services.Status.OK) {	
	                var result = results[0]; 		            
	                var coords = new daum.maps.LatLng(result.y, result.x);
	                mapContainer.style.display = "block";
	                map.relayout();
	                map.setCenter(coords);
	                marker.setPosition(coords)
	            }
	        });
	    }
	}).open();
	
	}
</script>
<!-- Title Icon -->
<link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!--CSS-->
   <link rel="stylesheet" href="/hobbycampus/css/main.css">
   <style>
       	#lessonAdd{
   			background-color: beige;
    		color : black;
    		font-weight: bold;
    		text-decoration: underline;
   	}
  </style>
</head>
<body>
<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<!-- SIDEBar -->
	<main class="mainArea">
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="/WEB-INF/views/myPageSide.jsp"></jsp:include>		
		</div>
		<!-- main -->
		<div class="col-md-10">
		<!-- Title -->
		<article class="title">
			<div class="row text-center m-5">
				<h2><i class="bi bi-arrow-down-circle-fill "></i> 강의 상세 정보 등록 </h2>
			</div>
		</article>
		
		<form action="offlineLessonForm.do" method="post" name="offlineLessonForm" enctype="multipart/form-data">
			<div class="row g-3">
				<input type="hidden" name="l_idx" value="${l_idx}">
				<input type="hidden" name="save" value="${save}">
			
			
			
			
			<div class="col-10">
              <label for="online_subj" class="form-label">주소</label>
             
              <div class="col-md-6" >
              <input type="text" class="form-control" id="offline_addr" name="offline_addr" 
              		 required="required" placeholder="주소" readonly="readonly">
              </div>
              <div class="col-md-2" >
              <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
              </div>
              </div>
              <div class="invalid-feedback">
                주소를 입력해주세요
              </div>	
            </div>
            
            <div class="col-10">
            	<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>
            </div>
            
            <div class="col-10">
            	<label for="offlineFolder" class="form-label">이미지 등록</label>
				<input type="file" class="form-file" name="offlineFolder">
            </div>
            
            
            <div class="col-md-10">
              <label for="offline_runtime" class="form-label">강의 시간</label>
              <select class="form-select" name="offline_runtime" >
                <option value="1">1시간</option>
                <option value="2">2시간</option>
                <option value="2">3시간</option>
                <option value="2">4시간</option>
                <option value="2">5시간</option>
                <option value="2">6시간</option>
              </select>
            </div>
            
            
            <div class="col-10">
              <label for="offline_cont" class="form-label">강의 상세 설명</label>
              <div class="col-10">
              <textarea name="offline_cont" class="form-textarea" style="resize: none;" cols="155" rows="5" ></textarea>
              </div>
              <div class="invalid-feedback">
                강의 상세 설명을 입력해주세요
            </div>
              </div>
            <div>
            <button class="col-md-10 btn btn-primary btn-lg" type="submit">상세 내용 등록</button>
            </div>
		</form>
		
		</div>
		</div>
	</main>
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>