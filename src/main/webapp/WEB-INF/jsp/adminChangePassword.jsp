
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

<link rel="stylesheet"
	href="<c:url value="/resources/css/adminProfileUpdate.css"/>">

</head>
<body>
	<%@include file="adminSidebar.jsp"%>
	<section id="content">
		<main>
			<div class="container">
				<div class="row justify-content-center mt-5">
					<div class="col-md-6">
						<div class="card">
							<div class="card-body rounded">
								<form action="adminchangePass" method="post">
									<div class="mb-3">
										<label for="currentPassword" class="form-label">Current
											Password</label> <input type="password" class="form-control"
											id="currentPassword" name="currentPassword" onfocus="clearError()" required>
										<span class="text-danger">${message }</span> <span
											id="passError" class="text-danger"></span>
									</div>
									<div class="mb-3">
										<label for="newPassword" class="form-label">New
											Password</label> <input type="password" class="form-control"
											id="newPassword" name="newPassword" onfocus="clearError()" required> <span
											id="newpassError" class="text-danger"></span>
									</div>
									<button type="button" class="btn btn-primary"
										onclick="validateForm()">Change Password</button>

									<!-- Info Change Modal -->
									<div class="modal fade" id="passChangeModal" tabindex="-1"
										role="dialog" aria-labelledby="passChangeModalLabel"
										aria-hidden="true" data-backdrop="false">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="#passChangeModalLabel">Save
														Info:</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">Are you sure to Change Your
													Password?</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Cancel</button>
													<button type="submit" class="btn btn-primary">OK</button>
												</div>
											</div>
										</div>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</section>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="<c:url value="/resources/js/adminPasswordToggle.js"/>"></script>

	<script>
		// Function to validate the form
		function validateForm() {
			// Fetching current and new password input fields
			var currentPassword = document.getElementById("currentPassword").value;
			var newPassword = document.getElementById("newPassword").value;

			// Resetting any previous error messages
			document.getElementById("passError").innerText = "";
			document.getElementById("newpassError").innerText = "";

			// Validation checks
			if (currentPassword === "") {
				document.getElementById("passError").innerText = "Please enter your current password.";
				return false;
			}
			if (newPassword === "") {
				document.getElementById("newpassError").innerText = "Please enter a new password.";
				return false;
			}

			// If validation is successful, show the modal
			$('#passChangeModal').modal('show');
		}
		function clearError(){
			document.getElementById("passError").innerText = "";
			document.getElementById("newpassError").innerText = "";
		}
	</script>


</body>
</html>
