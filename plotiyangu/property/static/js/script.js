function toggleSidebar() {
    var sidebar = document.querySelector('.sidebar');
    var content = document.querySelector('.content');

    sidebar.classList.toggle('collapsed');
    content.classList.toggle('collapsed');
}

document.getElementById('generatePdfButton').addEventListener('click', function() {
    // Create a new jsPDF instance
    const doc = new jsPDF();

    // Add the table to the PDF
    doc.autoTable({html: 'table'});

    // Save the PDF
    doc.save('payment_statement.pdf');
});
