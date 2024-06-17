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

<title>Orders</title>
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
						<h3>Order List</h3>
					</div>
					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th class="text-center">Date</th>
								<th class="text-center">Name</th>
								<th class="text-center">Amount</th>
								<th class="text-center">Quantity</th>
								<th class="text-center">Coupon Discount</th>
								<th class="text-center">Payment</th>
								<th>&nbsp;</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${vou_list }" var="list">
								<tr>
									<td class="text-center">${list.date }</td>
									<td class="text-center">${list.name }</td>
									<td class="text-center">$ ${list.total_amount }</td>
									<td class="text-center">${list.pro_qty } Products</td>
									<c:if test="${list.dis_percent > 0}">
										<td class="text-center">${list.dis_percent} % OFF</td>
									</c:if>
									<c:if test="${list.dis_percent <= 0}">
										<td class="text-center">No discount</td>
									</c:if>
									<td class="text-center">${list.method }</td>
									<td class="text-center">${list.confirm }</td>
									<td class="text-center"><a
										href="<c:url value='viewCustomerOrderDetail/${list.id }'/>">Order
											Detail</a></td>
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