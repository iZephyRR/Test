<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<script src="<c:url value="/resources/js/loginFormValidation.js"/>"></script>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/adminLogin.css" />"
	rel="stylesheet">
<!-- Model -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- Model End -->
</head>

<body class="login-page-body">
	<%@include file="navBar.jsp"%>

	<div class="login-page">
		<div class="form">
			<div class="login">
				<div class="login-header">
					<h1>Welcome!</h1>
				</div>
			</div>
			<form class="login-form" action="customerLogin" method="post"
				name="confirm" onsubmit="return validateForm()">
				<div class="mb-3">
					<input type="email" class="form-control" placeholder="Your Email"
						name="email" onfocus="clearError()" /><span id="emailError"
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
				<p class="message">
					Not registered? <a href="<c:url value = '/customerReg'/>">Create an account</a>
				</p>
			</form>
		</div>
	</div>
	<script src="<c:url value="/resources/js/adminPasswordToggle.js"/>"></script>
	
</body>
</html>