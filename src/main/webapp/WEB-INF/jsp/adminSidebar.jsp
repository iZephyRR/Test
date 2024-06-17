<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>s
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Include Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">

<!-- My CSS -->
<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/adminHub.js" />"></script>

<title>AdminHub</title>

</head>
<body>

	<!-- SIDEBAR -->
	<section id="sidebar">
		<nav class="navbar navbar-light bg-white navbar-expand-xl">
			<a href="<c:url value= '/'/>" class="navbar-brand">
				<h1 class="text-primary display-6">
					<i class='bx bx-cart'></i>&nbsp;Mart 49
				</h1>
			</a>
		</nav>
		<ul class="side-menu top">
			<li><a href="<c:url value= '/aceMartAdminSite'/>"> <i
					class='bx bxs-dashboard'></i> <span class="text">DASHBOARD</span>
			</a></li>
			<li><a href="<c:url value= '/orders'/>"> <i
					class='bx bxs-dashboard'></i> <span class="text">ORDERS</span>
			</a></li>
			<li><a href="<c:url value= '/product'/>"><i
					class='bx bxs-shopping-bags'></i><span class="text">STORE</span></a></li>
			<%-- <li><a href="<c:url value= '/category'/>"><i
					class='bx bxs-shopping-bags'></i><span class="text">CATEGORY</span></a></li> --%>
			<li><a href="<c:url value= '/add-category'/>"><i
					class='bx bx-shopping-bag'></i><span class="text">ADD CATEGORY</span></a></li>
			<li><a href="<c:url value= '/viewAdmin'/>"><i
					class='bx bx-user-circle'></i><span class="text">ADMIN</span></a></li>
			<li><a href="<c:url value= '/viewCustomer'/>"><i
					class='bx bx-user'></i><span class="text">CUSTOMERS</span></a></li>
			<li><a href="<c:url value= '/coupon'/>"><i
					class='bx bxs-coupon'></i><span class="text">COUPONS</span></a></li>
			<li><a href="<c:url value= '/removedProduct'/>"><i
					class='bx bxs-shopping-bags'></i><span class="text">REMOVED
						PRODUCTS</span></a></li>
						
			<%-- <li><a href="<c:url value= '/add-admin'/>"><i
					class='bx bx-user-circle'></i><span class="text">Add ADMIN</span></a></li>
			
			<li><a href="<c:url value= '/add-product'/>"><i
					class='bx bx-shopping-bag'></i><span class="text">Add
						Product</span></a></li>
			<li><a href="<c:url value= '/create-coupon'/>"><i
					class='bx bxs-coupon'></i><span class="text">Create Coupon</span></a></li> --%>
		</ul>
		<ul class="side-menu">
			<li><a href="#" onclick="showLogoutConfirmation()"> <i
					class='bx bx-log-out-circle' style='color: #ff0606'></i><span
					class="text">LOGOUT</span>
			</a></li>
		</ul>
	</section>
	<!-- SIDEBAR -->

	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<form action="search">
				<div class="form-input"></div>
			</form>
			<a href="<c:url value= '/adminProfile'/> " class="profile"> <img
				src="<c:url value= "/resources/images/admin.jpg"/>">
			</a>
		</nav>
		<!-- NAVBAR -->
	</section>

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="logoutModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" onclick="closeModal()">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure you want to log out?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						onclick="closeModal()">Cancel</button>
					<button type="button" class="btn btn-primary" onclick="logout()">OK</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		function showLogoutConfirmation() {
			$('#logoutModal').modal('show');
		}
		function closeModal() {
			$('#logoutModal').modal('hide');
		}
		function logout() {
			// Redirect to Ace_Mart/logout
			window.location.href = './logout';
		}
	</script>
</body>
</html>