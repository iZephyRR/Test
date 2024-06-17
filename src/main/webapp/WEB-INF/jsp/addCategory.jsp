<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Category</title>
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
<script src="<c:url value="/resources/js/adminHub.js" />"></script>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script src="<c:url value="/resources/css/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<!-- Include Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<script src="<c:url value ="/resources/js/addCate.js"/>"></script>
</head>

<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div class="container tm-mt-big tm-mb-big">
				<div class="row">
					<div class="col-xl-6 col-lg-8 col-md-6 col-sm-8 mx-auto">
						<div class="table-data">
							<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
								<div class="row">
									<div class="col-12">
										<h2 class="tm-block-title d-inline-block">Add Category</h2>
									</div>
								</div>

								<div class="row tm-edit-product-row">
									<div class="col-md-12">
										<form action="addCategory" class="tm-edit-product-form"
											method="post" enctype="multipart/form-data"
											onsubmit="return validateForm()">
											<div class="col-md-12">
												<div class="tm-product-img-dummy mx-auto">
													<img id="previewImage" src="#" alt="Preview Image"
														style="display: none; max-width: 100%;" /> <i
														class='bx bxs-image-add big-icon'
														onclick="document.getElementById('fileInput').click();"></i>
												</div>
												<div class="custom-file mt-3 mb-3">
													<input id="fileInput" type="file" style="display: none;"
														name="imgFile" onchange="previewFile();" /> <input
														name="imgFile" type="button"
														class="btn btn-primary btn-block mx-auto"
														value="UPLOAD IMAGE"
														onclick="document.getElementById('fileInput').click();"
														onfocus="clearError()" />
												</div>
											</div>
											<span id="imageError" class="text-danger"></span>
											<div class="form-group mb-3">
												<label for="name">Category Name</label> <input id="name"
													name="name" class="form-control validate"
													onfocus="clearError()" /> <span id="nameError"
													class="text-danger"></span>
											</div>
											<div class="col-12">
												<button type="button" id="submitButton"
													class="btn btn-primary btn-block text-uppercase">Add</button>
											</div>
											<!-- Model -->
											<div class="modal fade" id="submitModal" tabindex="-1"
												role="dialog" aria-labelledby="submitModalLabel"
												aria-hidden="true" data-backdrop="false">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="submitModalLabel">Adding
																New Category</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">New Category is created.</div>
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
