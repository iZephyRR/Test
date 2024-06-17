<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>

<!-- datatable   -->
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

<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

<script src="<c:url value="/resources/js/checkoutInfo.js"/>"></script>
<title>Cart</title>
</head>

<style>
/* img {
	width: 36px;
	height: 36px;
	object-fit: cover;
	border-radius: 50%;
} */
@media ( min-width : 1025px) {
	.h-custom {
		height: 100vh !important;
	}
}
</style>
<body>
	<%@include file="navBar.jsp"%>

	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Info:</h1>
	</div>
	<!-- Single Page Header End -->

	<div class="container-fluid fruite py-5">
		<div class="container py-5">

			<div class="row g-4">
				<div class="col-lg-9">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Info:</h2>
						</div>
					</div>

					<div class="row tm-edit-product-row">
						<div class="col-md-12">
							<form action="<c:url value='getInfo'/>"
								class="tm-edit-product-form" method="post"
								onsubmit="return validateForm()">
								<div class="form-group mb-3">
									<!-- Hidden input field to hold the total value -->
									<input type="hidden" name="total" value="${total}" /> 
									<input type="hidden" name="tax" value="${tax}" />
									<input type= "hidden" name ="coupon"  value="${coupon_id}" />
									<input type="hidden" name="percent" value = "${percent }" />
									<label
										id="name">Name</label><input name="name"
										class="form-control validate" onfocus="clearError('name')" /><span
										id="nameError" class="text-danger"></span>
								</div>
								<div class="form-group mb-3">
									<label id="phone">Phone Number</label><input name="phone"
										class="form-control validate" onfocus="clearError('phone')" /><span
										id="phoneError" class="text-danger"></span>
								</div>
								<div class="row">
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<div class="form-group mb-3">
											<label id="floor">Floor or Building No </label> <input
												name="floor" id="floor" type="text"
												class="form-control validate" onfocus="clearError('floor')" />
											<span id="floorError" class="text-danger"></span>
										</div>
										<div class="form-group mb-3">
											<label id="township">Township</label> <input name="township"
												id="township" type="text" class="form-control validate"
												onfocus="clearError('township')" /><span id="townshipError"
												class="text-danger"></span>
										</div>
									</div>

									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<div class="form-group mb-3">
											<label id="street">Street</label><input name="street"
												id="street" type="text" class="form-control validate"
												onfocus="clearError('street')" /><span id="streetError"
												class="text-danger"></span>
										</div>
										<div class="form-group mb-3">
											<label id="city">City</label> <input name="city" id="city"
												type="text" class="form-control validate"
												onfocus="clearError('city')" /><span id="cityError"
												class="text-danger"></span>
										</div>
									</div>
									<input type="submit" class="btn btn-info  btn-block btn-lg "
										value="Submit">
								</div>
							</form>
						</div>
					</div>

					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th class="text-center">Name</th>
								<th class="text-center">Price</th>
								<th class="text-center">Quantity(kg)</th>
								<th class="text-center">Amount</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cartlst }" var="list">
								<tr>
									<td><img src="data:image/jpeg;base64,${list.image}"
										alt="${list.name }" style="width: 80px; height: 80px;"
										class="user-image img-fluid me-5 rounded-circle" /></td>
									<td><p class="mb-0 mt-4 text-center">${list.name }</p></td>
									<td><p class="mb-0 mt-4 text-center">$
											${list.unit_price }</p></td>
									<td><p class="mb-0 mt-4 text-center">${list.qty }</p></td>
									<td><p class="mb-0 mt-4 text-center">$ ${list.amount }</p></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>

				<div class="col-lg-3">
					<div class="card bg-primary text-white rounded-3">
						<div class="card-body">
							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<h5 class="mb-0">Amount</h5>
							</div>

							<hr class="my-4">
							<div class="d-flex justify-content-between mb-4">
								<p class="mb-2">
									Total
									(${tax })
								</p>
								<p class="mb-2" name="displayTotal">$ ${total}</p>

							</div>
							<div class="d-flex justify-content-between mb-4">
								<span class="text-danger">${message }</span>
							</div>
							<!-- <button type="submit" class="btn btn-info btn-block btn-lg"
								style="text-align: left;">
								<div class="d-flex justify-content-between">
									<span>Checkout <i class='bx bx-cart'
										style='font-size: 24px;'></i></span>
								</div>
							</button> -->
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>


	<script>
		/* new DataTable('#example'); */
	</script>
</body>
</html>