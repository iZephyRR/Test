<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shop Detail Page</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Customized Bootstrap Stylesheet -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">

<link href="<c:url value="/resources/lightbox/css/lightbox.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="/resources/owlcarousel/assets/owl.carousel.min.css" />"
	rel="stylesheet">

<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">

<!-- Custom JS and CSS -->
<script src="<c:url value= "/resources/easing/easing.min.js" />"></script>
<script src="<c:url value= "/resources/waypoints/waypoints.min.js" />"></script>
<script src="<c:url value= "/resources/lightbox/js/lightbox.min.js" />"></script>
<script
	src="<c:url value= "/resources/owlcarousel/owl.carousel.min.js" />"></script>

<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/main.js" />"></script>

<link href="<c:url value="/resources/js/main.css" />">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
	<%@include file="navBar.jsp"%>
	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Shop Detail</h1>
	</div>
	<!-- Single Page Header End -->

	<!-- Single Product Start -->
	<div class="container-fluid py-5 mt-5">
		<div class="container py-5">
			<div class="row g-4 mb-5">
				<div class="col-lg-8 col-xl-9">
					<div class="row g-4">
						<div class="col-lg-6">
							<div class="border rounded">
								<img src="data:image/jpeg;base64,${bean.image}" alt="Image"
									class="img-fluid rounded" id="image" />
							</div>
						</div>

						<div class="col-lg-6">
							<h4 class="fw-bold mb-3">${bean.name }</h4>
							<p class="mb-3">Category: ${bean.pro_cate }</p>
							<h5 class="fw-bold mb-3">${bean.unit_price }$/kg</h5>

							<p class="mb-4">${bean.description }</p>
							<form action="addToCart/${bean.id}" method="post">
								<div class="input-group quantity mb-5" style="width: 100px;">
									<div class="input-group-btn">
										<button type="button"
											class="btn btn-sm btn-minus rounded-circle bg-light border">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<input type="text"
										class="form-control form-control-sm text-center border-0"
										name="quantityValue" value="1" id="quantityValue"
										style="background-color: white; color: black;"> 
									<div class="input-group-btn">
										<button type="button"
											class="btn btn-sm btn-plus rounded-circle bg-light border">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>

								<button type="submit"
									class="btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary">
									<i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
									cart
								</button>
							</form>

						</div>



					</div>
				</div>

				<div class="col-lg-4 col-xl-3">
					<div class="row g-4 fruite">
						<div class="col-lg-12">
							<div class="mb-4">
								<h4>Categories</h4>
								<ul class="list-unstyled fruite-categorie">
									<c:forEach items="${cateLst }" var="lst">
										<li>
											<div class="d-flex justify-content-between fruite-name">
												<a href="<c:url value = '/shop/${lst.id }'/>"><i
													class="fas fa-apple-alt me-2"></i>${lst.name }</a> <span>${lst.count }
													Products</span>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>

						<div class="col-lg-12">
							<div class="position-relative">
								<img src="<c:url value= '/resources/images/banner-fruits.jpg'/>"
									class="img-fluid w-100 rounded" alt="">
								<div class="position-absolute"
									style="top: 50%; right: 10px; transform: translateY(-50%);">
									<h3 class="text-secondary fw-bold">
										Mart <br> Forty <br> Nine
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="container">
					<div class="d-flex align-items-center mb-4">
						<h1 class="fw-bold mb-0">Related products</h1>
					</div>
					<div class="" style="overflow-x: auto;">
						<div class="d-flex justify-content-start">
							<c:forEach items="${proLst}" var="lst">
								<div
									class="border border-primary rounded position-relative vesitable-item mx-1"
									style="flex: 0 0 auto;">
									<div class="fruite-img"
										style="width: 200px; height: 200px; overflow: hidden;">
										<img src="data:image/jpeg;base64,${lst.image}"
											alt="${lst.pro_cate}" class="img-fluid w-100 rounded-top"
											style="width: 100%; height: 100%; " />
									</div>
									<div
										class="text-white bg-primary px-3 py-1 rounded position-absolute"
										style="top: 10px; right: 10px;">${lst.pro_cate }</div>
									<div class="p-4 pb-0 rounded-bottom">
										<h4>${lst.name}</h4>
										<div class=""><!-- d-flex justify-content-between -->
											<p class="text-dark fs-5 fw-bold">$ ${lst.unit_price} /
												kg</p>
											<a href="${lst.id}"
												class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i
												class="fa fa-shopping-bag me-2 text-primary"></i> Add to
												cart</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Single Product End -->

	<script>
		$(document).ready(function() {
			$('.btn-minus').on('click', function() {
				var value = parseInt($('#quantityValue').val());
				var minValue = 1; // Minimum allowed value
				if (value > minValue) {
					$('#quantityValue').val(value - 1);
				}
			});

			$('.btn-plus').on('click', function() {
				var value = parseInt($('#quantityValue').val());
				var maxValue = 10; // Maximum allowed value
				if (value < maxValue) {
					$('#quantityValue').val(value + 1);
				}
			});
		});
	</script>

</body>
</html>