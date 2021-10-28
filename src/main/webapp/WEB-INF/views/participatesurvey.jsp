<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h1>${sv.sTitle}</h1>
		<hr>
		<sec:authentication property="principal" var="principal"/>
		<c:forEach items="${sv.questionlist}" var="q">
			<div style="border:1px solid; padding:10px;">
				<p>${q.qContent}</p>
				<c:choose>
					<c:when test="${q.qKind == 'short'}">
						<input type="text" placeholder="단답형 답변" class = "answerstring">
						<input type="hidden" value="${q.qMaster}">
						<input type="hidden" value="${q.qKind}">
						<input type="hidden" value="${q.qIndex}">
						<input type="hidden" value="${principal.uNo}">	
					</c:when>
					<c:when test="${q.qKind == 'long'}">
						<input type="text" placeholder="장문형 답변" class = "answerstring">
						<input type="hidden" value="${q.qMaster}">
						<input type="hidden" value="${q.qKind}">
						<input type="hidden" value="${q.qIndex}">
						<input type="hidden" value="${principal.uNo}">	
					</c:when>
					<c:when test="${q.qKind == 'multiplechoice'}">
						<c:forEach items="${sv.examplelist}" var="e">
							<c:if test="${q.qIndex == e.eIndex}">
								<p><input type="radio" name="${e.eIndex}" value="${e.eNo}" class="answernum">${e.eContent}</p>
								<input type="hidden" value="${q.qMaster}">
								<input type="hidden" value="${q.qKind}">
								<input type="hidden" value="${q.qIndex}">
								<input type="hidden" value="${principal.uNo}">		
							</c:if>
						</c:forEach>
					</c:when>
					<c:when test="${q.qKind == 'checkbox'}">
						<c:forEach items="${sv.examplelist}" var="e">
							<c:if test="${q.qIndex == e.eIndex}">
								<p><input type="checkbox"  name="choice" value="${e.eNo}" class="answernum">${e.eContent}</p>
								<input type="hidden" value="${q.qMaster}">
								<input type="hidden" value="${q.qKind}">
								<input type="hidden" value="${q.qIndex}">
								<input type="hidden" value="${principal.uNo}">
							</c:if>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</c:forEach>
		<button type = "button" class = "submit" sNo="${sv.sNo}">제출</button>
<script>
$(document).on('click', '.submit', function () {
	let answer = {
		answernumlist : [],
		answerstringlist : [] 
	}
	
	$(".answerstring").each(function(index) {
		let answerstring = {};
		
		answerstring.aMaster =  $(this).next().val();
		answerstring.aKind =  $(this).next().next().val();
		answerstring.aIndex = $(this).next().next().next().val();
		answerstring.aContent =  $(this).val();
		answerstring.aWriter =  $(this).next().next().next().next().val();
		
		answer.answerstringlist.push(answerstring);
	});
	
	$("input.answernum:checked").each(function(index) {
		let answernum = {};
		
		answernum.aMaster = $(this).parent().next().val();
		answernum.aKind = $(this).parent().next().next().val();
		answernum.aIndex = $(this).parent().next().next().next().val();
		answernum.aContent = $(this).val();
		answernum.aWriter = $(this).parent().next().next().next().next().val();
		
		answer.answernumlist.push(answernum);
    });
	
	let answerresult = JSON.stringify(answer);
	
	$.ajax({
		method: "POST",
		url: "/survey/participate/save",
		data: answerresult,
		contentType : "application/json",
		success: function(data) {
			let url = "/";
			location.replace(url);
		}
	})	
});
</script>
</body>
</html>