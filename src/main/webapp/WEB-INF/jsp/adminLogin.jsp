<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<title>Login</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/adminLogin.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/loginFormValidation.js"/>"></script>

</head>

<body class="login-page-body">
	<div class="login-page">
		<div class="form">
			<div class="login">
				<div class="login-header">
					<h1>Welcome!</h1>
				</div>
			</div>
			<form class="login-form" action="aceMartAdminSite" method="post"
				name="confirm" onsubmit="return validateForm()">
				<div class="mb-3">
					<input type="email" class="form-control" placeholder="Your Email"
						name="email" onfocus="clearError()" /> <span id="emailError"
						class="text-danger"></span>
				</div>
				<div class="mb-3">
					<input type="password" class="form-control" placeholder="Password"
						name="password" id="password" onfocus="clearError()" /><span
						class="form-group-text" id="togglePassword"><i
						class="far fa-eye-slash"></i></span> <span id="passError"
						class="text-danger"></span><span class="text-danger">${error }</span>
				</div>
				<button type="submit" class="btn btn-primary">Login</button>
			</form>
		</div>
	</div>
	<script src="<c:url value="/resources/js/adminPasswordToggle.js"/>"></script>
</body>
</html>