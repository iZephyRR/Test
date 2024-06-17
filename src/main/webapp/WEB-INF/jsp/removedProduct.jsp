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

<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/adminHub.js" />"></script>

<!-- Include jQuery -->
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

</head>

<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div id="reportsPage">

				<div class="row tm-content-row">
					<div class=" col-lg-12">
						<div class="tm-bg-primary-dark tm-block tm-block-products">
							<div class="table-data">
								<div class="order">
									<div class="head">
										<h3>Removed Products</h3>
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
												<th class="text-center">Add to Store</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pro_lst }" var="list">
												<tr>
													<td><img src="data:image/jpeg;base64,${list.image}"
														alt="${list.name }" class="user-image" /></td>
													<td class="text-center">${list.name }</td>
													<td class="text-center">$ ${list.unit_price }</td>
													<td class="text-center">${list.stock_qty }</td>
													<td class="text-center">${list.pro_cate }</td>
													<td class="text-center"><a
														href="<c:url value = '/detailProduct/${ list.id }'/> ">Detail</a></td>
													<td class="text-center">
															<a href="<c:url value = '/add/${list.id }'/>"><i class='bx bx-list-plus'
																style="font-size: 30px; color: red"></i></a>
														</td>
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

	<script>
		new DataTable('#example');
	</script>
</body>
</html>