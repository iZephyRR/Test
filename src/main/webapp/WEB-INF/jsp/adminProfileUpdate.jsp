
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Profile</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

<link  rel="stylesheet" href="<c:url value="/resources/css/adminProfileUpdate.css"/>">
	

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
								<h3 class="text-center">Admin Profile Update</h3>
							</div>
							<div class="card-body">
								<form method="post" action="../adminUpdate"
									enctype="multipart/form-data">
									<input type="hidden" name="id" value="${profile.id}" />
									<div class="text-center mb-4">
										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
											alt="avatar" class="rounded-circle img-fluid"
											style="width: 150px;">
									</div>
									<div class="form-group">
										<label for="name"><i class="fas fa-user"></i> Your
											Name</label> <input type="text" class="form-control" id="name"
											name="name" value="${profile.name}">
									</div>
									<div class="form-group">
										<label for="email"><i class="fas fa-envelope"></i>
											Your Email</label> <input type="email" class="form-control"
											id="email" name="email" value="${profile.email}">
									</div>

									<%-- <div class="form-group">
										<label for="password"><i class="fas fa-lock"></i>
											Password</label> <input class="form-control" id="password"
											name="password" type="password" placeholder="Password"
											value="${profile.password}"> <span
											class="form-group-text" id="togglePassword"><i
											class="far fa-eye-slash"></i></span>
									</div> --%>

									<div class="form-group">
										<label for="phone"><i class="fas fa-phone"></i> Phone</label>
										<input type="phone" class="form-control" id="phone"
											name="phone" value="${profile.phone}">
									</div>
									<div class="text-center">
										<input type="submit" class="btn btn-success col-md-2"
											value="Save">

									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/adminPasswordToggle.js"/>"></script>
		
	
</body>
</html>
