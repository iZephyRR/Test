const togglePassword = document.getElementById('togglePassword');
const passwordInput = document.getElementById('password');

togglePassword
	.addEventListener(
		'click',
		function() {
			const type = passwordInput.getAttribute('type') === 'password' ? 'text'
				: 'password';
			passwordInput.setAttribute('type', type);
			// Toggle eye icon
			this.querySelector('i').classList
				.toggle('fa-eye-slash');
			this.querySelector('i').classList.toggle('fa-eye');
		});