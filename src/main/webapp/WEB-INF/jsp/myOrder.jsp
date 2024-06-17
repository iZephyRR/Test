<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile</title>
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

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
<!-- datatable css  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
<link
	href="https://cdn.datatables.net/2.0.5/css/dataTables.bootstrap5.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/2.0.5/js/dataTables.js"></script>
<script
	src="https://cdn.datatables.net/2.0.5/js/dataTables.bootstrap5.js"></script>
<!-- datatable end  -->

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

.center {
	text-align: center;
}
</style>

<body>
	<%@include file="navBar.jsp"%>
	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Personal Details</h1>
	</div>
	<!-- Single Page Header End -->

	<!-- Fruits Shop Start-->
	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<h1 class="center">Orders</h1>
			<hr>
			<div class="container">
				<br>
				<div class="container bootstrap">
					<div class="row">
						<div class="col-md-3">
							<!--  -->
							<ul>
								<li><a href="<c:url value='/login'/>"><i
										class='bx bxs-user'></i>Profile</a></li>
								<br>
								<li><a href="<c:url value='/myorder'/>"><i
										class="fas fa-shopping-cart"></i> My Order</a></li>
								<br>
								<li><a href="<c:url value='/Updating'/>"><i
										class="fas fa-user-edit"></i> Edit Info</a></li>
								<br>
								<li><a href="<c:url value='/changePassword'/>"><i
										class="fas fa-key"></i> Change Password</a></li>
								<br>
							</ul>
						</div>
						<!--  -->

						<div class="col-md-9">
							<div class="table-responsive">
								<!--  -->
								<div class="container">
									<table id="example" class="table table-striped">
										<thead>
											<tr>
												<th class="text-center">Date</th>
												<th class="text-center">Name</th>
												<th class="text-center">Amount</th>
												<th class="text-center">Quantity</th>
												<th class ="text-center">Coupon Discount</th>
												<th class="text-center">Payment</th>
												<th>&nbsp;</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${vou_list }" var="list">
												<tr>
													<td class="text-center">${list.date }</td>
													<td class="text-center">${list.name }</td>
													<td class="text-center">$ ${list.total_amount }</td>
													<td class="text-center">${list.pro_qty } Products</td>
													<c:if test="${list.dis_percent > 0}">
														<td class="text-center">${list.dis_percent}%</td>
													</c:if>
													<c:if test="${list.dis_percent <= 0}">
														<td class="text-center">No discount</td>
													</c:if>
													<td class="text-center">${list.method }</td>
													<td class="text-center">${list.confirm }</td>
													<td class="text-center"><a
														href="viewMyOrderDetail/${list.id }">Order Detail</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fruits Shop End-->

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
		class="fa fa-arrow-up"></i></a>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

	<!-- Bootstrap JavaScript (Bundle) -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



	<script>
		new DataTable('#example');
	</script>

</body>
</html>