<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Update Product</title>
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

<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</head>
<style>
</style>
<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div class="container tm-mt-big tm-mb-big">
				<div class="row">
					<!-- Image Column -->
					<div class="col-lg-6 mb-4">
						<div class="border rounded">
							<img src="data:image/jpeg;base64,${bean.image}" alt="Image"
								class="img-fluid rounded" id="image" />
						</div>
					</div>

					<!-- Form Column -->
					<div class="col-lg-6 mb-8">
						<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
							<div class="row tm-edit-product-row">
								<div class="col-lg-12">
									<form action="/Ace_Mart/updateProduct" method="post">
										<input type="hidden" name="id" value="${bean.id}" />
										<div class="mb-3">
											<label for="name" class="form-label">Product Name</label> <input
												type="text" class="form-control" id="name" name="name"
												value="${bean.name}">
										</div>
										<div class="mb-3">
											<label for="category" class="form-label">Category</label> <input
												type="text" class="form-control" id="category"
												name="category" value="${bean.pro_cate}" disabled>
										</div>
										<div class="mb-3">
											<label for="unitInstock" class="form-label">Units In
												Stock</label> <input type="text" class="form-control"
												id="unitInstock" name="unitInstock"
												value="${bean.stock_qty}">
										</div>
										<div class="mb-3">
											<label for="unitPrice" class="form-label">Unit Price
												($/kg)</label> <input type="text" class="form-control"
												id="unitPrice" name="unitPrice" value="${bean.unit_price}">
										</div>
										<div class="mb-3">
											<label for="description" class="form-label">Description</label>
											<textarea class="form-control" id="description" name="desc"
												rows="4">${bean.description}</textarea>
										</div>
										<button type="submit" class="btn btn-primary">Submit</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>
</body>
</html>
