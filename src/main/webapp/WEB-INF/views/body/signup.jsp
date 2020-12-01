<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>회원가입</h2>
		<form:form action="/signup" method="post" modelAttribute="memberDTO">
			<div class="form-group">
				<label for="id">ID:</label>
				<form:input type="text" class="form-control" id="id" placeholder="Enter id" name="memberId" path="memberId"/>
				<div id="id_check"></div>
				<font color="red"><form:errors path="memberId"></form:errors></font>
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label>
				<form:input type="password" class="form-control" id="pwd" placeholder="Enter password" name="memberPwd" path="memberPwd"/>
				<font color="red"><form:errors path="memberPwd"></form:errors></font>
			</div>
			<div class="form-group">
				<label for="email">Email:</label>
				<form:input type="email" class="form-control" id="email" placeholder="Enter email" name="memberEmail" path="memberEmail"/>
				<div id="email_check"></div>
				<font color="red"><form:errors path="memberEmail"></form:errors></font>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>
	
	<script>
		$("#id").blur(function() {
			var userId = $('#id').val();
			$.ajax({
				url : '/idCheck?userId='+ userId,
				type : 'get',
				success : function(data) {
					if(data == 1) {
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
					} else {
						if(userId == ""){
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', 'red');
						}
					}
				}
			});
		});
		
		$("#email").blur(function() {
			var emailId = $('#email').val();
			$.ajax({
				url : '/emailCheck?emailId='+ emailId,
				type : 'get',
				success : function(data) {
					if(data == 1) {
						$("#email_check").text("사용중인 이메일입니다.");
						$("#email_check").css("color", "red");
					} else {
						if(emailId == ""){
							$('#email_check').text('이메일을 입력해주세요.');
							$('#email_check').css('color', 'red');
						}
					}
				}
			});
		});
	</script>
</body>
</html>