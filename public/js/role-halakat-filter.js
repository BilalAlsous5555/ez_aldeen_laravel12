document.addEventListener('DOMContentLoaded', function() {
    var roleField = document.querySelector('[name="role"]');
    var halakaField = document.querySelector('[name="selected_halaka"]');
    var halakaWrapper = document.getElementById('assign_halakat_wrapper');

    if (!roleField || !halakaField) return;

    function updateHalakatOptions() {
        var role = roleField.value;

        if (role === 'student' || role === 'teacher') {
            if (halakaWrapper) halakaWrapper.style.display = '';
        } else {
            if (halakaWrapper) halakaWrapper.style.display = 'none';
            halakaField.innerHTML = '';
            return;
        }

        halakaField.innerHTML = '<option>جاري التحميل...</option>';
        halakaField.disabled = true;

        var currentHalaka = halakaField.getAttribute('data-current-halaka') || '';
        var url = '/admin/halakat/by-role?role=' + role + '&currentHalaka=' + currentHalaka;

        fetch(url)
            .then(function(res) {
                if (!res.ok) throw new Error('Network error');
                return res.json();
            })
            .then(function(data) {
                halakaField.innerHTML = '';

                var entries = Object.entries(data);
                if (entries.length === 0) {
                    var emptyOpt = document.createElement('option');
                    emptyOpt.value = '';
                    emptyOpt.textContent = role === 'teacher' ? 'لا توجد حلقات متاحة' : 'لا توجد حلقات';
                    halakaField.appendChild(emptyOpt);
                } else {
                    entries.forEach(function(entry) {
                        var id = entry[0];
                        var name = entry[1];
                        var opt = document.createElement('option');
                        opt.value = id;
                        opt.textContent = name;
                        if (id === currentHalaka) {
                            opt.selected = true;
                        }
                        halakaField.appendChild(opt);
                    });
                }

                halakaField.disabled = false;
            })
            .catch(function() {
                halakaField.innerHTML = '<option value="">خطأ في التحميل</option>';
                halakaField.disabled = false;
            });
    }

    roleField.addEventListener('change', updateHalakatOptions);

    updateHalakatOptions();
});
