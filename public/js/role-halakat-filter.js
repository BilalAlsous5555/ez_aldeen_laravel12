document.addEventListener('DOMContentLoaded', function() {
    const roleField = document.querySelector('[name="role"]');
    const halakaField = document.querySelector('[name="selected_halaka"]');
    const halakaWrapper = document.getElementById('assign_halakat_wrapper');

    if (!roleField || !halakaField) return;

    function updateHalakatOptions() {
        const role = roleField.value;

        if (role === 'student' || role === 'teacher') {
            if (halakaWrapper) halakaWrapper.style.display = '';
        } else {
            if (halakaWrapper) halakaWrapper.style.display = 'none';
            halakaField.value = '';
            return;
        }

        fetch('/admin/halakat/by-role?role=' + role)
            .then(function(res) { return res.json(); })
            .then(function(data) {
                const currentVal = halakaField.value;
                halakaField.innerHTML = '';

                Object.entries(data).forEach(function(entry) {
                    var id = entry[0];
                    var name = entry[1];
                    var opt = document.createElement('option');
                    opt.value = id;
                    opt.textContent = name;
                    if (id === currentVal) { opt.selected = true; }
                    halakaField.appendChild(opt);
                });
            });
    }

    roleField.addEventListener('change', updateHalakatOptions);
    updateHalakatOptions();
});
