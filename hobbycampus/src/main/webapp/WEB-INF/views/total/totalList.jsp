<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체 통계 페이지</title>
	<!-- Title Icon -->
    <link href="img/main.ico" rel="shortcut icon" type="image/x-icon">
	<!--BootStarp-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<!-- Chart.js --> 
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- CSS -->
    <link rel="stylesheet" href="/hobbycampus/css/main.css">
    <style>
    	.main-area{
    		width: 80%;
    		margin: 0px auto;
    		min-height: 70vh;
    	}
    	.margin-space{
    		opacity: 0;
    	}
    </style>
	</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/admin/adminHeader.jsp"></jsp:include>
	
	<!-- Main -->
	<main class="main-area">
		<!-- User Total -->
		<article class="teacher-total bg-light rounded-3">
			<div class="container">
				<!-- User Total Title -->
				<div class="row my-3">
					<div class="col-12 text-center fs-2 fw-bold">
						<i class="bi bi-pie-chart"></i> 학생 통계
					</div>
				</div>
				<!-- User Gender Total -->
				<div class="row my-2">
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body">
								<canvas id="userGender"></canvas>
							</div>
						</div>
					</div>
					<!-- User Sign-up Total -->
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body">
								<canvas id="userSignup"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="margin-space">빈공간</div>
			</div>
		</article>
		
		<!-- Teacher Total -->
		<article class="teacher-total bg-light rounded-3">
			<div class="container">
				<!-- Teacher Total Title -->
				<div class="row my-3">
					<div class="col-12 text-center fs-2 fw-bold">
						<i class="bi bi-pie-chart"></i> 강사 통계
					</div>
				</div>
				<!-- Teacher Gender Total -->
				<div class="row my-2">
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body">
								<canvas id="teacherGender"></canvas>
							</div>
						</div>
					</div>
					<!-- Teacher Sign-up Total -->
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body">
								<canvas id="teacherSignup"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="margin-space">빈공간</div>
			</div>
		</article>
		
		<!-- Category One Total -->
		<article class="category-one-total bg-light rounded-3">
			<div class="container">
				<!-- Category One Total Title -->
				<div class="row my-3">
					<div class="col-12 text-center fs-2 fw-bold">
						<i class="bi bi-intersect"></i> 큰 카테고리 통계
					</div>
				</div>
				<!-- Category One Total -->
				<div class="row my-2">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<canvas id="categoryOne"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="margin-space">빈공간</div>
			</div>
		</article>
		
		<!-- Category Two Total -->
		<article class="category-two-total bg-light rounded-3">
			<div class="container">
				<!-- Category Two Total Title -->
				<div class="row my-3">
					<div class="col-12 text-center fs-2 fw-bold">
						<i class="bi bi-bar-chart-line"></i> 작은 카테고리 통계
					</div>
				</div>
				<!-- Category Two Total -->
				<div class="row my-2">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<canvas id="categoryTwo"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="margin-space">빈공간</div>
			</div>
		</article>
		
		<!-- Sales Total -->
		<article class="category-two-total bg-light rounded-3">
			<div class="container">
				<!-- Sales Total Title -->
				<div class="row my-3">
					<div class="col-12 text-center fs-2 fw-bold">
						<i class="bi bi-graph-up"></i> 매출 통계
					</div>
				</div>
				<!-- Sales Total -->
				<div class="row my-2">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<canvas id="sales"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="margin-space">빈공간</div>
			</div>
		</article>
	</main>
	
	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
<script>
	
	/* User Total data*/
	var $userGenderData = {
		datasets: [{backgroundColor: ['#46BEFF','#FF9CBB'],data: [${ug.male},${ug.female}]}], //ug -> User Gender
		labels: ['남자','여자']
	};
	
	var $userGender = $('#userGender');
	var $userGenderChart = new Chart($userGender, {
		type: 'pie',
		data: $userGenderData,
		options: {}
	});
	
	var $userSignUp = document.getElementById('userSignup').getContext('2d');
	var $userSignUpChart = new Chart($userSignUp, {
		type: 'line',
		data: {
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			datasets: [{
				label: '학생 가입 추이',
				backgroundColor: 'transparent',
				borderColor: '#36E0C6',
				data: [${um.m01},${um.m02},${um.m03},${um.m04},${um.m05},${um.m06},${um.m07},${um.m08},${um.m09},${um.m10},${um.m11},${um.m12}] //um -> User sign-up count group by Month
			}]
		},
		options: {}
	});
	
	
	/* Teacher Total data*/
	var $teacherGenderData = {
		datasets: [{backgroundColor: ['#46BEFF','#FF9CBB'],data: [${tg.male},${tg.female}]}], //tg -> Teacher Gender
		labels: ['남자','여자']
	};
	
	var $teacherGender = $('#teacherGender');
	var $teacherGenderChart = new Chart($teacherGender, {
		type: 'pie',
		data: $teacherGenderData,
		options: {}
	});
	
	var $teacherSignUp = document.getElementById('teacherSignup').getContext('2d');
	var $teacherSignUpChart = new Chart($teacherSignUp, {
		type: 'line',
		data: {
			labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			datasets: [{
				label: '강사 가입 추이',
				backgroundColor: 'transparent',
				borderColor: '#36E0C6',
				data: [${tm.m01}, ${tm.m02}, ${tm.m03}, ${tm.m04}, ${tm.m05},${tm.m06}, ${tm.m07}, ${tm.m08}, ${tm.m09}, ${tm.m10}, ${tm.m11}, ${tm.m12}]
			}]
		},
		options: {}
	});
	
	
	/* Category One data */
	var test = "Eating, Drinking, Sleeping, Designing, Coding, Cycling, Running";
	var $cateOneData = {
		labels: ['Eating', 'Drinking', 'Sleeping', 'Designing', 'Coding', 'Cycling', 'Running'],
		datasets: [{
			label: '큰 카테고리 비중',
		    data: [65, 59, 90, 81, 56, 55, 40],
		    fill: true,
		    backgroundColor: 'rgba(210, 153, 83, 0.2)',
		    borderColor: 'rgb(210, 153, 83)',
		    pointBackgroundColor: 'rgb(210, 153, 83)',
		    pointBorderColor: '#fff',
		    pointHoverBackgroundColor: '#fff',
		    pointHoverBorderColor: 'rgb(210, 153, 83)'
		}]
	};
	
	var $cateOne =  $('#categoryOne'); //categoryOne
	var $cateOneChart = new Chart($cateOne, {
		type: 'radar',
		data: $cateOneData,
		options: {}
	});
	
	
	/* Category Two data */
	var $cateTwo = $('#categoryTwo');
	var myChart = new Chart($cateTwo, {
		type: 'bar',
		data: {
			labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			datasets: [{
				label: '작은 카테고리 수요',
				data: [12, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)', 
					'rgba(54, 162, 235, 0.2)', 
					'rgba(255, 206, 86, 0.2)', 
					'rgba(75, 192, 192, 0.2)', 
					'rgba(153, 102, 255, 0.2)', 
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)', 
					'rgba(54, 162, 235, 1)', 
					'rgba(255, 206, 86, 1)', 
					'rgba(75, 192, 192, 1)', 
					'rgba(153, 102, 255, 1)', 
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			}
		}
	});
	
	
	/* Sales data */
	var $sales = $('#sales');
	var $total = [10, 20, 30, 40, 20, 30, 50, 60, 40, 50, 60, 80];
	var $refund = [5, 10, 20, 7, 10, 4, 5, 13, 10, 8, 4, 3];
	var $exchange = [4, 2, 1, 4, 5, 6, 7, 3, 2, 23, 24, 10];

	var $salesData = {
		type: 'bar',
		labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		datasets : [
			{
				label: '총 매출',
				data : $total,
				backgroundColor: 'rgba(40, 140, 40, 0.3)'
			},
			{
				label: '환불',
				data: $refund,
				backgroundColor: 'transparent',
				borderColor: 'rgba(255, 80, 207)',
				type: 'line'
			},
			{
				label: '환전',
				data: $exchange,
				backgroundColor: 'transparent',
				borderColor: 'rgba(100, 140, 255)',
				type: 'line'
			}
		]
		};
		var $salesChart = new Chart($sales, {
			type: 'bar',
			data: $salesData,
			options: {
				legend: {
					display: true
				}
			}
		});
	
</script>
</html>