<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Order Detail</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="<c:url value = "/resources/css/fontawesome.min.css"/>">

<link href="<c:url value="/resources/css/product.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/addProduct.js"/>"></script>

<script src="<c:url value="/resources/js/adminHub.js" />"></script>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/css/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Include Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<!-- Include Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

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

<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div id="reportsPage">
				<div class="row tm-content-row">
					<div class=" col-lg-6 ">
						<div class="tm-bg-primary-dark tm-block tm-block-products">
							<div class="table-data">
								<div class="order">
									<div class="head">
										<h3>Ordered Products</h3>
									</div>
									<table id="example" class="table table-striped">
										<thead>
											<tr>
												<th>&nbsp;</th>
												<th>Name</th>
												<th>Price</th>
												<th>Quantity(kg)</th>
												<th>Amount</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cartList }" var="list">
												<tr>
													<td><img src="data:image/jpeg;base64,${list.image}"
														alt="${list.name }" class="user-image img-fluid" /></td>
													<td class="text-center">${list.name }</td>
													<td class="text-center">$ ${list.unit_price }</td>
													<td class="text-center">${list.qty }</td>
													<td class="text-center">$ ${list.amount }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class=" col-lg-6">
						<div
							class="tm-bg-primary-dark tm-block tm-block-product-categories">
							<div class="tm-product-table-container">
								<div class="table-data">
									<div class="order">
										<div class="head">
											<h3>Voucher</h3>
										</div>
										<table>
											<tbody>
												<tr>
													<td>Ordered Name</td>
													<td>&nbsp;</td>
													<td>${bean.name }</td>
												</tr>
												<tr>
													<td>Phone</td>
													<td>&nbsp;</td>
													<td>${bean.phone }</td>
												</tr>
												<tr>
													<td>Address</td>
													<td>&nbsp;</td>
													<td>${bean.address }</td>
												</tr>
												<tr>
													<td>Quantity</td>
													<td>&nbsp;</td>
													<td>${bean.pro_qty } Products</td>
												</tr>
												<tr>
													<td>Amount</td>
													<td>&nbsp;</td>
													<td>$ ${bean.total_amount }</td>
												</tr>
												<tr>
													<td>Payment</td>
													<td>&nbsp;</td>
													<td>${bean.method }</td>
												</tr>
											</tbody>
										</table>
										<table>
											<tbody>
												<tr>
													<td><button type="button" class="btn btn-primary"
															data-toggle="modal" data-target="#paymentModal">
															View Payment</button></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Payment Modal -->
	<div class="modal fade" id="paymentModal" tabindex="-1" role="dialog"
		aria-labelledby="paymentModalLabel" aria-hidden="true"
		data-backdrop="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="paymentModalLabel">Payment Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img src="data:image/jpeg;base64,${bean.image}" alt="image"
						class="img-fluid" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		new DataTable('#example');
	</script>
</body>
</html>
