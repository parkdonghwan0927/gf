<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${survey.sTitle}</h1>
	<hr>
	<c:forEach items="${resultlist}" var="result">
		<p><a href="/response/individual?sNo=${survey.sNo}&sMaster=${result.rWriter}">${result.rWriterName}</a></p>
	</c:forEach>
</body>
</html>