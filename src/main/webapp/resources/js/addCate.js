function catevalidateForm() {
	var isValid = true;

	// Reset any previous error messages
	document.getElementById('imageError').textContent = "";
	document.getElementById('nameError').textContent = "";

	// Validate Image
	 var image = document.getElementsByName("file")[0].value;
	if (image.trim()=== "") {
		document.getElementById('imageError').textContent = "Please upload an image.";
		isValid = false;
	}

	// Validate Category Name
	var categoryName = document.getElementByName('name')[0].value;
	if (categoryName.trim() === "") {
		document.getElementById('nameError').textContent = "Category name cannot be empty.";
		isValid = false;
	}

	// Optionally, you can add more validation rules for the category name if needed.

	return isValid;
}

function cateclearError() {
	document.getElementById('imageError').textContent = "";
	document.getElementById('nameError').textContent = "";
}