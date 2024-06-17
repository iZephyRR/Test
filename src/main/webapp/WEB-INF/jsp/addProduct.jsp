<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add Product</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="<c:url value = "/resources/css/fontawesome.min.css"/>">

<link href="<c:url value="/resources/css/product.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/addPro.js"/>"></script>

<script src="<c:url value="/resources/js/adminHub.js" />"></script>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/css/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
</head>
<style>
</style>
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
										<h2 class="tm-block-title d-inline-block">Add Product</h2>
									</div>
								</div>

								<div class="row tm-edit-product-row">
									<div class="col-md-12">
										<form action="addProduct" class="tm-edit-product-form"
											method="post" enctype="multipart/form-data"
											onsubmit="return validateForm()">
											<div class="form-group mb-3">
												<label id="name">Product Name</label> <input name="name"
													class="form-control validate" onfocus="clearError()"/> <span id="nameError"
													class="text-danger"></span>

											</div>
											<div class="form-group mb-3">
												<label id="description">Description</label>
												<textarea name="description" class="form-control validate"
													rows="3" onfocus="clearError()"></textarea>
												<span id="descError" class="text-danger"></span>
											</div>

											<div class="row">
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label id="stock_qty">Units In Stock </label> <input
														name="stock_qty" id="stock" type="number"
														class="form-control validate" onfocus="clearError()"/><span id="unitError"
														class="text-danger"></span>
												</div>

												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label id="price">Price</label> <input name="price"
														id="price" type="text" class="form-control validate" onfocus="clearError()"/> <span
														id="priceError" class="text-danger"></span>
												</div>
												<div class="form-group mb-3 col-xs-12 col-sm-6">
													<label id="pro_cate_id">Category</label> <select
														name="pro_cate_id">
														<c:forEach items="${lst }" var="lst">
															<option value="${lst.id }">${lst.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="form-group mb-3"></div>

											<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
												<div class="tm-product-img-dummy mx-auto">
													<img id="previewImage" src="#" alt="Preview Image"
														style="display: none; max-width: 100%;" /> <i
														class='bx bxs-image-add big-icon'
														onclick="document.getElementById('fileInput').click();"></i>
												</div>
												<div class="custom-file mt-3 mb-3">
													<input type="file" class="form-control" id="fileInput"
														name="file" style="display: none;"
														onchange="previewFile();" /> <input name="file"
														type="button" class="btn btn-primary btn-block mx-auto"
														value="UPLOAD IMAGE"
														onclick="document.getElementById('fileInput').click();" onfocus="clearError()"/>
													<span id="imageError" class="text-danger"></span>
												</div>
											</div>
											<div class="col-12 d-flex justify-content-center">
												<button type="button" class="btn btn-primary" id="submitButton">Add Product</button>
											</div>
											<!-- Model -->
											<div class="modal fade" id="submitModal" tabindex="-1"
												role="dialog" aria-labelledby="submitModalLabel"
												aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="submitModalLabel">Adding New Products</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">New Product is added to the Store.</div>
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

		// Attach event listener to submit button
		document.getElementById("submitButton").addEventListener("click",
				function() {
					// Perform form validation
					if (validateForm()) {
						// If validation passes, show the submit modal
						$('#submitModal').modal('show');
					}
				});
	</script>
</body>
</html>
