<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/test.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/cusRegValidation.js"/>"></script>
<script src="../resources/js/adminPasswordToggle.js"></script>
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/resources/js/main.css" />">

</head>
<style>
</style>

<body class="login-page-body">
	<%@include file="navBar.jsp"%>
	<div class="login-page">

		<div class="form">
			<form:form class="login-form" action="signup" method="post"
				name="confirm" modelAttribute="cusObj"
				onsubmit="return validateForm()">
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
						name="password" onfocus="clearError()" /> <span id="passError"
						class="text-danger"></span>
				</div>
				<div class="mb-3">
					<input type="password" class="form-control"
						placeholder="Confirm Password" name="conpassword"
						onfocus="clearError()" /> <span id="confirmPassError"
						class="text-danger"></span>
				</div>
				<div class="mb-3">
					<input type="text" class="form-control" placeholder="Phone Number"
						name="phone" onfocus="clearError()" /> <span id="phoneError"
						class="text-danger"></span>
				</div>
				<div class="mb-3">
					<input type="text" class="form-control" placeholder="Address"
						name="address" onfocus="clearError()" /> <span id="addressError"
						class="text-danger"></span>
				</div>

				<button type="button" class="btn btn-primary" id="submitButton">Submit</button>


				<!-- Submit Modal -->
				<div class="modal fade" id="submitModal" tabindex="-1" role="dialog"
					aria-labelledby="submitModalLabel" aria-hidden="true"
					data-backdrop="false">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="submitModalLabel">Registration</h5>
								
							</div>
							<div class="modal-body">Register Successful</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary btn-sm">OK</button>
							</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>

	<!-- Include Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

</body>
</html>