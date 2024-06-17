<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Contact</title>
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

<!-- Libraries Stylesheet -->
<link href = "<c:url value = "resources/lightbox/css/lightbox.min.css"/>" rel = "stylesheet">
<link href= "<c:url value="resources/owlcarousel/assets/owl.carousel.min.css"/>" 
	rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">

<!-- Template Stylesheet -->
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/main.js" />"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="<c:url value= "resources/easing/easing.min.js" />"></script>
<script src="<c:url value= "resources/waypoints/waypoints.min.js" />"></script>
<script src="<c:url value= "resources/lightbox/js/lightbox.min.js" />"></script>
<script
	src="<c:url value= "resources/owlcarousel/owl.carousel.min.js" />"></script>
</head>

<body>

	<%@include file="navBar.jsp"%>

	<!-- Contact Start -->
	<div class="container-fluid contact py-5">
		<div class="container py-5">
			<div class="p-5 bg-light rounded">
				<div class="row g-4 justify-content-center align-items-center">
					<!-- Centering the row -->
					<div class="col-lg-12 text-center">
						<!-- Centering the h1 element -->
						
					</div>
					<div class="col-lg-12">
						<div class="h-100 rounded">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d954.6513745506747!2d96.125304!3d16.845916!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30c194e9ed66de9d%3A0xaba8dc0947f34754!2sACE%20Inspiration!5e0!3m2!1sen!2smm!4v1714319788468!5m2!1sen!2smm"
								width="1200" height="450" style="border: 0;" allowfullscreen=""
								loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
					</div>
					
					<div class="col-lg-5 d-flex flex-column align-items-center">
						<!-- Centering the columns -->
						<div class="p-4 rounded mb-4 bg-white text-center"
							style="height: 200px; width: 100%;">
							<!-- Centering the content and fixing height -->
							<i class="fas fa-map-marker-alt fa-2x text-primary mb-2"></i>
							<div>
								<h4>Address</h4>
								<p class="mb-2">No.169, MTP Condo, 169 Insein Rd, Yangon
									11051</p>
							</div>
						</div>
						<div class="p-4 rounded mb-4 bg-white text-center"
							style="height: 200px; width: 100%;">
							<!-- Centering the content and fixing height -->
							<i class="fas fa-envelope fa-2x text-primary mb-2"></i>
							<div>
								<h4>Mail Us</h4>
								<p class="mb-2">mart49@gmail.com</p>
							</div>
						</div>
						<div class="p-4 rounded bg-white text-center"
							style="height: 200px; width: 100%;">
							<!-- Centering the content and fixing height -->
							<i class="fa fa-phone-alt fa-2x text-primary mb-2"></i>
							<div>
								<h4>Telephone</h4>
								<p class="mb-2">(+959) 442-430-530</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->


	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>

	
</body>

</html>