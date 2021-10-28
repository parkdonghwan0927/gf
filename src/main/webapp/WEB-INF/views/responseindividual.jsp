<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
  border: 1px solid black;
}
</style>
</head>
<body>
	<c:forEach items="${resultlist}" var="result">
		<div>
			<p style="font-size:24px; font-family:'돋움'">${result.rQuestion}</p>
			<c:forEach items="${resultlist2}" var="result2">
				<c:if test="${result.rIndex == result2.rIndex}">
					<c:if test="${result2.rKind == 'short' || result2.rKind == 'long'}">
						<p>${result2.rExample2}</p>
					</c:if>
					<c:if test="${result2.rKind == 'multiplechoice' || result2.rKind == 'checkbox'}">
						<p>${result2.rExample1}</p>
					</c:if>
				</c:if>
			</c:forEach>
		</div>
	</c:forEach>
</body>
</html>