<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@5.0.9/css/boxicons.min.css'
	rel='stylesheet'>

<!-- Include jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- datatable -->
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

<!-- My CSS -->
<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/adminHub.js" />"></script>

<title>AdminHub</title>
<style>
</style>
</head>
<body>

	<%@include file="adminSidebar.jsp"%>
	<!-- CONTENT -->
	<section id="content">
		<!-- MAIN -->
		<main>
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Coupons</h3>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">
							<i class="bx bx-list-plus"></i>
						</button>
					</div>
					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">Coupon Code</th>
								<th class="text-center">Percentage</th>
								<th class="text-center">Expired Date</th>
								<!-- <th>&nbsp;</th> -->
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${coupon_lst }" var="list">
								<tr>
									<td class="text-center">${list.code }</td>
									<td class="text-center">${list.dis_percent }%</td>
									<td class="text-center">${list.endDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
	<!-- Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-md">
			<!-- modal-lg class for large modal -->
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Create Coupon</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<!-- Form inside modal -->
					<form action="<c:url value='/createCoupon'/> "
						class="tm-edit-product-form" method="post"
						onsubmit="return validationForm()">
						<label for="dis_amount">Discount Percentage(%)</label> <input
							name="dis_amount" id="dis_amount" type="number"
							class="form-control validate" /> 
							<div><span id="amountError"
							class="text-danger"></span></div> <label for="date">End Date</label> <input
							name="date" id="date" type="date" class="form-control validate" />
						<div><span id="dateError" class="text-danger"></span></div>
						<div class="modal-footer">
							<!-- Button aligned to the right -->
							<button type="submit" class="btn btn-primary ml-auto">Create Coupon</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		new DataTable('#example');
		function validationForm() {
			var disAmount = document.getElementById("dis_amount").value;
			var date = document.getElementById("date").value;
			var amountError = document.getElementById("amountError");
			var dateError = document.getElementById("dateError");
			var isValid = true;

			// Resetting previous errors
			amountError.textContent = "";
			dateError.textContent = "";

			// Validation for Discount Amount
			if (disAmount === "") {
				amountError.textContent = "Please enter a discount amount.";
				isValid = false;
			}

			// Validation for End Date
			if (date === "") {
				dateError.textContent = "Please select an end date.";
				isValid = false;
			}

			return isValid;
		}
	</script>

</body>
</html>