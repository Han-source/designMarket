<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<!-- <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet"> -->
<!-- Custom fonts for this template end-->

<!-- <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->
<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css"> -->
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<!--     <link rel="stylesheet" href="/resources/css/dropdw.css" type="text/css"> -->
<link rel="stylesheet" href="/resources/css/custom.css">
<link rel="stylesheet" href="/resources/css/banner.css" type="text/css">

<!-- End of Topbar -->

<!-- Begin Page Content -->
<div class="inline-blockk">
<nav class="side_menu_nav">
<ul class="side_Menu_Bar">
   <li class="side_Menu_Bar_li"><a class="activeMeenu" href="/post/adminManage">쇼핑몰 판매 현황</a></li>
   <li class="side_Menu_Bar_li"><a class="activeMeenu" href="/business/adminPermission">거래 상품 관리자 허가</a></li>
 </ul>
</nav>
</div>
<div class="inline-blockk" style="width: 70%;">
      <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">쇼핑몰 판매 현황</h6>
      </div>
      <div style="text-align: center;">
	  		<div><input type="radio" name="dateSelect" value="dayOnlyOne" checked>일매출액조회</div>
 			<div><input type="radio" name="dateSelect" value="dayDuring">기간매출액조회</div>
 	  </div>
      <div class="adminPage" id="sliderAdminPage">
      	 <label>전체 현황</label>
	      <div class="adminChart">
			 <canvas id="lookChartProduct" width="600" height="400">
			 </canvas>
			 <div>
			 	전체 화면을 설명해줄 글
			 </div>
	      </div>
	      
      	 <label>일 매출액 조회</label>
	      <div class="adminChart" id="dayPurchase">
			 <canvas id="day1Purchase"  width="600" height="400">
			 </canvas>
			 <form id="frmDate1Pick" method="get" action="/post/adminManage">
				<label>일별보기</label>
				<input id="datePick" type="date" pattern="yyyy-MM-dd" name="datePick"  >
				<button id="btnJoin" class="btn btn-primary" type="button">날짜선택</button>
	        </form>
	       </div>
	        
	       <label>기간 매출액 조회</label>
	       <div class="adminChart" id="duringPurchase">
				 <canvas id="betweenDayPurchase"  width="600" height="400">
				 </canvas>
				 <form id="frmDateBetweenPick" method="get" action="/post/adminManage">
					<label>일별보기</label>
					<input id="firstDate" type="date" pattern="yyyy-MM-dd"name="firstDate"  >
					<input id="lastDate" type="date" pattern="yyyy-MM-dd" name="lastDate"  >
					<button id="betweenDatebtn" class="btn btn-primary" type="button">날짜선택</button>
		        </form>
	      </div>
   
        
      </div>  
	</div>

    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/mixitup.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="/resources/js/sb-admin-2.min.js"></script>
	<script src="/resources/js/js-image-slider.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#duringPurchase').hide();
	$('#dayPurchase').hide();
	
	var frmDate1Pick = $('#frmDate1Pick');
	var frmDateBetweenPick = $('#frmDateBetweenPick');
	$('#btnJoin').on('click', function () {
		frmDate1Pick.submit();
	})
	
	$('#betweenDatebtn').on('click', function () {
		frmDateBetweenPick.submit();
	});
	$("input[name='dateSelect']").on("click",function(){
		var a = $(this).val();
		if($(this).val() == 'dayOnlyOne'){
			$('#dayPurchase').show();
			$('#duringPurchase').hide();
		}else{
			$('#duringPurchase').show();
			$('#dayPurchase').hide();
		}
	});
});

</script>
<script type="text/javascript">
$(document).ready(function() {
	makeChart();
	make1ChartPurchase();
	makeChartBetweenDayPurchase();
});

function makeChart() {
   var ctx = document.getElementById("lookChartProduct");
   var date = new Array();
   var price = new Array();

   <c:forEach items="${purchaseList}" var="item" varStatus="status">
	   date.push("${item.tradeDate}");
	   price.push("${item.productFinalPrice}");
   </c:forEach>
   
   var chart = new Chart(ctx, {
      type : 'line',
      data : {
         labels : date,
         datasets : [ {
            label : "판매현황",
            backgroundColor: 'rgba(255, 99, 132, 0.2)',
            borderColor : 'rgba(255, 99, 132, 0.2)',
            data : price,
            borderWidth: 1
         } ]   
      },
      options : {
         responsive : false,
         scales : {
            yAxes : [ {
               ticks : {
                  beginAtZero : false
               }
            } ]
         }
      }
   });
}




function make1ChartPurchase() {
	   var ctx = document.getElementById("day1Purchase");
	   var date = new Array();
	   var price = new Array();

	   <c:forEach items="${purchase1Day}" var="item" varStatus="status">
		   date.push("${item.tradeDate}");
		   price.push("${item.productFinalPrice}");
	   </c:forEach>
	   
	   var chart = new Chart(ctx, {
	      type : 'bar',
	      data : {
	         labels : date,
	         datasets : [ {
	            label : "판매현황",
	            backgroundColor: 'rgba(255, 99, 132, 0.2)',
	            borderColor : 'rgba(255, 99, 132, 0.2)',
	            data : price,
	            borderWidth: 1
	         } ]   
	      },
	      options : {
	         responsive : false,
	         scales : {
	            yAxes : [ {
	               ticks : {
	                  beginAtZero : false
	               }
	            } ]
	         }
	      }
	   });
	}






function makeChartBetweenDayPurchase() {
	   var ctx = document.getElementById("betweenDayPurchase");
	   var date = new Array();
	   var price = new Array();

	   <c:forEach items="${betweenDayPurchase}" var="item" varStatus="status">
		   date.push("${item.tradeDate}");
		   price.push("${item.productFinalPrice}");
	   </c:forEach>
	   
	   var chart = new Chart(ctx, {
	      type : 'bar',
	      data : {
	         labels : date,
	         datasets : [ {
	            label : "판매현황",
	            backgroundColor: 'rgba(255, 99, 132, 0.2)',
	            borderColor : 'rgba(255, 99, 132, 0.2)',
	            data : price,
	            borderWidth: 1
	         } ]   
	      },
	      options : {
	         responsive : false,
	         scales : {
	            yAxes : [ {
	               ticks : {
	                  beginAtZero : false
	               }
	            } ]
	         }
	      }
	   });
	}

</script>