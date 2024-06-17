<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shop Page</title>
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

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

</head>
<style>
    .search-form {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .search-input {
        flex: 1;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px 0 0 4px;
    }

    .search-btn {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        border-radius: 0 4px 4px 0;
    }

    .search-btn:hover {
        background-color: #0056b3;
    }
</style>

<body>
	<%@include file="navBar.jsp"%>
	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Shop</h1>
	</div>
	<!-- Single Page Header End -->


	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h1 class="mb-4">Fresh Fruits Shop</h1>
			<div class="row g-4">
				<div class="col-lg-12">
					<div class="row g-4">
						<div class="col-xl-3">
							<div class="input-group w-100 mx-auto d-flex">
								<form action="search" class="search-form" >
									<input type="search" class="search-input"
										placeholder="Search..." name = "search">
									<button type="submit" class="search-btn">
										<i class='bx bx-search'></i>
									</button>
								</form>
							</div>
						</div>
					</div>

					<br>
					<div class="row g-4">
						<div class="col-lg-3">
							<div class="row g-4">
								<div class="col-lg-12">
									<div class="mb-3">
										<h4>Categories</h4>
										<ul class="list-unstyled fruite-categorie">
											<c:forEach items="${cateLst }" var="lst">
												<li>
													<div class="d-flex justify-content-between fruite-name">
														<a href="<c:url value = '/shop/${lst.id }'/> "><i
															class="fas fa-apple-alt me-2"></i>${lst.name }</a> <span>${lst.count } Products</span>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="position-relative">
										<img
											src="<c:url value='/resources/images/banner-fruits.jpg'/>"
											class="img-fluid w-100 rounded" />
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

						<div class="col-lg-9">
							<div class="row g-4 justify-content-center">
								<c:forEach items="${proLst }" var="lst">
									<div class="col-md-6 col-lg-6 col-xl-4">
										<div class="rounded position-relative fruite-item border border-secondary" >
											<div class="fruite-img">
												<img src="data:image/jpeg;base64,${lst.image}"
													alt="${lst.pro_cate }" class="img-fluid w-100 rounded-top" />
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
													<a href="<c:url value='/shopDetail/${lst.id}'/>"
														class="btn border border-secondary rounded-pill px-3 text-primary"><i
														class="fa fa-shopping-bag me-2 text-primary"></i> Add to
														cart</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>

			<div class="tab-class text-center">
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



	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>

</body>
</html>