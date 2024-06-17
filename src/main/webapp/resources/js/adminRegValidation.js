
// Function to validate form inputs
function validateForm() {
	var name = document.forms["confirm"]["name"].value;
	var email = document.forms["confirm"]["email"].value;
	var password = document.forms["confirm"]["password"].value;
	var confirmPassword = document.forms["confirm"]["conpassword"].value;
	var phone = document.forms["confirm"]["phone"].value;
	var role = document.forms["confirm"]["role"].value;

	// Regular expression for email validation
	var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

	// Clear previous error messages
	document.getElementById("nameError").innerHTML = "";
	document.getElementById("emailError").innerHTML = "";
	document.getElementById("passError").innerHTML = "";
	document.getElementById("confirmPassError").innerHTML = "";
	document.getElementById("phoneError").innerHTML = "";
	document.getElementById("selectError").innerHTML = "";
	
	// Validation for each field
	if (name.trim() === "") {
		document.getElementById("nameError").innerHTML = "Name is required";
		return false;
	}

	if (email.trim() === "") {
		document.getElementById("emailError").innerHTML = "Email is required";
		return false;
	} else if (!email.match(emailRegex)) {
		document.getElementById("emailError").innerHTML = "Invalid email format";
		return false;
	}

	if (password.trim() === "") {
		document.getElementById("passError").innerHTML = "Password is required";
		return false;
	}

	if (confirmPassword.trim() === "") {
		document.getElementById("confirmPassError").innerHTML = "Please confirm your password";
		return false;
	} else if (confirmPassword !== password) {
		document.getElementById("confirmPassError").innerHTML = "Passwords do not match";
		return false;
	}

	if (phone.trim() === "") {
		document.getElementById("phoneError").innerHTML = "Phone number is required";
		return false;
	}

	if (role.trim() === "") {
		document.getElementById("selectError").innerHTML = "Please select a role";
		return false;
	}
	

	// If all fields are valid, return true to submit the form
	return true;
}

function clearError() {
	document.getElementById("nameError").innerHTML = "";
	document.getElementById("emailError").innerHTML = "";
	document.getElementById("passError").innerHTML = "";
	document.getElementById("confirmPassError").innerHTML = "";
	document.getElementById("phoneError").innerHTML = "";
	document.getElementById("selectError").innerHTML = "";
}


