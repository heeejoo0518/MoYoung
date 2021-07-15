<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두의영화 상세보기</title>

<!--Google Font-->
<link rel="stylesheet"
	href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">
<!-- CSS files -->
<link rel="stylesheet" href="${ path }/css/plugins.css">
<link rel="stylesheet" href="${ path }/css/style.css">
</head>
<!--preloading-->
<div id="preloader">
	<img class="logo" src="${ path }/images/logo1.png" alt="" width="119"
		height="58">
	<div id="status">
		<span></span> <span></span>
	</div>
</div>
<!--end of preloading-->

<!-- top search form -->
<header class="ht-header" style="background-color: #020d18;">
	<div class="container">
		<div class="top-search">
			<select>
				<!-- 추후에 보고 수정할 것  -->
				<option value="united">영화</option>
				<option value="saab">드라마/예능/기타</option>
			</select> <input type="text" placeholder="검색을 원하시는 컨텐츠의 제목을 입력하세요">
		</div>
	</div>
</header>
<!-- END | Header -->

<div class="hero common-hero" style="background-color: #020d18;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="hero-ct"></div>
			</div>
		</div>
	</div>
</div>

<div class="page-single movie-single movie_single" style="background-color: #020d18;">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-4 col-sm-12 col-xs-12">
				<div class="movie-img sticky-sb">
					<img src="${ movie.m_poster }" alt="">
					<div class="movie-btn">
						<div class="btn-transform transform-vertical red">
							<div>
								<a href="#" class="item item-1 redbtn"> 
								<i class="ion-play"></i>
									예고편 보기
								</a>
							</div>
							<div>
								<a href="${movie.trailer}"
									class="item item-2 redbtn fancybox-media hvr-grow"><i
									class="ion-play"></i></a>
							</div>
						</div>
						<div class="social-btn" style="margin-bottom: 10px">
							<a href="#" class="parent-btn">봤어요<i class="ion-checkmark"></i></a>
							<a href="#" class="parent-btn">찜하기<i class="ion-heart"></i></a> <a
								href="#" class="parent-btn">리뷰쓰기<i class="ion-edit"></i></a>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="movie-single-ct main-content"
					style="padding-top: 280px;">

					<h1 class="bd-hd">
						<c:out value="${ movie.title_kor }" /><span><c:out value="${ movie.product_year }" /></span>
					</h1>
					<h3 class="bd-hd">
						<span><c:out value="${ movie.title }" /></span>
					</h3>

					<div class="movie-rate">
						<div class="rate-star">
							<p>모영 별점</p>
						</div>
						<div class="rate">
							<i class="ion-android-star"></i>
							<p>
								<span><c:out value="${ movie.vote }" /></span> /5 <br> <span class="rv">56개의 리뷰</span>
							</p>
						</div>
						<br>
					</div>

					<div class="movie-rate" style="height: 100px">
						<div class="rate-star">
						<c:if test="${ not empty movie.netflix }">
											<a href="${ movie.netflix }">
												<img src="${ path }/images/netflix.jpg" alt="netflixlogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
										<c:if test="${ not empty movie.watcha }">
											<a href="${ movie.watcha }">
												<img src="${ path }/images/watcha.jpg" alt="watchalogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
										<c:if test="${ not empty movie.tving }">
											<a href="${ movie.tving }">
												<img src="${ path }/images/tving.jpg" alt="tvinglogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
										<c:if test="${ not empty movie.wavve }">
											<a href="${ movie.wavve }">
												<img src="${ path }/images/wavve.jpg" alt="neflogo" style="width: 50px; height: 50px">
											</a> 
										</c:if>
<!-- 							<a href="https://www.netflix.com/"><img class="slogo" -->
<%-- 								src="${ path }/images/netflix.jpg"></a> <img class="slogo" --%>
<%-- 								src="${ path }/images/watcha.jpg" alt=""> <img --%>
<%-- 								class="slogo" src="${ path }/images/tving.jpg" alt=""> <img --%>
<%-- 								class="slogo" src="${ path }/images/wavve.jpg" alt=""> --%>
						</div>
					</div>
					<div class="movie-tabs">
						<div class="tabs">
							<ul class="tab-links tabs-mv">
								<li class="active"><a href="#overview">작품정보</a></li>
								<li><a href="#reviews"> 리뷰</a></li>
							</ul>
							<div class="tab-content">
								<div id="overview" class="tab active">
									<div class="row">
										<div class="col-md-8 col-sm-12 col-xs-12">
											<p><c:out value="${ movie.story }"/></p>

											<div class="title-hd-sm">
												<h4>출연진</h4>
											</div>
											<!-- movie cast -->
											<div class="mvcast-item">
												<div class="cast-it">
													<div class="cast-left">
														<img src="${ path }/images/uploads/cast1.jpg" alt="">
														<a href="#">Robert Downey Jr.</a>
													</div>
													<p>... Robert Downey Jr.</p>
												</div>
												<div class="cast-it">
													<div class="cast-left">
														<img src="${ path }/images/uploads/cast2.jpg" alt="">
														<a href="#">Chris Hemsworth</a>
													</div>
													<p>... Thor</p>
												</div>
												<div class="cast-it">
													<div class="cast-left">
														<img src="${ path }/images/uploads/cast3.jpg" alt="">
														<a href="#">Mark Ruffalo</a>
													</div>
													<p>... Bruce Banner/ Hulk</p>
												</div>
											</div>
											<div class="title-hd-sm">
												<h4>모영 리뷰</h4>
												<a href="#" class="time">모든 모영 리뷰 보기<i
													class="ion-ios-arrow-right"></i></a>
											</div>
											<!-- movie user review -->
											<div class="mv-user-review-item">
												<div class="user-review-likeAndReport" style="color:white; float:right;">
													<i class="ion-heart"></i>
													<i class="ion-flag"></i>					
												</div>		
												
												<div class="no-star">
													<i class="ion-android-star"></i> <i
														class="ion-android-star"></i> <i class="ion-android-star"></i>
													<i class="ion-android-star"></i> <i
														class="ion-android-star"></i> <i
														class="ion-android-star last"></i>
												</div>
												<p class="time">
													17 December 2016 by <a href="#"> hawaiipierson</a>
												</p>
												<p>This is by far one of my favorite movies from the
													MCU. The introduction of new Characters both good and bad
													also makes the movie more movies (and I do love everything Marvel), 
													the plotting is
													splendid (they really do out do themselves in each film,
													there are no problems watching it more than once.</p>
											</div>
											<br><br>
											<div class="user-review-summary">
												<div class="mv-user-review-item">

													<!--  신고하기 / 좋아요 버튼 이정도에 들어오면 될거같은데.. -->
													<div class="no-star">
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i class="ion-android-star"></i>
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i
															class="ion-android-star last"></i>
													</div>
													<p class="time">
														17 December 2016 by <a href="#"> hawaiipierson</a>
													</p>
													<p>This is by far one of my favorite movies from the
														MCU. The introduction of new Characters both good and bad
														also makes the movie more exciting. giving the characters
														more of a back story can also help audiences relate more
														to different characters better, and it connects a bond
														between the audience and actors or characters. Having seen
														the movie three times does not bother me here as it is as
														thrilling and exciting every time I am watching it. In
														other words, the movie is by far better than previous
														movies (and I do love everything Marvel), the plotting is
														splendid (they really do out do themselves in each film,
														there are no problems watching it more than once.</p>
												</div>
											</div>
										
										

										</div>
										<div class="col-md-4 col-xs-12 col-sm-12">
											<div class="sb-it">
												<h6>Director:</h6>
												<p>
													<a href="#">Joss Whedon</a>
												</p>
											</div>											
											<div class="sb-it">
												<h6>Stars:</h6>
												<p>
													<a href="#">Robert Downey Jr,</a> <a href="#">Chris
														Evans,</a> <a href="#">Mark Ruffalo,</a><a href="#">
														Scarlett Johansson</a>
												</p>
											</div>
											<div class="sb-it">
												<h6>Genres:</h6>
												<p>
													<a href="#">Action, </a> <a href="#"> Sci-Fi,</a> <a
														href="#">Adventure</a>
												</p>
											</div>
											<div class="sb-it">
												<h6>Release Date:</h6>
												<p>May 1, 2015 (U.S.A)</p>
											</div>
											<div class="sb-it">
												<h6>Run Time:</h6>
												<p>141 min</p>
											</div>
											<div class="sb-it">
												<h6>MMPA Rating:</h6>
												<p>PG-13</p>
											</div>
											<div class="ads">
												<img src="${ path }/images/uploads/ads1.png" alt="">
											</div>
										</div>
									</div>
								</div>
								
								
								
								<!-- 리뷰 탭 -->
								<div id="reviews" class="tab review">
									<div class="row">
										<div class="rv-hd">
											<div class="div">
												<h2>Skyfall: Quantum of Spectre</h2>
											</div>
											<a href="#" class="redbtn">리뷰 작성</a>
										</div>
										<div class="topbar-filter">
											<p>
												총 <span>56</span>개의 리뷰가 있습니다.
											</p>

										</div>
										<div class="mv-user-review-item">
											<div class="user-infor">
												<img src="${ path }/images/uploads/userava1.jpg" alt="">
												<div>
													<h3>Best Marvel movie in my opinion</h3>
													<div class="no-star">
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i class="ion-android-star"></i>
														<i class="ion-android-star"></i> <i
															class="ion-android-star"></i> <i
															class="ion-android-star last"></i>
													</div>
													<p class="time">
														17 December 2016 by <a href="#"> hawaiipierson</a>
													</p>
												</div>
											</div>
											<p>This is by far one of my favorite movies from the MCU.
												The introduction of new Characters both good and bad also
												makes the movie more exciting. giving the characters more of
												a back story can also help audiences relate more to
												different characters better, and it connects a bond between
												the audience and actors or characters. Having seen the movie
												three times does not bother me here as it is as thrilling
												and exciting every time I am watching it. In other words,
												the movie is by far better than previous movies (and I do
												love everything Marvel), the plotting is splendid (they
												really do out do themselves in each film, there are no
												problems watching it more than once.</p>
										</div>
										
										
										<div class="topbar-filter">
											<label>Reviews per page:</label> <select>
												<option value="range">5 Reviews</option>
												<option value="saab">10 Reviews</option>
											</select>
											<div class="pagination2">
												<span>Page 1 of 6:</span> <a class="active" href="#">1</a> <a
													href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a
													href="#">5</a> <a href="#">6</a> <a href="#"><i
													class="ion-arrow-right-b"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<script src="${ path }/js/plugins.js"></script>
<script src="${ path }/js/plugins2.js"></script>
<script src="${ path }/js/custom.js"></script>
</body>
</html>