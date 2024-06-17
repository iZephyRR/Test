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

<!-- datatable  -->
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
<link href="<c:url value="/resources/js/main.js" />">
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
		<h1 class="text-center text-white display-6">Cart</h1>
	</div>
	<!-- Single Page Header End -->

	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<div class="row g-4">
				<div class="col-lg-8">
					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">Product</th>
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
									<td><p class="mb-0 mt-4 text-center">
											<a href="<c:url value='/delete/${ list.id }'/>"><i
												class='bx bxs-trash' style='font-size: 24px; color: #f50509'></i>
											</a>
										</p></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-lg-4">
					<div class="card bg-primary text-white rounded-3">
						<div class="card-body">
							<div
								class="d-flex justify-content-between align-items-center mb-4">
								<h5 class="mb-0">Amount</h5>
							</div>

							<hr class="my-4">

							<form action="<c:url value='/checkout/${total }'/>" method="post">
								<div class="d-flex justify-content-between mb-4">
									<p class="mb-2">Total </p>
									<p class="mb-2" name="displayTotal">$ ${total}</p>
								</div>
								<div class="d-flex justify-content-between mb-4">
									<p class="mb-2">Coupon</p>
									<input type="text" class="mb-2" name="coupon" />
								</div>
								<div class="d-flex justify-content-between mb-4">
									<span class="text-danger">${message }</span>
								</div>

								<button type="submit" class="btn btn-info btn-block btn-lg"
									style="text-align: left;">
									<div class="d-flex justify-content-between">
										<span>Checkout <i class='bx bx-cart'
											style='font-size: 24px;'></i></span>
									</div>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
		new DataTable('#example');
	</script>
</body>
</html>