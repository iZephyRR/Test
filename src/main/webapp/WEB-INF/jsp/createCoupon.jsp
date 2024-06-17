<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Create Coupon</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<link href="<c:url value="/resources/css/product.css"/>"
	rel="stylesheet">

</head>

<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div class="container tm-mt-big tm-mb-big">
				<div class="row">
					<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
						<div class="table-data">
							<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
								<div class="row">
									<div class="col-12">
										<h2 class="tm-block-title d-inline-block">Create Coupon</h2>
									</div>
								</div>

								<div class="row tm-edit-product-row">
									<div class="col-md-12">
										<form action="createCoupon" class="tm-edit-product-form"
											method="post" onsubmit="return validationForm()">
											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-12">
													<label id="dis_amount">Discount Percentages(%) </label> <input
														name="dis_amount" id="dis_amount" type="number"
														class="form-control validate" /> <span id="amountError"
														class="text-danger"></span> <label id="date">End
														Date</label><input name="date" id="date" type="date"
														class="form-control validate" /> <span id="dateError"
														class="text-danger"></span>
												</div>
											</div>

											<div class="col-12">
												<button type="button"
													 class="btn btn-primary" id="submitButton">Create</button>
											</div>
											<!-- Model -->
											<div class="modal fade" id="submitModal" tabindex="-1"
												role="dialog" aria-labelledby="submitModalLabel"
												aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="submitModalLabel">Create New Coupon</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">Coupon's created successful.</div>
														<div class="modal-footer">
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
		</main>
	</section>

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
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
		
		// Attach event listener to submit button
		document.getElementById("submitButton").addEventListener("click",
				function() {
					// Perform form validation
					if (validationForm()) {
						// If validation passes, show the submit modal
						$('#submitModal').modal('show');
					}
				});
	</script>
</body>
</html>
