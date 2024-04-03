function toggleSidebar() {
    var sidebar = document.querySelector('.sidebar');
    var content = document.querySelector('.content');

    sidebar.classList.toggle('collapsed');
    content.classList.toggle('collapsed');
}

function togglePassword() {
    var passwordInput = document.getElementById("password");
    if (passwordInput.type === "password") {
        passwordInput.type = "text";
    } else {
        passwordInput.type = "password";
    }
}

function printTable() {
    var printContent = document.getElementById('printTable').outerHTML;
    var originalContent = document.body.innerHTML;
    document.body.innerHTML = printContent;
    window.print();
    document.body.innerHTML = originalContent;
}

//document.querySelectorAll('.contract-details').forEach(function(element) {
//    element.previousElementSibling.addEventListener('click', function(event) {
//        event.preventDefault();
//        var details = element;
//        if (details.style.display === 'none') {
//            details.style.display = 'block';
//        } else {
//            details.style.display = 'none';
//        }
//        });
//    });
