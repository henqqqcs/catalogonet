<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:url var="link" value="/form-handle"/>
	<form:form action="${link}">
		First name:<br> <input type="text" name="nome"> <br>
		Last name:<br> <input type="text" name="sobrenome"> <input
			type="submit" value="enviar">
	</form:form>

</body>
</html>