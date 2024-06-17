
function clearError(fieldId) {
	document.getElementById(fieldId + 'Error').innerText = '';
}

function validateForm() {
	var name = document.getElementsByName('name')[0].value.trim();
	var phone = document.getElementsByName('phone')[0].value.trim();
	var floor = document.getElementsByName('floor')[0].value.trim();
	var township = document.getElementsByName('township')[0].value.trim();
	var street = document.getElementsByName('street')[0].value.trim();
	var city = document.getElementsByName('city')[0].value.trim();
	
	// Clear previous error messages
	document.getElementById("nameError").innerHTML = "";
	document.getElementById("floorError").innerHTML = "";
	document.getElementById("cityError").innerHTML = "";
	document.getElementById("townshipError").innerHTML = "";
	document.getElementById("phoneError").innerHTML = "";
	document.getElementById("streetError").innerHTML = "";

	if (name === '') {
		document.getElementById('nameError').innerText = 'Please enter your name.';
		return false;
	}

	if (phone === '') {
		document.getElementById('phoneError').innerText = 'Please enter your phone number.';
		return false;
	}

	if (floor === '') {
		document.getElementById('floorError').innerText = 'Please enter the floor/building number.';
		return false;
	}

	if (township === '') {
		document.getElementById('townshipError').innerText = 'Please enter the township.';
		return false;
	}

	if (street === '') {
		document.getElementById('streetError').innerText = 'Please enter the street.';
		return false;
	}

	if (city === '') {
		document.getElementById('cityError').innerText = 'Please enter the city.';
		return false;
	}

	return true;
}

