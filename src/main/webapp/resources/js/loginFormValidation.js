// Function to validate form inputs
  function validateForm() {
    var email = document.forms["confirm"]["email"].value;
    var password = document.forms["confirm"]["password"].value;

    // Regular expression for email validation
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Clear previous error messages
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("passError").innerHTML = "";

    // Validation for each field
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

    // If all fields are valid, return true to submit the form
    return true;
  }
  
   function clearError() {
    document.getElementById("emailError").innerHTML = "";
    document.getElementById("passError").innerHTML = "";
  }
  