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

<!-- Include DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

<!-- Include jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Include DataTables JS -->
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link href="<c:url value="/resources/css/product.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/js/main.js" />">
<title>Cart</title>
</head>

<style>
.showImage {
	width: 36px;
	height: 36px;
	object-fit: cover;
	border-radius: 50%;
}

@media ( min-width : 1025px) {
	.h-custom {
		height: 100vh !important;
	}
}

.payment-button {
	display: inline-flex;
	align-items: center;
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	font-size: 16px;
	margin-right: 10px;
	margin-bottom: 10px;
}

.payment-button:hover {
	background-color: #0056b3;
}

.payment-icon {
	width: 24px;
	height: 24px;
	margin-right: 10px;
	width: 36px;
	height: 36px;
	object-fit: cover;
	border-radius: 50%;
}

/* Optional: Adjust this if needed */
.img-fluid {
	max-width: 100%;
	height: auto;
}

.rounded {
	border-radius: 50%;
}

.modal-image {
	max-width: 100%;
	height: auto;
}
</style>
<body>
	<%@include file="navBar.jsp"%>


	<!-- Single Page Header start -->
	<div class="container-fluid page-header py-5">
		<h1 class="text-center text-white display-6">Payment</h1>
	</div>
	<!-- Single Page Header End -->

	<div class="container-fluid fruite py-5">
		<div class="container py-5">
			<form id="paymentForm" action="pay" method="post"
				enctype="multipart/form-data">
				<div class="row g-4">

					<div class="col-md-4">
						<table>
							<tbody>
								<c:forEach items="${payment}" var="paymentOption">
									<tr>
										<td><input type="radio" class="payment-radio"
											id="paymentOption${paymentOption.id}" name="payment"
											value="${paymentOption.id}"> &nbsp; <label
											for="paymentOption${paymentOption.id}"> <img
												src="<c:url value='/resources/images/${paymentOption.name}.png'/>"
												class="showImage" /> ${paymentOption.name}
										</label><td><br>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>	
						<button type="button" class="btn btn-info generate-qr-btn">Generate
							QR</button>
					</div>

					<div class="col-md-4">
						<div class="tm-product-img-dummy mx-auto">
							<img id="previewImage" src="#" alt="Preview Image"
								style="display: none; max-width: 100%;" /> <i
								class='bx bxs-image-add big-icon'
								onclick="document.getElementById('fileInput').click();"></i>
						</div>
						<div class="custom-file mt-3 mb-3">
							<input type="file" class="form-control" id="fileInput"
								name="file" style="display: none;" onchange="previewFile();" />
							<input name="file" type="button"
								class="btn btn-primary btn-block mx-auto" value="UPLOAD IMAGE"
								onclick="document.getElementById('fileInput').click();" />
						</div>
					</div>


					<div class="col-md-4">
						<div class="card bg-primary text-white rounded-3">
							<div class="card-body">
								<div
									class="d-flex justify-content-between align-items-center mb-4">
									<h5 class="mb-0">Amount</h5>
								</div>

								<hr class="my-4">
								<!-- <form action="pay" method="post"> -->
								<div class="d-flex justify-content-between mb-4">
									<p class="mb-2">
										Total
										(${tax})
									</p>
									<input type= "hidden" value="${coupon_id }" name ="coupon" />
									<input type="hidden" value="${percent }" name="percent"/>
									<input type="hidden" name="total" value="${total}" /> 
									<p class="mb-2" name="displayTotal">$ ${total}</p>
								</div>

								<button type="submit" class="btn btn-info btn-block btn-lg"
									style="text-align: left;">
									<div class="d-flex justify-content-between">
										<span>Pay <i class='bx bx-cart'
											style='font-size: 24px;'></i></span>
									</div>
								</button>
							</div>
						</div>
					</div>

				</div>
			</form>
		</div>
	</div>

	<!-- thank U model -->
	<div class="modal fade" id="pay" tabindex="-1" role="dialog"
		aria-labelledby="payModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="payModalLabel">Thank You</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Your payment has been processed
					successfully. Thank you for your purchase!</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- KBZ Model  -->
	<div class="modal fade" id="kpayModal" tabindex="-1" role="dialog"
		aria-labelledby="kpayModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="kpayModalLabel">Payment Option:
						KBZPay</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span>Your Price : $ ${total }</span>
					<hr>
					<img src="<c:url value='/resources/images/KBZPayQr.jpg'/>"
						class="modal-image" />
					<hr>
					<span>Phone Number : 09-442-430-530</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- AYA Model  -->
	<div class="modal fade" id="ayapayModal" tabindex="-1" role="dialog"
		aria-labelledby="ayapayModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ayapayModalLabel">Payment Option:
						AYAPay</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span>Your Price : $ ${total }</span>
					<hr>
					<img src="<c:url value='/resources/images/AYAPayQr.jpg'/>"
						class="modal-image" />
					<hr>
					<span>Phone Number : 09-442-430-530</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Wave Model  -->
	<div class="modal fade" id="wavepayModal" tabindex="-1" role="dialog"
		aria-labelledby="wavepayModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="wavepayModalLabel">Payment Option:
						WavePay</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span>Your Price : $ ${total }</span>
					<hr>
					<img src="<c:url value='/resources/images/WavePayQr.jpg'/>"
						class="modal-image" />
					<hr>
					<span>Phone Number : 09-776-590-550</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			$('.generate-qr-btn').click(function() {
				// Get the ID of the selected payment option
				var selectedPaymentId = $('input[name=payment]:checked').val();
				if (selectedPaymentId == 1) {
					$('#kpayModal').modal('show');
				} else if (selectedPaymentId == 2) {
					$('#wavepayModal').modal('show');
				} else if(selectedPaymentId == 3){
					$('#ayapayModal').modal('show');
				}

			});
		});
		function previewFile() {
			const preview = document.getElementById('previewImage');
			const file = document.getElementById('fileInput').files[0];
			const reader = new FileReader();

			reader.onloadend = function() {
				preview.src = reader.result;
				preview.style.display = 'block';
			}

			if (file) {
				reader.readAsDataURL(file);
			} else {
				preview.src = '';
				preview.style.display = 'none';
			}
		}

		document.getElementById("paymentForm").onsubmit = function() {
			var paymentRadios = document.querySelectorAll('.payment-radio');
			var isChecked = false;
			paymentRadios.forEach(function(radio) {
				if (radio.checked) {
					isChecked = true;
				}
			});

			var fileInput = document.getElementById('fileInput');
			var file = fileInput.files[0];

			if (!isChecked) {
				alert("Please select a payment option.");
				return false; // Prevent form submission
			} else if (!file) {
				alert("Please upload an image.");
				return false; // Prevent form submission
			}
		};
	</script>
</body>
</html>
