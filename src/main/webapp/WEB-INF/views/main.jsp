<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
  <h1>Google Survey</h1>
  	<hr>
        <div>
           <sec:authorize access="isAnonymous()">
              <a href="/login">로그인</a>
              <a href="/beforeSignUp">회원가입</a>
           </sec:authorize>   
           <sec:authorize access="isAuthenticated()">
           <sec:authentication property="principal" var="principal"/>
              <h2>${principal.uName}님</h2>
           </sec:authorize>            
        </div>
        <div>
        	<sec:authorize access="isAuthenticated()">        
               <a href="/user/info">내 정보</a>
               <a href="/logout">로그아웃</a>
         	</sec:authorize>
         	<c:choose>
				<c:when test = "${fn:contains(principal.authorities, 'ROLE_ADMIN')}">
         			<a href="/admin">관리자</a>
         		</c:when>	
         	</c:choose>
        </div>
     	<sec:authorize access="isAuthenticated()">
	     	<hr>
		     	<h2>내 설문</h2>
		     		<table>
				     	<c:forEach items="${surveylist}" var="s">
					     	<tr>
								<td><a href="/survey/read?sNo=${s.sNo}">${s.sTitle}</a>&nbsp;</td>
								<td>${s.sDatetime}</td>
								<td><button type = 'button' class = 'deleteSurvey' sNo="${s.sNo}">설문 삭제</button></td>
							</tr>
						</c:forEach>
					</table>
					<br>
					<a href="/survey/make">설문 만들기</a>
        </sec:authorize>
	     
		
	 <hr>
	 	<h2>설문 참여하기</h2>
	 		<table>
		     	<c:forEach items="${surveylistall}" var="s2">
			     	<tr>
						<td><a href="/survey/participate?sNo=${s2.sNo}">${s2.sTitle}</a>&nbsp;</td>
						<td>${s2.sDatetime}</td>
					</tr>
				</c:forEach>
			</table>
	             
</body>
<script>
$(document).on('click', '.deleteSurvey', function () {
	let sNo = $(this).attr('sNo');
		
	$(this).parent().parent().remove();
	
	$.ajax({
		method: "POST",
		url: "/survey/delete",
		data: {sNo: sNo}
	})
});
</script>
</html>