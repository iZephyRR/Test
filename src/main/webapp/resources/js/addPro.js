function productvalidateForm() {
    // Reset previous error messages
    document.getElementById("nameError").textContent = "";
    document.getElementById("descError").textContent = "";
    document.getElementById("unitError").textContent = "";
    document.getElementById("priceError").textContent = "";
    document.getElementById("imageError").textContent = "";

    var productName = document.getElementsByName("name")[0].value;
    var description = document.getElementsByName("description")[0].value;
    var stockQty = document.getElementsByName("stock_qty")[0].value;
    var price = document.getElementsByName("price")[0].value;
    var image = document.getElementsByName("file")[0].value;

    var isValid = true;

    // Validate Product Name
    if (productName.trim() === "") {
        document.getElementById("nameError").textContent = "Product Name is required";
        isValid = false;
    }

    // Validate Description
    if (description.trim() === "") {
        document.getElementById("descError").textContent = "Description is required";
        isValid = false;
    }

    // Validate Units In Stock
    if (stockQty.trim() === "" || isNaN(stockQty)) {
        document.getElementById("unitError").textContent = "Please enter a valid number for Units In Stock";
        isValid = false;
    }

    // Validate Price
    if (price.trim() === "" || isNaN(price)) {
        document.getElementById("priceError").textContent = "Please enter a valid price";
        isValid = false;
    }

    // Validate Image Upload
    if (image.trim() === "") {
        document.getElementById("imageError").textContent = "Please upload an image";
        isValid = false;
    }

    return isValid;
}

function clearError(){
	document.getElementById("nameError").textContent = "";
    document.getElementById("descError").textContent = "";
    document.getElementById("unitError").textContent = "";
    document.getElementById("priceError").textContent = "";
    document.getElementById("imageError").textContent = "";
}
