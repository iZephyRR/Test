<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Profile Details</title>


<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">


<link href="<c:url value="/resources/css/adminProfile.css"/>"
	rel="stylesheet">

</head>
<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div class="container">
				<div class="row justify-content-center mt-5">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<h3 class="text-center">Admin Profile Details</h3>
							</div>
							<div class="card-body">
								<table class="table">
									<tbody>
										<tr>
											<td><strong><i class="fas fa-user"></i> Name :</strong></td>
											<td>${admin.name}</td>
										</tr>
										<tr>
											<td><strong><i class="fas fa-envelope"></i>
													Email:</strong></td>
											<td>${admin.email}</td>
										</tr>
										<tr>
											<td><strong><i class="fas fa-phone"></i> Phone
													:</strong></td>
											<td>${admin.phone}</td>
										</tr>
										<tr>
											<td colspan="2" class="text-center"><a
												href="<c:url value='/adminEdit/${admin.id}'/>"
												class="btn btn-primary edit-btn"> <i class="fas fa-edit"></i>
													Edit
											</a> <a href="<c:url value='/changePass/${admin.id}'/>"
												class="btn btn-primary edit-btn"> <i class="fas fa-key"></i>
													Change Password?
											</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
