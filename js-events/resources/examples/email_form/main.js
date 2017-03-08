var emailInputField = document.getElementById('email');

emailInputField.addEventListener('blur', checkEmailInput);

function checkEmailInput () {

    if (emailInputField.value.length === 0) {
        document.getElementById('message').innerText = 'Please enter an email address.'
        emailInputField.className = 'error';
    } else {
        document.getElementById('message').innerText = '';
        emailInputField.className = '';
    }

}