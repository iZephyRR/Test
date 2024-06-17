<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<script src="<c:url value="/resources/js/adminRegValidation.js"/>"></script>
<title>ADMIN</title>
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
						<h3>ADMIN</h3>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#myModal">
							<i class="bx bx-list-plus"></i>
						</button>
					</div>
					<table id="example" class="table table-striped">
						<thead>
							<tr>
								<th>Name</th>
								<th>Email</th>
								<th>Phone Number</th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${admin_lst }" var="list">
								<tr>
									<td class="text-center">${list.name }</td>
									<td class="text-center">${list.email }</td>
									<td class="text-center">${list.phone }</td>
									<td class="text-center"><a
										href="<c:url value = 'adminDetail/${list.id }/${list.name}'/>">Detail</a></td>
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

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-md">
			<!-- modal-lg class for large modal -->
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Registration</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<!-- Form inside modal -->
					<form:form class="login-form"
						action="<c:url value= 'adminSignup'/> " method="post" model="bean"
						name="confirm" onsubmit="return validateForm()">
						<div class="mb-3">
							<form:input type="text" class="form-control"
								placeholder="Your Name" path="name" name="name"
								onfocus="clearError()" />
							<span id="nameError" class="text-danger"></span>
						</div>
						<div class="mb-3">
							<form:input type="email" class="form-control"
								placeholder="Your Email" path="email" name="email"
								onfocus="clearError()" />
							<span id="emailError" class="text-danger"></span>
						</div>
						<div class="mb-3">
							<form:input type="password" class="form-control"
								placeholder="Password" path="password" name="password"
								id="password" onfocus="clearError()" />
							<span class="form-group-text" id="togglePassword"
								onclick="togglePasswordVisibility()"><i
								class="far fa-eye-slash"></i></span><span id="passError"
								class="text-danger"></span>
						</div>
						<div class="mb-3">
							<form:input type="password" class="form-control"
								placeholder="Confirm Password" name="conpassword"
								id="conpassword" path="conpassword" onfocus="clearError()" />
							<span class="form-group-text" id="togglePassword"
								onclick="togglePasswordVisibility()"><i
								class="far fa-eye-slash"></i></span> <span id="confirmPassError"
								class="text-danger"></span>
						</div>
						<div class="mb-3">
							<form:input type="text" class="form-control"
								placeholder="Phone Number" path="phone" name="phone"
								onfocus="clearError()" />
							<span id="phoneError" class="text-danger"></span>
						</div>
						<div class="mb-3">
							<form:select path="role">
								<form:option value="1">ADMIN</form:option>
								<form:option value="0">SYSTEM ADMIN</form:option>
							</form:select>
							<span id="selectError" class="text-danger"></span>
						</div>
						<div class="modal-footer">
							<!-- Button aligned to the right -->
							<button type="submit" class="btn btn-primary ml-auto">Register</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<script>
		new DataTable('#example');
	</script>

</body>
</html>