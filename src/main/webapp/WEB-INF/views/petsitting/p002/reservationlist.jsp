<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../../includes/header.jsp"%>
<style>

.heading-section{
	width: 100%;
	display: block;
}
.main-raised{
	margin: 1% 15% 7% ;
}
.reservation-row{
	display: inline-block;
	width: 100%;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}

.reservation-list{
	display: flex;
    border: solid 1px gray;
    margin: 25px;
    border-radius: 15px;
}
.card-body{
	display:inline-block;
	width: 60%;
	padding: 15px;
}

.crop{	
	display: inline-block;
	max-width: 205px;
	max-height: 145px;
	overflow: hidden;
}

.card-img-top{
	padding: 10px;
}

.crop img{
    max-height: initial;
    margin-top: -15%;
}

.reserved-date-div{
	display: inline-block;
    width: 68%;
    float: right;
    position: relative;
    left: -4%;
}

.reserved-date{
	display: inline-block;
	margin-top: 0px;
	padding: 0px 10px
}

.cancel-btn{
	display: inline-block;
    width: 12%;
    padding: 1.5% 1%;
}

.btn-danger{
	border-radius: 15px;
}

.btnform{
	padding: 10px 0px
}

.btn-log--register{
    margin: 0px;
    padding: 9px 30px;
    border-radius: 15px;
    background: #fff;
    border: solid 1px;
    border-color: #79a4ca;
    color: #79a4ca;
    transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out,
    			border-color 0.35s ease-in-out, box-shadow 0.35s ease-in-out,
    			-webkit-box-shadow 0.35s ease-in-out;
}
.btn-log--register:hover{
	color: #fff;
	background: #79a4ca;
	border-color: #79a4ca;
}

.btn-log--lookup{
    margin: 0px;
    padding: 9px 30px;
    border-radius: 15px;
    background: #fff;
    border: solid 1px;
    border-color: #69acb8;
    color: #69acb8;
    transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out,
    			border-color 0.35s ease-in-out, box-shadow 0.35s ease-in-out,
    			-webkit-box-shadow 0.35s ease-in-out;
}

.btn-log--lookup:hover{
    color: #fff;
    background: #69acb8;
    border-color: #69acb8;
}

.btn-reserved--cancel{
    margin: 0px;
    padding: 9px 30px;
    border-radius: 15px;
    background: #fff;
    border: solid 1px;
    border-color: #dc3545;
    color: #dc3545;
    transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out,
    			border-color 0.35s ease-in-out, box-shadow 0.35s ease-in-out,
    			-webkit-box-shadow 0.35s ease-in-out;
}

.btn-reserved--cancel:hover{
	color: #fff;
	background: #dc3545;
	border-color: #dc3545;
}

.btn-log--review{
    margin: 0px;
    padding: 9px 30px;
    border-radius: 15px;
    background: #fff;
    border: solid 1px;
    border-color: #905bc8;
    color: #905bc8;
    transition: color 0.35s ease-in-out, background-color 0.35s ease-in-out,
    			border-color 0.35s ease-in-out, box-shadow 0.35s ease-in-out,
    			-webkit-box-shadow 0.35s ease-in-out;
}

.btn-log--review:hover{
	color: #fff;
	background: #9c85c7;
	border-color: #9c85c7;
}

.color_white {
	color: #F9F9F9;
	
}

.white-title{
	font-family:GmarketSansBold; 
	font-size:2.5rem !important
}

.floating_text {
	display: relative;
	z-index: 1;
}

.section_space {
	padding-top: 4rem;
	padding-bottom: 4rem;
}

@media screen and (max-width: 770px){
	.main-raised {
	    margin: 0% 3% 7%;
	}
	
	.white-title {
		margin: 0px;
		font-size:2rem !important
	}
	
	.list-div{
		margin: 10px;
	}
	
	.reservation-list {
	    display: flex;
	    border: solid 1px gray;
	    margin: 15px 0px;
	    border-radius: 7px;
	}
	.crop {
	    display: inline-block;
	    max-width: 85px;
	    max-height: 94px;
	    overflow: hidden;
	}
	.card-body {
	    display: inline-block;
	    width: 60%;
	    padding: 5px;
	}
	.card-text{
	    margin: 0px;
    	font-size: 10px;
	}
	.reserved-sitter{
	    margin-top: 0px;
	    margin-bottom: 0px;
	    font-size: 13px;
	}
	
	.reserved-date-div{
	    width: 55%;
	    left: -10%;
	}
	
	.reserved-date{
	    margin: 0px;
    	font-size: 10px;
	}
	.btnform {
	    padding: 5px 0px;
	}
	
	.btn{
	    font-size: 10px !important;
   		padding: 0px;
    	border-radius: 5px;
    	width: 100%;
    	height: 35px;
	}
}

@media screen and (max-width: 750px){
	.reservation-top{
		height: 170px !important;
	
	}
	.section_space{
		padding-top:0px;
	}

	.btn-log{
		width:100%;
		font-size: 10px !important;
		padding: 5px 5px;
		border-radius: 6px;
	}
	
	.card-img-top{
		padding: 0px;
	}
	.reserved-sitter{
		font-size: 11px;
	}
	.reserved-date-div{
		padding-top: 15px;
	}
}



@font-face {
	font-family: 'GmarketSansBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}


</style>

<!--====  str of contents  ====-->
    <section style="padding-top:87px">
    	<div class="col-xs-12 page-header header-filter reservation-top" data-parallax="true" style="background-image: url('/resources/images/bg/re.jpg'); height : 400px;transform: translate3d(0px, 0px, 0px);">
	    	<div class="floating_text pt-5 pb-5  mt-5 text-center heading-section m-auto">
	             <h1 class="color_white white-title">예약 목록</h1>
	        </div>
    	</div>
        
        <div class="main main-raised">
            <div class="profile-content section_space">
                <div class="container">
                    <div class="row justify-content-center pt-3" data-aos="fade-up">
                        <div class="text-center heading-section">
                        </div>
                        <div class="reservation-row">
	                        <div class="list-div">
								<!-- 탭 메뉴 -->							
								<nav>
									<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
										<a class="nav-item nav-link active show" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><strong class="first">내 돌봄 목록</strong></a> 
										<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"><strong class="second">내 예약 목록</strong></a>
									</div>
								</nav>
								<c:set var="currentDate" value='#{date }' />
								<c:set var="currentTime" value='#{currentTime }' />
								<!-- 탭 내용 -->
								
<!-- ----------------------------------시터 전용 돌봄 목록------------------------------------ -->
								<div class="list-container-sitter">
									<div class="list-div">
										<c:forEach var="custlist" items="${myCustList }">
			                                <input type="hidden" value="${custlist.start_Time2 }">
										
											<div class="reservation-list">
			                            		
				                                <div class="card-body">
				                                	<!-- 주문 번호 -->
													<p class="card-text">예약 번호 : ${custlist.order_ID }</p>
					                                <!-- 사진 -->
				                            		<div class="crop">
				                                    	<img class="card-img-top" src="https://www.dingpet.shop/img/${custlist.member_Photo }"> <!-- C:\test\pic\ff8fe0c3-e64d-462d-ab7a-fb4152345112profile_pngguru.com (7).png -->
					                                </div>
				                                	<!-- 닉네임 / 예약일시 -->
				                                	<div class="reserved-date-div" align="center">
				                                	
				                                		<h5 class="reserved-sitter" style="margin-top: 0px">펫시터 예약 - ${custlist.member_NickName } 고객님</h5>
				                                	
					                                	<h5 class="reserved-date" >시작 ${custlist.start_Date } ${custlist.start_Time }:00</h5>
					                                	<h5 class="reserved-date">종료 ${custlist.end_Date } ${custlist.end_Time }:00</h5>
				                                    </div>
				                                    <!-- 주소 -->
				                                    <!-- 버튼 -->
				                                    
				                                </div>
				                                <div class="cancel-btn">
				                                	<c:if test="${custlist.start_Time2 <= currentTime && currentTime <= custlist.end_Time2 }">
														<form class="btnform" action="/petsitting/p003/logregister" method="post">
															<input type="hidden" name="reservation_ID" value="${custlist.order_ID }">
						                                    <button class="btn-log btn-log--register">일지<br>등록</button>
					                               		</form>
					                               	</c:if>
				                                	<c:if test="${currentTime >= custlist.start_Time2 }">
					                               		<form class="btnform" action="/petsitting/p003/loglookup" method="post">
															<input type="hidden" name="reservation_ID" value="${custlist.order_ID }">
						                                    <button class="btn-log btn-log--lookup ">일지<br>조회</button>
					                               		</form>
					                               	</c:if>
				                                	<c:if test="${currentTime < custlist.start_Time2}">
						                                <form class="btnform" action="kakaoPayCancel" method="post" onsubmit="return check()">
						                                    <input type="hidden" class="order_ID" name="order_ID" value="${custlist.order_ID }">
															<button class="btn-log btn-reserved--cancel">예약<br>취소</button>
					                               		</form>
					                               	</c:if>
			                               		</div>
											</div>
										</c:forEach>
									</div>
								</div>
<!-- --------------------------------------------------------------------------------------- -->
								
<!-- ----------------------------------유저 공통 목록------------------------------------------- -->
								
								<div class="list-container-common">
									<div class="list-div">
										<c:forEach var="sitterlist" items="${mySitterList }">
											<div class="reservation-list">
			                            		
				                                <div class="card-body">
				                                	<!-- 주문 번호 -->
													<p class="card-text">예약 번호 : ${sitterlist.order_ID }</p>
					                                <!-- 사진 -->
				                            		<div class="crop">
				                                    	<img class="card-img-top" src="https://www.dingpet.shop/img/${sitterlist.sitter_Photo }"> <!-- C:\test\pic\ff8fe0c3-e64d-462d-ab7a-fb4152345112profile_pngguru.com (7).png -->
					                                </div>
				                                	<!-- 닉네임 / 예약일시 -->
				                                	<div class="reserved-date-div" align="center">
				                                	
				                                		<h5 class="reserved-sitter" style="margin-top: 0px">펫시터 예약 - ${sitterlist.sitter_NickName } 시터</h5>
				                                	
					                                	<h5 class="reserved-date" >시작 ${sitterlist.start_Date } ${sitterlist.start_Time }:00</h5>
					                                	<h5 class="reserved-date">종료 ${sitterlist.end_Date } ${sitterlist.end_Time }:00</h5>
				                                    </div>
				                                    <!-- 주소 -->
				                                    <!-- 버튼 -->
				                                    
				                                </div>
				                                <div class="cancel-btn">
				                                	<c:if test="${currentTime > sitterlist.end_Time2}">
					                                	<form class="btnform" action="/petsitting/p004/reviewregister" method="get">
															<input type="hidden" name="reservation_ID" value="${sitterlist.order_ID }">
						                                    <button class="btn-log btn-log--review">리뷰<br>등록</button>
					                               		</form>
					                               	</c:if>
				                                	<c:if test="${currentTime >= sitterlist.start_Time2 }">
					                               		<form class="btnform" action="/petsitting/p003/loglookup" method="post">
															<input type="hidden" name="reservation_ID" value="${sitterlist.order_ID }">
						                                    <button class="btn-log btn-log--lookup">일지<br>조회</button>
					                               		</form>
					                               	</c:if>
				                                	<c:if test="${currentTime < sitterlist.start_Time2}">
						                                <form class="btnform" action="kakaoPayCancel" method="post" onsubmit="return check()">
						                                  
						                                    <input type="hidden" class="order_ID" name="order_ID" value="${sitterlist.order_ID }">
															<button class="btn-log btn-reserved--cancel">예약<br>취소</button>
					                               		</form>
					                               	</c:if>
			                               		</div>
											</div>
										</c:forEach>
									</div>
								</div>
<!-- ---------------------------------------------------------------------------------------- -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<input type="hidden" class="privilege_ID" value="01">
    <!--====  end of contents  ====--> 
	<script>
		function check(){
			
			var result = confirm("예약을 취소하시겠습니까?");
			
			if(result){
				return true;
			}else{
				return false;
			}
		}
	
		function currentDate(){
			
			var current = new Date();
			var year = current.getFullYear();
			var month = current.getMonth()+1;
			var day = current.getDate();
			var time = curent.getTime();
			console.log(time);
			
			if(month.length < 2)
				month = "0"+month;
			if(day.length < 2 )
				day = "0"+day;
			
			var currentDate = year+month+day;
			
			return currentDate
		}
		
		$(document).ready(function(){
			if($(".privilege_ID").val() == 01){		// 로그인한 유저가 시터라면
				$(".list-container-common").css('display', 'none');
				$(".list-container-sitter").css('display', 'block');
				$("#nav-home-tab").on("click", function(){
					$(".list-container-common").css('display', 'none');
					$(".list-container-sitter").css('display', 'block');
				})
				
				$("#nav-profile-tab").on("click", function(){
					$(".list-container-common").css('display', 'block');
					$(".list-container-sitter").css('display', 'none');
				})
			}else if($(".privilege_ID").val() == 02){		// 로그인한 유저가 일반 유저라면
				$(".list-container-common").css('display', 'block');
				$(".list-container-sitter").css('display', 'none');
				$(".first").empty();
				$(".first").text("내 예약 목록");
				$("#nav-home-tab").css('display', 'none');
			}
		})
	</script>
<%@include file="../../includes/footer.jsp"%>
