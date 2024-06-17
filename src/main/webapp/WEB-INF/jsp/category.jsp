<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Products</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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

<link href="<c:url value="/resources/css/product.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/adminHub.js" />"></script>
<script src="<c:url value ="/resources/js/addCate.js"/>"></script>
<!-- Include jQuery -->

</head>

<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div id="reportsPage">
				<div class="row tm-content-row">
					<div class=" col-lg-8">
						<div class="tm-bg-primary-dark tm-block tm-block-products">
							<div class="table-data">
								<div class="order">
									<div class="head">
										<h3>Categories</h3>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#cateModal">
											<i class="bx bx-list-plus"></i>
										</button>
									</div>
									<table id="exampleCate" class="table table-striped">
										<thead>
											<tr>
												<th class = "text-center">Category's Name</th>
												<th class = "text-center">In Stock</th>
												<!-- <th>&nbsp;</th> -->
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${catelst }" var="catelst">
												<tr>
													<td class="text-center">${catelst.name }</td>
													<td class="text-center">${catelst.count }Products</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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

	<!-- Cate Modal -->
	<div class="modal fade" id="cateModal">
		<div class="modal-dialog modal-md">
			<!-- modal-lg class for large modal -->
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add Category</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<!-- Form inside modal -->
					<form action="<c:url value='/addCategory'/> " id="cateForm"
						class="tm-edit-product-form" method="post"
						enctype="multipart/form-data" onsubmit="return catevalidateForm()">
						<div class="col-md-12">
							<div class="tm-product-img-dummy mx-auto">
								<img id="previewImage" src="#" alt="Preview Image"
									style="display: none; max-width: 100%;" /> <i
									class='bx bxs-image-add big-icon'
									onclick="document.getElementById('fileInput').click();"></i>
							</div>
							<div class="custom-file mt-3 mb-3">
								<input id="catefileInput" type="file" style="display: none;"
									name="imgFile" onchange="previewFile();" /> <input
									name="imgFile" type="button"
									class="btn btn-primary btn-block mx-auto" value="UPLOAD IMAGE"
									onclick="document.getElementById('fileInput').click();"
									onfocus="clearError()" />
							</div>
							<span id="imageError" class="text-danger"></span>
						</div>

						<div class="form-group mb-3">
							<label for="name">Category Name</label> <input id="name"
								name="name" class="form-control validate" onfocus="clearError()" />
							<span id="nameError" class="text-danger"></span>
						</div>
						<div class="modal-footer">
							<!-- Button aligned to the right -->
							<button type="submit" class="btn btn-primary ml-auto">Add
								Category</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		/* new DataTable('#example'); */
		/* new DataTable('#exampleCate'); */
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
		
		document.getElementById("cateForm").addEventListener("submit", function(event) {
		    // Prevent the default form submission
		    event.preventDefault();

		    // Call your validation function
		    if (catevalidateForm()) {
		        // If validation passes, submit the form
		        this.submit();
		    }
		});

	</script>
</body>
</html>