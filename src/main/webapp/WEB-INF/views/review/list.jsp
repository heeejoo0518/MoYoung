<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%> 
<link rel="stylesheet" href="${ path }/css/reviewList.css">
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
        
        <br><br><br><br><br>
        <form action="${ path }/review/list" method="GET">
        <input type="hidden" name="no" value="${no}">
        <div id="div-sort" >
        <div id="spoiler-text">
        	스포일러 게시글<input type="checkbox" id="spoBox" class="spoBox" onclick="">
        </div>
        <select id="sort-select" name="sort" onchange="this.form.submit();">
            <option >정렬 방식 선택</option>
            <option value="a" id="1">최근 작성한 글</option>
            <option value="b" id="2">별점 높은 순</option>
            <option value="c" id="3">별점 낮은 순</option>
        </select>
        </div>
        </form>
        
        
        <br>
        <br>
        <c:if test="${ empty list }">
        		<p id="empty-list">등록된 게시글이 없습니다.</p>
		</c:if>
        <c:if test="${!empty list  }">
        	<c:forEach var="review" items="${ list }">
        	
		        <div id="div-list-container">
		        	<div id="div-user-nickname">
		        		<span class="span-nickname"><c:out value="${review.nickname }"/></span>
		        		
		        		<!--  <span class="span-nickname"><c:out value="${ no }"/></span>
		        		-->
		        		
		        		<span>
		        			<c:choose>
		        				<c:when test="${ review.rate == 0 }">
			        				<img  src="${ path }/images/noStar_img.png" width="20" height="20">
		        				</c:when>
								<c:when test="${ review.rate == 1}">
									<img  src="${ path }/images/oneStar_img.png" width="20" height="20">
								</c:when>		        			
								<c:when test="${ review.rate == 2 }">
			        				<img  src="${ path }/images/twoStar_img.png" width="40" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 3 }">
			        				<img  src="${ path }/images/threeStar_img.png" width="60" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 4 }">
			        				<img  src="${ path }/images/fourStar_img.png" width="80" height="20">
		        				</c:when>
		        				<c:when test="${ review.rate == 5 }">
			        				<img  src="${ path }/images/fiveStar_img.png" width="100" height="20">
		        				</c:when>
		        			</c:choose>
			        	</span>
		        	</div>
		        	
					        
		        	
		        	<!-- 스포일러(0)==스포일러 포함X -->
		        	<c:choose>
		        		<c:when test="${ review.spoiler eq '0' }">
				        	<div id="div-user-content">
				        		<c:out value="${ review.content }"/>
				        	</div>
		        		</c:when>
		        		
		        		<c:when test="${ review.spoiler eq '1' }">
		        			<div id="divP">
		        			<p style="text-align: center">스포일러가 포함된 리뷰를 보려면 좌측 체크!</p>
		        			</div>
		        			<div id="div-user-spoilerContent" class="div-user-spoilerContent"> 
		        				<c:out value="${ review.content }"/>
				        	</div>
		        		</c:when>
		        	</c:choose>
		        	
		        	
		        	<hr>
		        	<div id="div-like" style="padding-left: 10px;">
		        	<!-- <span class="like-count"> <c:out value="${ review.likeCount }"></c:out>개</span> -->
		        		<span class="writeDate"> <fmt:formatDate type="date" value="${ review.writeDate }"/> </span>
		        	</div>
		        	
		        	<c:if test="${!empty signinMember && signinMember.nickname == review.nickname}">
		        	<div id="div-btn">
		        	<button type="button" id="btnDelete" onclick="location.href='${ path }/review/delete?reviewNo=${review.reviewNo}&no=${no}'" >삭제하기</button> <!-- 좋아요 버튼 -->


							<!--  <button id="btnLike" onchange="this.form.submit();"> 좋아요 !</button>
		        		-->
		        		
		        	</div>
		        	</c:if>
		        	
		        	<!--   게시글 번호를 가져오면 삭제 가능,, 현재까지 가져올 방법을 못찾음
		        	<script>
						var reviewNo = '<:cout value="${reviewNo}"/>';
						function btnDelete(){
							if(confirm("리뷰를 삭제하시겠습니까?")){
								location.replace("${ path }/review/delete?reviewNo=${reviewNo}");
								console.log(reviewNo)
							} else{
								alert("취소하셨습니다.");
							}
						}
					</script>
					-->
		
		        </div>
        </c:forEach>
        </c:if>
        
        <!--  
        <script> 
				        var review_content = '<c:out value="${review.content}"/>';
				        var loginNickname = '<c:out value="${loginMember.nickname}"/>';
				        var reviewNickname = '<c:out value="${review.nickname}"/>';
				        	function btnSpoiler(){
				        		if(confirm("스포일러가 포함된 리뷰를 확인하시겠습니까?")){
					        		document.getElementById("div-user-spoilerContent").innerHTML=review_content;
				        		} else{
				        			alert("취소하셨습니다.");
				        		}
				        			
				        		console.log(loginNickname);
				        		console.log(reviewNickname);
				        		console.log(review_content);
				       		}
				       		
				       		
				       		
				       			$(function(){
        		$("#spoBox").("click", function(){
        			if(confirm("스포일러가 포함된 리뷰를 확인하시겠습니까?")){
	        			$('.div-user-spoilerContent').css({'background-color' : 'white'});
	        					
        			} else{
        				alert("취소하셨습니다.")
        			}
        		});
        	});
		</script>
		-->
		
        <script>
        	$(document).ready(function(){
        	    $("#spoBox").change(function(){
        	        if($("#spoBox").is(":checked")){
        	            alert("스포일러 포함 리뷰를 확인합니다!");
    	        		$('.div-user-spoilerContent').css({'background-color' : 'white'});
        	        }else{
        	            alert("스포일러 포함 리뷰를 가립니다!");
        	            $('.div-user-spoilerContent').css({'background-color' : 'black'});
        	        }
        	    });
        	});
        </script>
        
        
	<!--  
       	  <script>
       	$(document).ready(function () {
       		$("#btn-spoiler").on('click', function() {
       			spoilerCheck();
       		})
       	});
       	
       	function spoilerCheck(){
       		$.ajax({
       			url: "${ path }/review/list",
       			type: "POST",
       			data :
       				
       		})
       	}
        	
        </script>
        -->
			   
		        <div id="pageBar" style="text-align:center;">
					<!-- 맨 처음으로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=1'">&lt;&lt;</button>
					
					<!-- 이전 페이지로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ pageInfo.prvePage }'">&lt;</button>
		
					<!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
						<c:if test="${ pageInfo.currentPage == status.current}">
							<button disabled><c:out value="${ status.current }"/></button>
						</c:if>
						<c:if test="${ pageInfo.currentPage != status.current}">
							<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ status.current }'">
								<c:out value="${ status.current }"/>
							</button>
						</c:if>
					</c:forEach>
					
					<!-- 다음 페이지로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ pageInfo.nextPage }'">&gt;</button>
					
					<!-- 맨 끝으로 -->
					<button onclick="location.href='${ path }/review/list?no=${no}&sort=${sort}&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
				</div>
				
				
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
