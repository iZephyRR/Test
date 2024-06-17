<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
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

<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>

<!-- Libraries Stylesheet -->
<link href="<c:url value = "resources/lightbox/css/lightbox.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="resources/owlcarousel/assets/owl.carousel.min.css"/>"
	rel="stylesheet">

<script src="<c:url value= "resources/easing/easing.min.js" />"></script>
<script src="<c:url value= "resources/waypoints/waypoints.min.js" />"></script>
<script src="<c:url value= "resources/lightbox/js/lightbox.min.js" />"></script>
<script
	src="<c:url value= "resources/owlcarousel/owl.carousel.min.js" />"></script>


<!-- Customized Bootstrap Stylesheet -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/js/main.js" />">
<%-- <link href="<c:url value="/resources/css/customerProfile.css"/>"rel="stylesheet"> --%>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>


</head>

<body>
	<%@include file="navBar.jsp"%>
	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Payment Success</h1>
	</div>
	<!-- Single Page Header End -->

	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5 text-center">
			<p>Your payment has been processed successfully. Thank you for
				your purchase!</p>
				<a href ="<c:url value='/myorder'/>">Go to Order List</a>
		</div>
	</div>

</body>
</html>