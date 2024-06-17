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

<!-- My CSS -->

<link href="<c:url value="/resources/css/adminHub.css"/>"
	rel="stylesheet">
<script src="<c:url value="/resources/js/adminHub.js" />"></script>

<title>Admin Detail</title>
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
						<h3>ADMIN Detail</h3>
					</div>
					<table>
						<thead>
							<tr>
								<th>Name</th>
								<th>Email</th>
								<th>Phone Number</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${adminBean.name }</td>
								<td>${adminBean.email }</td>
								<td>${adminBean.phone }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="table-data">
				<div class="order">
					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th class = "text-center">Product Name</th>
								<th class = "text-center">Price</th>
								<th class = "text-center">In Stock(kg)</th>
								<th class = "text-center">Category</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${proLst }" var="list">
								<tr>
									<td class = "text-center"><img src="data:image/jpeg;base64,${list.image}"
										alt="${list.name }" class="user-image" /></td>
									<td class = "text-center">${list.name }</td>
									<td class = "text-center">$ ${list.unit_price }</td>
									<td class = "text-center">${list.stock_qty } </td>
									<td class = "text-center">${list.pro_cate }</td>
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
	<script>
		new DataTable('#example');
	</script>

</body>
</html>