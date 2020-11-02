<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   request.setCharacterEncoding("UTF-8");

session = request.getSession(true);

//HttpSession session2 = request.getSession();
String name = (String) session.getAttribute("name");
//String k_name = (String)session.getAttribute("k_name");
%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/home.js"></script> --%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/utilProduct.css" />
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/home.css" />
</head>

<body>
   <%@include file="include/header.jsp"%>


   <!--배너-->
   
  <div class="container">
  <div class="row home_banner">
    <div class="col-sm-6 col-md-7 col-lg-7">
            <div class="banner-img">
            <img src="img/api-2x.png" />
         </div>
     
    </div>
    <div class="col-sm-6 col-md-5 col-lg-5 home_banner_a">
      <a href="" id="banner-class-a">
            <div class="home_banner_box">
         
            <h3 class="banner-class-name" id="banner-class-name">안상욱 선생님의 API특강</h3> <br /> 
            <br><br><br>
            <span class="banner-class-content" id="banner-class-category">이 특강 한번이면 초간단하게 만드는 api!</span>
         </div>
      </a>
    </div>
    
 
  </div>
</div>
   
   <div class="banner">
      <div class="banner-class">
         
         
      </div>
      
   </div>

   <section>
      <h3>지금 인기 TOP10</h3>
      <hr />
      <div class="swiper-container">
         <div class="swiper-wrapper">

            <c:forEach var="item" items="${TopProductList }" varStatus="vs">
               <div class="class-view-minibox swiper-slide">
                  <a href="${pageContext.request.contextPath}/Product/ProductDetail?product=${item.pno}">
                     <div class="class-minibox-img">
                        <img
                           src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${item.pno}" />
                     </div>
                     <div class="class-minibox-info">
                        <span class="class-minibox-cartegory">${item.category }</span><br />
                        <span class="class-minobox-name">${item.title }</span><br />
                        <hr />
                        <span class="class-minibox-price">${item.price }원</span><br>
                        
                        <c:if test="${item.term == 0 }">
                        	<span>${(item.term+1) * 2 }회</span>
                        </c:if>
                        <c:if test="${item.term != 0 }">
                        	<span>${(item.term) * 2 }회</span>
                        </c:if>
                     </div>
                  </a>
               </div>
            </c:forEach>
				<div class="class-view-minibox swiper-slide">
               		<a href="#">
                  	<div class="class-minibox-img">
                     	<img src="img/banner3.jpg" />
                  	</div>
                  	<div class="class-minibox-info">
                    	<span class="class-minibox-cartegory">요리</span><br /> 
                    	<span class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     	<hr />
                     	<span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  	</div>
              		 </a>
            	</div>
            <div class="class-view-minibox swiper-slide">
               <a href="#">
                  <div class="class-minibox-img">
                     <img src="img/banner3.jpg" />
                  </div>
                  <div class="class-minibox-info">
                     <span class="class-minibox-cartegory">요리</span><br /> <span
                        class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     <hr />
                     <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  </div>
               </a>
            </div>
            <div class="class-view-minibox swiper-slide">
               <a href="#">
                  <div class="class-minibox-img">
                     <img src="img/banner3.jpg" />
                  </div>
                  <div class="class-minibox-info">
                     <span class="class-minibox-cartegory">요리</span><br /> <span
                        class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     <hr />
                     <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  </div>
               </a>
            </div>
         </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
      </div>
      
      
      
         <div id="charts">
            <div id="chart-container"></div>
            <div id="browser_cart"></div>
         </div>



         <h3>신규 클래스</h3>
         <hr />
         <div class="class-view-box">
         
         	
         	<c:forEach var="item" items="${RecentProductList }" varStatus="vs">
               <div class="class-view-minibox swiper-slide">
                  <a href="${pageContext.request.contextPath}/Product/ProductDetail?product=${item.pno}">
                     <div class="class-minibox-img">
                        <img
                           src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${item.pno}" />
                     </div>
                     <div class="class-minibox-info">
                        <span class="class-minibox-cartegory">${item.category }</span><br />
                        <span class="class-minobox-name">${item.title }</span><br />
                        <hr />
                        <span class="class-minibox-price">${item.price }원</span><br>
                        <c:if test="${item.term == 0 }">
                        	<span>${(item.term+1) * 2 }회</span>
                        </c:if>
                        <c:if test="${item.term != 0 }">
                        	<span>${(item.term) * 2 }회</span>
                        </c:if>
                     </div>
                  </a>
               </div>
            </c:forEach>
         	

            
         </div>
         
         
         <h3>모든 클래스</h3>
         <hr />
         <div class="class-view-box">
         
         	<c:forEach var="item" items="${allProductlist }" varStatus="vs">
               <div class="class-view-minibox">
                  <a href="${pageContext.request.contextPath}/Product/ProductDetail?product=${item.pno}">
                     <div class="class-minibox-img">
                        <img src="${pageContext.request.contextPath}/Display/ProductThumbnail?pno=${item.pno}" />
                     </div>
                     <div class="class-minibox-info">
                        <span class="class-minibox-cartegory">${item.category }</span><br />
                        <span class="class-minobox-name">${item.title }</span><br />
                        <hr />
                        <span class="class-minibox-price">${item.price }원</span><br>
                        <c:if test="${item.term == 0 }">
                        	<span>${(item.term+1) * 2 }회</span>
                        </c:if>
                        <c:if test="${item.term != 0 }">
                        	<span>${(item.term) * 2 }회</span>
                        </c:if>
                     </div>
                  </a>
               </div>
            </c:forEach>
            
            <div class="class-view-minibox">
               <a href="#">
                  <div class="class-minibox-img">
                     <img src="img/banner3.jpg" />
                  </div>
                  <div class="class-minibox-info">
                     <span class="class-minibox-cartegory">요리</span><br /> <span
                        class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     <hr />
                     <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  </div>
               </a>
            </div>
            <div class="class-view-minibox">
               <a href="#">
                  <div class="class-minibox-img">
                     <img src="img/banner3.jpg" />
                  </div>
                  <div class="class-minibox-info">
                     <span class="class-minibox-cartegory">요리</span><br /> <span
                        class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     <hr />
                     <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  </div>
               </a>
            </div><div class="class-view-minibox">
               <a href="#">
                  <div class="class-minibox-img">
                     <img src="img/banner3.jpg" />
                  </div>
                  <div class="class-minibox-info">
                     <span class="class-minibox-cartegory">요리</span><br /> <span
                        class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     <hr />
                     <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  </div>
               </a>
            </div><div class="class-view-minibox">
               <a href="#">
                  <div class="class-minibox-img">
                     <img src="img/banner3.jpg" />
                  </div>
                  <div class="class-minibox-info">
                     <span class="class-minibox-cartegory">요리</span><br /> <span
                        class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     <hr />
                     <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  </div>
               </a>
            </div><div class="class-view-minibox">
               <a href="#">
                  <div class="class-minibox-img">
                     <img src="img/banner3.jpg" />
                  </div>
                  <div class="class-minibox-info">
                     <span class="class-minibox-cartegory">요리</span><br /> <span
                        class="class-minobox-name">계란으로 만드는 20가지 브런치</span><br />
                     <hr />
                     <span class="class-minibox-price">월 32,000원</span><span>(3개월)</span>
                  </div>
               </a>
            </div>
         </div>
   </section>

   <script>
      var asd = document.getElementById("k_name");
      asd.innerHTML = sessionStorage.getItem('k_name');
   </script>

   <footer>
     
      <div class="footer-name">WeStudy</div>
  

      <div class="footer-copyright">
         <div class="footer-agreement">
             이용약관  | 개인정보처리방침  |  사업자 정보 확인    <br>  제휴/협력 문의  |  단체/기업 교육 문의  |  정기구독 서비스
         </div>
         <div class="footer-description">
         (주)클래스101 | 대표 고지연 | 서울특별시 중구 통일로 10 세브란스빌딩 18층 | 사업자등록번호
            : 457-81-00277 | 통신판매업신고 : 2019-서울중구-0087 | 주식회사 클래스101은 전자상거래 등에서의
            소비자보호에 관한 법률에 따른 통신판매업과 통신판매중개업을 영위하고 있습니다. 주식회사 클래스101은 통신판매중개자로서
            중개하는 통신판매에 관하여서는 통신판매의 당사자가 아니므로 어떠한 책임도 부담하지 아니합니다.
         </div>
      </div>
   </footer>
   
   
   
   <script>
   
   var list = '${LineGraphList}';
   console.log(list.length);
   
   console.log("야호");
     
   var categoryArr = '${LineGraphCategoryArr0}';
   console.log(categoryArr);

   var categoryArr = '${LineGraphCategoryArr1}';
   console.log(categoryArr);

   var categoryArr = '${LineGraphCategoryArr2}';
   console.log(categoryArr);

   var categoryArr = '${LineGraphCategoryArr3}';
   console.log(categoryArr);

   var categoryArr = '${LineGraphCategoryArr4}';
   console.log(categoryArr);
   
   

   var sumArr = '${LineGraphSumArr0}';
   console.log(sumArr);

   var sumArr = '${LineGraphSumArr1}';
   console.log(sumArr);
   
   var sumArr = '${LineGraphSumArr2}';
   console.log(sumArr);
   
   var sumArr = '${LineGraphSumArr3}';
   console.log(sumArr);
   
   var sumArr = '${LineGraphSumArr4}';
   console.log(sumArr);
   

   console.log("야호");
      
   Highcharts.chart('chart-container', {

       title: {
           text: '월별 수강생 수, 4월-8월'
       },

       subtitle: {
           text: '월별 학생수 증감 추이'
       },

       yAxis: {
           title: {
               text: 'Number of Student'
           }
       },
       
       xAxis: {
    	   categories: ['4월', '5월', '6월', '7월', '8월']
       },
       
       legend: {
           layout: 'vertical',
           align: 'right',
           verticalAlign: 'middle'
       },

       
 
       series: [{
           name: '운동',
           data: [4, 7, 8, 12, ${LineGraphSumArr0}]
       }, {
           name: '요리',
           data: [3, 5, 7, 7, ${LineGraphSumArr1}]
       }, {
           name: '미술',
           data: [3, 5, 9, 15, ${LineGraphSumArr2}]
       }, {
           name: '수공예',
           data: [5, 7, 9, 11, ${LineGraphSumArr3}]
       }, {
           name: '자기계발',
           data: [4, 6, 7, 8, ${LineGraphSumArr4}]
       }]
        
       
       /* series: [{
           name: 'Installation',
           data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
       }, {
           name: 'Manufacturing',
           data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
       }, {
           name: 'Sales & Distribution',
           data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
       }, {
           name: 'Project Development',
           data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
       }, {
           name: 'Other',
           data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
       }] */
   });
   
   
   
   
   //https://www.it-swarm.dev/ko/javascript/jquery-highcharts%EB%A5%BC-%EC%82%AC%EC%9A%A9%ED%95%98%EC%97%AC-%EC%9B%90%ED%98%95-%EC%B0%A8%ED%8A%B8%EC%97%90-%EB%B0%B1%EB%B6%84%EC%9C%A8-%EB%8C%80%EC%8B%A0-%EA%B0%92%EC%9D%84-%ED%91%9C%EC%8B%9C%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95/941603799/
   var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'browser_cart',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '카테고리 별 개설된 강좌의 수'
            },
            tooltip: {
                formatter: function() {
                    return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['운동',   ${PiGraphPercentageArr0}],
                    ['요리',       ${PiGraphPercentageArr1}],
                    ['미술',   ${PiGraphPercentageArr2}], 
                    ['수공예',    ${PiGraphPercentageArr3}],
                    ['자기계발',     ${PiGraphPercentageArr4}],
                ]
            }]
        });
    });
    
    
    
    
    
    
    
    
    
    
    let bannerArr = [
		{
			/*TopThreeProductList*/
			/* imgSrc: 'img/banner1.jpg', */
			/* imgSrc: 'img/banner' + ${TopThreeProductListPno0} +'.jpg', */
			imgSrc: '${pageContext.request.contextPath}' + '/Display/ProductThumbnail?pno=' + ${TopThreeProductListPno0},
			bannerTitle: '제목...1',
			bannerContent: '내용...1',
		},
		{
			imgSrc: 'img/banner2.jpg',
			imgSrc: '${pageContext.request.contextPath}' + '/Display/ProductThumbnail?pno=' + ${TopThreeProductListPno1},
			bannerTitle: '제목..2',
			bannerContent: '내용..2',
		},
		{
			imgSrc: 'img/banner3.jpg',
			imgSrc: '${pageContext.request.contextPath}' + '/Display/ProductThumbnail?pno=' + ${TopThreeProductListPno2},
			bannerTitle: '제목...3',
			bannerContent: '내용...3',
		}
	];

	let bannerCounter = 0;
	const bannerWrapper = $('.banner-img');
	const bannerTitle = $('#banner-class-name');
	const bannerCategory = $('#banner-class-category');
	const bannerClassA = $('#banner-class-a');
	
	setInterval(function() {
		
		
		let i = bannerCounter++ % bannerArr.length;
		
		console.log(i);
		/* 
		for(var bannerCounter = 0; bannerCounter < 2; bannerCounter++){
			if(bannerCounter==0){
				bannerTitle.html('${TopThreeProductListTitle0}');
			} else if(bannerCounter==1) {
				bannerTitle.html('${TopThreeProductListTitle1}');
			} else if(bannerCounter==2) {
				bannerTitle.html('${TopThreeProductListTitle2}');
			}
		}
		 */
		if(i==0){
			bannerTitle.html('${TopThreeProductListTitle0}');
			bannerCategory.html('${TopThreeProductListCategory0}');
			bannerClassA.attr('href','${pageContext.request.contextPath}' + '/Product/ProductDetail?product=' + ${TopThreeProductListPno0});
		} else if(i==1) {
			bannerTitle.html('${TopThreeProductListTitle1}');
			bannerCategory.html('${TopThreeProductListCategory1}');
			bannerClassA.attr('href','${pageContext.request.contextPath}' + '/Product/ProductDetail?product=' + ${TopThreeProductListPno1});
		} else if(i==2) {
			bannerTitle.html('${TopThreeProductListTitle2}');
			bannerCategory.html('${TopThreeProductListCategory2}');
			bannerClassA.attr('href','${pageContext.request.contextPath}' + '/Product/ProductDetail?product=' + ${TopThreeProductListPno2});
		}
		
		const item = bannerArr[i];
		if (!item.img) {
			/* console.log(!item.img);
			console.log(bannerCounter); */
			
			
			const bannerImg = $('<img>');
			bannerImg.attr('src', item.imgSrc);
			
			
			
			/* bannerTitle.html("asddsa"); */
			
			item.img = bannerImg;
			const testImg = new Image();
			testImg.src = item.imgSrc;
			testImg.onload = function(e) {
				

			};
		}
		
		bannerWrapper.html(item.img);
		// $(".banner-background").css("background-color", getAverageRGB(bannerArr[bannerCounter]))
	}, 2000);

	var swiper = new Swiper('.swiper-container', {
		spaceBetween: 0, //마진값
		slidesPerView: 4,
		loop: false,
		rebuildOnUpdate: true,
		direction: getDirection(),
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		on: {
			resize: function () {
				swiper.changeDirection(getDirection());
			},
		},
	});

	function getDirection() {
		var windowWidth = window.innerWidth;
		var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

		return direction;
	}
	
	
	
	
	
	function getAverageRGB(imgEl) {
		var blockSize = 5, // only visit every 5 pixels
			defaultRGB = { r: 0, g: 0, b: 0 }, // for non-supporting envs
			canvas = document.createElement('canvas'),
			context = canvas.getContext && canvas.getContext('2d'),
			data,
			width,
			height,
			i = -4,
			length,
			rgb = { r: 0, g: 0, b: 0 },
			count = 0;

		if (!context) {
			return defaultRGB;
		}

		height = canvas.height = imgEl.naturalHeight || imgEl.offsetHeight || imgEl.height;
		width = canvas.width = imgEl.naturalWidth || imgEl.offsetWidth || imgEl.width;

		context.drawImage(imgEl, 0, 0);

		try {
			data = context.getImageData(0, 0, width, height);
		} catch (e) {
			/* security error, img on diff domain */
			return defaultRGB;
		}

		length = data.data.length;

		while ((i += blockSize * 4) < length) {
			++count;
			rgb.r += data.data[i];
			rgb.g += data.data[i + 1];
			rgb.b += data.data[i + 2];
		}

		// ~~ used to floor values
		rgb.r = ~~(rgb.r / count);
		rgb.g = ~~(rgb.g / count);
		rgb.b = ~~(rgb.b / count);

		return rgb;
	}
    
    
    
   </script>
</body>
</html>