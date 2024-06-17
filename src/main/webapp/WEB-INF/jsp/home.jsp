<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
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
<link href="<c:url value = "resources/lightbox/css/lightbox.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="resources/owlcarousel/assets/owl.carousel.min.css"/>"
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
	<!-- Hero Start -->
	<div class="container-fluid py-5 mb-5 hero-header">
		<div class="container py-5">
			<div class="row g-5 align-items-center">
				<div class="col-md-12 col-lg-7">
					<h4 class="mb-3 text-secondary">100% Organic Foods</h4>
					<h1 class="mb-5 display-3 text-primary">Organic Vegetables &
						Fruits Foods</h1>
				</div>
				<div class="col-md-12 col-lg-5">
					<div id="carouselId" class="carousel slide position-relative"
						data-bs-ride="carousel" data-bs-interval="2000">
						<!-- 2000 millisecond = 2s  -->
						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active rounded">
								<img src="<c:url value='/resources/images/sontpalonsi.jpg'/>"
									class="img-fluid w-100 h-100 bg-secondary rounded" />
								<!-- <a href="#" class="btn px-4 py-2 text-white rounded">Vegetable</a> -->
							</div>
							<div class="carousel-item rounded">
								<img src="<c:url value='/resources/images/kinds-bread.jpg'/>"
									class="img-fluid w-100 h-100 bg-secondary rounded" />
								<!-- <a href="#" class="btn px-4 py-2 text-white rounded">Bread</a> -->
							</div>
							<div class="carousel-item rounded">
								<img src="<c:url value='/resources/images/collection.jpg'/>"
									class="img-fluid w-100 h-100 bg-secondary rounded" />
								<!-- <a href="#" class="btn px-4 py-2 text-white rounded">Vegetable</a> -->
							</div>
							<div class="carousel-item rounded">
								<img src="<c:url value='/resources/images/fruit.jpg'/>"
									class="img-fluid w-100 h-100 bg-secondary rounded" />
								<!-- <a href="#" class="btn px-4 py-2 text-white rounded">Fruit</a> -->
							</div>
							<%-- <div class="carousel-item rounded">
								<img src="<c:url value='/resources/images/kinds-bread.jpg'/>"
									class="img-fluid w-100 h-100 bg-secondary rounded" />
								<!-- <a href="#" class="btn px-4 py-2 text-white rounded">Fruit</a> -->
							</div> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Hero End -->


	<!-- Features Section Start -->
	<div class="container-fluid featurs py-5">
		<div class="container py-5">
			<div class="row g-4">
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fas fa-car-side fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>Free Shipping</h5>
							<p class="mb-0">Free on order over 150$</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fas fa-user-shield fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>Security Payment</h5>
							<p class="mb-0">100% security payment</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fas fa-exchange-alt fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>36 hours Return</h5>
							<p class="mb-0">36 hours money guarantee</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3">
					<div class="featurs-item text-center rounded bg-light p-4">
						<div
							class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
							<i class="fa fa-phone-alt fa-3x text-white"></i>
						</div>
						<div class="featurs-content text-center">
							<h5>24/7 Support</h5>
							<p class="mb-0">Support every time fast</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Features Section End -->

	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<div class="tab-class text-center">
				<div class="row g-4">
					<div class="col-lg-4 text-start">
						<h1>Our Organic Products</h1>
					</div>
					<div class="col-lg-8 text-end">
						<ul class="nav nav-pills d-inline-flex text-center mb-5">
							<li class="nav-item"><a href="<c:url value ='./'/>"
								class="d-flex m-2 py-2 bg-light rounded-pill "> <span
									class="text-dark" style="width: 130px;">All Products</span>
							</a></li>
							<c:forEach items="${cateLst }" var="lst">
								<li class="nav-item"><a href="<c:url value='/${lst.id }'/>"
									class="d-flex py-2 m-2 bg-light rounded-pill"> <span
										class="text-dark" style="width: 130px;">${lst.name }</span>
								</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

				<div class="tab-content">
					<div class="row g-4">
						<div class="col-lg-12">
							<div class="row g-4">
								<table>
									<tbody>
										<c:forEach items="${proLst }" var="lst">
											<div class="col-md-6 col-lg-4 col-xl-3">
												<div
													class="rounded position-relative fruite-item border border-secondary">
													<div class="fruite-img">
														<img src="data:image/jpeg;base64,${lst.image}"
															alt="${lst.pro_cate }"
															class="img-fluid w-100 rounded-top" />
													</div>
													<div
														class="text-white bg-secondary px-3 py-1 rounded position-absolute"
														style="top: 10px; left: 10px;">${lst.pro_cate }</div>
													<div
														class="p-4 border border-secondary border-top-0 rounded-bottom">
														<h4>${lst.name }</h4>
														<%-- <p>${lst.description }</p> --%>
														<div class="d-flex justify-content-between flex-lg-wrap">
															<p class="text-dark fs-5 fw-bold mb-0">$
																${lst.unit_price } / kg</p>
															<a href="shopDetail/${lst.id}"
																class="btn border border-secondary rounded-pill px-3 text-primary"><i
																class="fa fa-shopping-bag me-2 text-primary"></i> Add to
																cart</a>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<br>
				<c:if test="${totalPages > 1}">
					<c:choose>
						<c:when test="${currentPage > 1}">
							<a href="?page=${currentPage - 1}&size=${size}"><button>Previous</button></a>
						</c:when>
						<c:otherwise>
                			<button>Previous</button>
            			</c:otherwise>
					</c:choose>

					<c:forEach begin="1" end="${totalPages}" var="pageNumber">
						<c:choose>
							<c:when test="${pageNumber == currentPage}">
								<button><b>${pageNumber}</b></button>
							</c:when>
							<c:otherwise>
								<a href="?page=${pageNumber}&size=${size}"><button>${pageNumber}</button></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${currentPage < totalPages}">
							<a href="?page=${currentPage + 1}&size=${size}"><button>Next</button></a>
						</c:when>
						<c:otherwise>
                			<button>Next</button>
            			</c:otherwise>
					</c:choose>
				</c:if>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->

	<!-- Banner Section Start-->
	<div class="container-fluid banner bg-secondary my-5">
		<div class="container py-5">
			<div class="row g-4 align-items-center">
				<div class="col-lg-6">
					<div class="py-4">
						<h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
						<p class="fw-normal display-3 text-dark mb-4">in Our Store</p>

						<a href="shop/2"
							class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">BUY</a>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="position-relative">
						<img src="<c:url value='/resources/images/baner-1.png'/>"
							class="img-fluid w-100 rounded" />

						<div
							class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute"
							style="width: 140px; height: 140px; top: 0; left: 0;">
							<h1 style="font-size: 100px;">1</h1>
							<div class="d-flex flex-column">
								<span class="h2 mb-0">50$</span> <span
									class="h4 text-muted mb-0">kg</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner Section End -->

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>
</body>
</html>