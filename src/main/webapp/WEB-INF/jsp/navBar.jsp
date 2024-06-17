<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nav Bar</title>
<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<%-- <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet"> --%>
<link href="<c:url value="/resources/js/main.css" />">
</head>

<body>
	<div class="container-fluid fixed-top">
		<div class="container topbar bg-primary d-none d-lg-block">
			<div class="d-flex justify-content-between">
				<div class="top-info ps-2">
					<small class="me-3 text-white"><i
						class="fas fa-map-marker-alt me-2 text-secondary"></i> Mart Forty
						Nine</small> <small class="me-3 text-white"><i
						class="fas fa-envelope me-2 text-secondary"></i> mart49@gmail.com</small>
				</div>
			</div>
		</div>
		<div class="container px-0">
			<nav class="navbar navbar-light bg-white navbar-expand-xl">
				<a href="<c:url value= '/'/>" class="navbar-brand">
					<h1 class="text-primary display-6"><i class='bx bx-cart'></i>&nbsp;Mart 49</h1>
				</a>
				<div class="collapse navbar-collapse bg-white" id="navbarCollapse">
					<div class="navbar-nav mx-auto">
						<a href="<c:url value= '/'/> " class="nav-item nav-link">Home</a>
						<a href="<c:url value = '/shop'/>" class="nav-item nav-link">Shop</a>
					</div>
					<a href="<c:url value = '/contact'/>" class="nav-item nav-link">Contact</a>
				</div>
				<div class="d-flex m-3 me-0">
					<a href="<c:url value = '/cart'/>"
						class="position-relative me-4 my-auto"> <i
						class="fa fa-shopping-cart"></i></a> <a
						href="<c:url value = '/login'/>" class="my-auto"> <i
						class="fas fa-user fa-2x"></i></a>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>