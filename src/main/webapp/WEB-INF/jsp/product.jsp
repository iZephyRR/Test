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
<%-- <script src="<c:url value="/resources/js/addPro.js"/>"></script>
<script src="<c:url value ="/resources/js/addCate.js"/>"></script>--%>
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
										<h3>Products</h3>
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#proModal">
											<i class="bx bx-list-plus"></i>
										</button>
									</div>
									<table id="example" class="table table-striped">
										<thead>
											<tr>
												<th>&nbsp;</th>
												<th class="text-center">Product Name</th>
												<th class="text-center">Price / kg</th>
												<th class="text-center">In Stock(kg)</th>
												<th class="text-center">Category</th>
												<th class="text-center">Detail</th>
												<th class="text-center">Remove from Store</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${prolst }" var="list">
												<tr>
													<td><img src="data:image/jpeg;base64,${list.image}"
														alt="${list.name }" class="user-image" /></td>
													<td class="text-center">${list.name }</td>
													<td class="text-center">$ ${list.unit_price }</td>
													<td class="text-center">${list.stock_qty }</td>
													<td class="text-center">${list.pro_cate }</td>
													<td class="text-center"><a
														href="<c:url value = '/detailProduct/${ list.id }'/> ">Detail</a></td>
													<td class="text-center"><a
														href="<c:url value = '/deleteProduct/${list.id }'/>"><i
															class="fa fa-trash-o" style="font-size: 24px; color: red"></i></a>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class=" col-lg-4">
						<div
							class="tm-bg-primary-dark tm-block tm-block-product-categories">
							<div class="tm-product-table-container">
								<div class="table-data">
									<div class="order">
										<div class="head">
											<h3>Categories</h3>
											<!-- <button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#cateModal">
												<i class="bx bx-list-plus"></i>
											</button> -->
										</div>
										<table id="exampleCate" class="table table-striped">
											<thead>
												<tr>
													<th class="text-center">Category Name</th>
													<th class="text-center">In Stock</th>
													<!-- <th>&nbsp;</th> -->
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${catelst }" var="catelst">
													<tr>
														<td class="text-center">${catelst.name }</td>
														<td class="text-center">${catelst.count } Products</td>
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
			</div>
		</main>
	</section>

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Product Modal -->
	<div class="modal fade" id="proModal">
		<div class="modal-dialog modal-md">
			<!-- modal-lg class for large modal -->
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Add Product</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<!-- Form inside modal -->
					<form action="<c:url value ='/addProduct'/> "
						class="tm-edit-product-form" method="post"
						enctype="multipart/form-data"
						onsubmit="return productvalidateForm()">
						<div class="form-group mb-3">
							<label id="name">Product Name</label> <input name="name"
								class="form-control validate" onfocus="clearError()" /> <span
								id="nameError" class="text-danger"></span>

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
									class="form-control validate" onfocus="clearError()" /><span
									id="unitError" class="text-danger"></span>
							</div>

							<div class="form-group mb-3 col-xs-12 col-sm-6">
								<label id="price">Price</label> <input name="price" id="price"
									type="number" class="form-control validate"
									onfocus="clearError()" /> <span id="priceError"
									class="text-danger"></span>
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
									name="file" style="display: none;" onchange="previewFile();" />
								<input name="file" type="button"
									class="btn btn-primary btn-block mx-auto" value="UPLOAD IMAGE"
									onclick="document.getElementById('fileInput').click();"
									onfocus="clearError()" /> <span id="imageError"
									class="text-danger"></span>
							</div>
						</div>
						<div class="modal-footer">
							<!-- Button aligned to the right -->
							<button type="submit" class="btn btn-primary ml-auto">Add
								Product</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	

	<script>
		new DataTable('#example');
		
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
		
		

		//product validation
		function productvalidateForm() {
			// Reset previous error messages
			document.getElementById("nameError").textContent = "";
			document.getElementById("descError").textContent = "";
			document.getElementById("unitError").textContent = "";
			document.getElementById("priceError").textContent = "";
			document.getElementById("imageError").textContent = "";

			var productName = document.getElementsByName("name")[0].value;
			var description = document.getElementsByName("description")[0].value;
			var stockQty = document.getElementsByName("stock_qty")[0].value;
			var price = document.getElementsByName("price")[0].value;
			var image = document.getElementsByName("file")[0].value;

			var isValid = true;

			// Validate Product Name
			if (productName.trim() === "") {
				document.getElementById("nameError").textContent = "Product Name is required";
				isValid = false;
			}

			// Validate Description
			if (description.trim() === "") {
				document.getElementById("descError").textContent = "Description is required";
				isValid = false;
			}

			// Validate Units In Stock
			if (stockQty.trim() === "" || isNaN(stockQty)) {
				document.getElementById("unitError").textContent = "Please enter a valid number for Units In Stock";
				isValid = false;
			}

			// Validate Price
			if (price.trim() === "" || isNaN(price)) {
				document.getElementById("priceError").textContent = "Please enter a valid price";
				isValid = false;
			}

			// Validate Image Upload
			if (image.trim() === "") {
				document.getElementById("imageError").textContent = "Please upload an image";
				isValid = false;
			}

			return isValid;
		}

		function clearError() {
			document.getElementById("nameError").textContent = "";
			document.getElementById("descError").textContent = "";
			document.getElementById("unitError").textContent = "";
			document.getElementById("priceError").textContent = "";
			document.getElementById("imageError").textContent = "";
		}

	</script>
</body>
</html>