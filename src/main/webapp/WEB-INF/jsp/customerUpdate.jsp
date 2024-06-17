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
<%-- <link href="<c:url value="/resources/css/customerProfile.css"/>"rel="stylesheet"> --%>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>


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
			<h1 class="center">Edit Info :</h1>
			<hr>
			<div class="container">
				<br>
				<div class="container bootstrap">
					<div class="row">
						<div class="col-md-3">
							<!--  -->
							<ul>
								<li><a href="<c:url value='/login'/>"><i class='bx bxs-user'></i>Profile</a></li><br>
								<li><a href="<c:url value='/myorder'/>"><i class="fas fa-shopping-cart"></i>
										My Order</a></li><br>
								<li><a href="<c:url value='/Updating'/>"><i
										class="fas fa-user-edit"></i> Edit Info</a></li><br>
								<li><a href="<c:url value='/changePassword'/>"><i
										class="fas fa-key"></i> Change Password</a></li><br>
							</ul>
						</div>
						<!--  -->

						<div class="col-md-9">
							<div class="table-responsive">
								<!--  -->
								<div class="container">
									<form action="/Ace_Mart/Updated" method="post">
										<input type="hidden" name="id" value="${customer.id}" />
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label for="name" class="text-primary">Name:</label> <input
														type="text" id="name" name="name" class="form-control"
														value="${customer.name}" required>
												</div>
												<div class="form-group">
													<label for="email" class="text-primary">Email:</label> <input
														type="email" id="email" name="email" class="form-control"
														value="${customer.email}" required>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label for="phone" class="text-primary">Phone:</label> <input
														type="tel" id="phone" name="phone" class="form-control"
														value="${customer.phone}" required>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="address" class="text-primary">Address:</label>
											<textarea id="address" name="address" rows="4" cols="30"
												class="form-control" required>${customer.address}</textarea>
										</div>
										<br>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#infoChangeModal">
											Save Changes</button>
										<!-- Info Change Modal -->
										<div class="modal fade" id="infoChangeModal" tabindex="-1"
											role="dialog" aria-labelledby="infoChangeModalLabel"
											aria-hidden="true" data-backdrop="false">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="#infoChangeModalLabel">Save
															Info:</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">Are you sure to Change?</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Cancel</button>
														<button type="submit" class="btn btn-primary">OK</button>
													</div>
												</div>
											</div>
										</div>
									</form>
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
	<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>