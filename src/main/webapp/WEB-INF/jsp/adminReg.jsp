<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Register</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
	rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/adminLogin.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/adminRegValidation.js"/>"></script>


</head>
<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>

			<div class="form">
				<div class="login">
					<div class="login-header"></div>
				</div>
				<form class="login-form" action="adminSignup" method="post"
					name="confirm" onsubmit="return validateForm()">
					<div class="mb-3">
						<input type="text" class="form-control" placeholder="Your Name"
							name="name" onfocus="clearError()" /> <span id="nameError"
							class="text-danger"></span>
					</div>
					<div class="mb-3">
						<input type="email" class="form-control" placeholder="Your Email"
							name="email" onfocus="clearError()" /> <span id="emailError"
							class="text-danger"></span>
					</div>
					<div class="mb-3">
						<input type="password" class="form-control" placeholder="Password"
							name="password" id="password" onfocus="clearError()" /> <span
							class="form-group-text" id="togglePassword"
							onclick="togglePasswordVisibility()"><i
							class="far fa-eye-slash"></i></span><span id="passError"
							class="text-danger"></span>
					</div>
					<div class="mb-3">
						<input type="password" class="form-control"
							placeholder="Confirm Password" name="conpassword" id="conpassword"
							onfocus="clearError()" /><span class="form-group-text"
							id="togglePassword" onclick="togglePasswordVisibility()"><i
							class="far fa-eye-slash"></i></span> <span id="confirmPassError"
							class="text-danger"></span>
					</div>
					<div class="mb-3">
						<input type="text" class="form-control" placeholder="Phone Number"
							name="phone" onfocus="clearError()" /> <span id="phoneError"
							class="text-danger"></span>
					</div>
					<div class="mb-3">
						<select name="role">
							<option value="">Select Role</option>
							<option value="1">ADMIN</option>
							<option value="0">SUPER ADMIN</option>
						</select> <span id="selectError" class="text-danger"></span>
					</div>
					<button type="button" class="btn btn-primary" id="submitButton">Register</button>
					<!-- Model -->
					<div class="modal fade" id="submitModal" tabindex="-1"
						role="dialog" aria-labelledby="submitModalLabel"
						aria-hidden="true" data-backdrop="false">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="submitModalLabel">Registration</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Register Successful.</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">OK</button>
								</div>
							</div>
						</div>
					</div>
				</form>
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
<script src="<c:url value="/resources/js/adminPasswordToggle.js"/>"></script>

</body>
</html>