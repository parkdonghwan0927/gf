<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h1>${sv.sTitle}</h1>
		<div><a href="/response/statistics?sNo=${sv.sNo}&sTitle=${sv.sTitle}">응답 통계</a></div>
		<div><a href="/response/individual/list?sNo=${sv.sNo}&sTitle=${sv.sTitle}">개별 응답</a></div>
		<hr>
			<input type="text" name="" value="${sv.sTitle}" class = "survey">
			<br>
			<c:forEach items="${sv.questionlist}" var="q">
				<div class="item">
					<br><input type="text" name="" value="${q.qContent}" class = "question"><br>
					<c:choose>
						<c:when test="${q.qKind eq 'short'}">
							<select name="qKind" class="questionOption">
								<option value="none">===선택===</option>
								<option value="short" selected>단답형</option>
								<option value="long">장문형</option>
								<option value="multiplechoice">객관식 질문</option>
								<option value="checkbox">체크박스</option>
							</select>
						</c:when>
						<c:when test="${q.qKind eq 'long'}">
							<select name="qKind" class="questionOption">
								<option value="none">===선택===</option>
								<option value="short">단답형</option>
								<option value="long" selected>장문형</option>
								<option value="multiplechoice">객관식 질문</option>
								<option value="checkbox">체크박스</option>
							</select>
						</c:when>
						<c:when test="${q.qKind eq 'multiplechoice'}">
							<select name="qKind" class="questionOption">
								<option value="none">===선택===</option>
								<option value="short">단답형</option>
								<option value="long">장문형</option>
								<option value="multiplechoice" selected>객관식 질문</option>
								<option value="checkbox">체크박스</option>
							</select>
						</c:when>
						<c:when test="${q.qKind eq 'checkbox'}">
							<select name="qKind" class="questionOption">
								<option value="none">===선택===</option>
								<option value="short">단답형</option>
								<option value="long">장문형</option>
								<option value="multiplechoice">객관식 질문</option>
								<option value="checkbox" selected>체크박스</option>
							</select>
						</c:when>
					</c:choose>
					<button type = "button" class = "deleteQuestion" qMaster="${sv.sNo}" qIndex="${q.qIndex}">질문 삭제</button>
					<div class = "example2">
						<c:forEach items="${sv.examplelist}" var="e">
							<c:if test="${q.qIndex == e.eIndex && (q.qKind == 'multiplechoice' || q.qKind == 'checkbox')}">
								<input type='text' value = '${e.eContent}' class = 'example'>
								<button type = "button" class = "deleteExample">보기 삭제</button><br>
							</c:if>
						</c:forEach>
					</div>
						<c:if test="${q.qKind == 'multiplechoice' || q.qKind == 'checkbox'}">
							<button type = 'button' class = 'addExample'>보기 추가하기</button>
						</c:if>
					</div>
			</c:forEach>
			

			<div><br><button type = "button" class = "addQuestion">질문 추가하기</button></div>
			<br><div><button type="button" class="submit">수정하기</button></div>
        
<script>
$(document).on('change', '.questionOption', function () {
	while(true) {
		if($(this).next().next().hasClass("example2") == true || $(this).next().next().hasClass("addExample") == true) {
			$(this).next().next().remove();
		} else {
			break;	
		}
	}
	
	if($(this).val() == "short") {
		$(this).prev().prev().prop("placeholder", "단답형 질문")
	} else if($(this).val()  == "long") {
		$(this).prev().prev().prop("placeholder", "장문형 질문")
	} else if($(this).val()  == "multiplechoice") {
		$(this).prev().prev().prop("placeholder", "객관식 질문")
		$(this).next().after("<div class='example2'><input type='text' placeholder='보기' class = 'example'> <button type = 'button' class = 'deleteExample'>보기 삭제</button></div><button type = 'button' class = 'addExample'>보기 추가하기</button>");
	} else if($(this).val()  == "checkbox") {
		$(this).prev().prev().prop("placeholder", "체크박스형 질문")
		$(this).next().after("<div class='example2'><input type='text' placeholder='보기' class = 'example'> <button type = 'button' class = 'deleteExample'>보기 삭제</button></div><button type = 'button' class = 'addExample'>보기 추가하기</button>");
	} else if($(this).val()  == "none") {
		$(this).prev().prev().prop("placeholder", "질문")
	}
});

$(document).on('click', '.addQuestion', function () {
	$(".addQuestion").parent().before("<div class='item'><br><input type='text' placeholder='질문' class = 'question'><br><select name='qKind' class='questionOption'><option value='none'>===선택===</option><option value='short'>단답형</option><option value='long'>장문형</option><option value='multiplechoice'>객관식 질문</option><option value='checkbox'>체크박스</option></select><button type = 'button' class = 'deleteQuestion' qMaster='${sv.sNo}' qIndex='${q.qIndex}'>질문 삭제</button><br></div>")
});

$(document).on('click', '.addExample', function () {
	$(this).prev().children().last().after("<input type='text' placeholder='보기' class = 'example'> <button type = 'button' class = 'deleteExample2'>보기 삭제</button><br>");
});

$(document).on('click', '.deleteQuestion', function () {
	let qMaster = $(this).attr('qMaster');
	let qIndex = $(this).attr('qIndex');
		
	$(this).parent().remove();
});

$(document).on('click', '.deleteExample', function () {		
	$(this).prev().remove();
	$(this).next().remove();
	$(this).remove();
});

$(document).on('click', '.submit', function () {
	let survey = {
			sNo : ${sv.sNo},
			sTitle : $(".survey").val(),
			itemlist : []
	};
	
	$(".item").each(function( index ) {
		let item = {
				question : {
					qContent : $(this).children().first().next().val(),
					qKind : $(this).children().first().next().next().next().val()
				},
				examplelist : []
		}
		
		let tmp = $(this).children().first().next().next().next().next().next().children().first();
		if(tmp.hasClass("example") == true) {
			$(".example").each(function( index ) {
				let example = {};
				
				example.eContent = tmp.val();
				item.examplelist.push(example);
				
				tmp = tmp.next().next().next();
				
				if(tmp.hasClass("example") == false) {
					return false;
				}
			});
		} else {
			item.examplelist.push(null);
		}
		survey.itemlist.push(item);
	});
	
	let surveyresult = JSON.stringify(survey);
	
	$.ajax({
		method: "POST",
		url: "/survey/adjust/process",
		data: surveyresult,
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