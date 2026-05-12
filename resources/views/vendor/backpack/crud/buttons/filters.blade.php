<div class="btn-group flex-wrap" style="gap: 4px;" role="group">
    <a href="{{ url($crud->route) }}?filter=active_students"
       class="btn btn-sm {{ request('filter') === 'active_students' ? 'btn-primary' : 'btn-outline-primary' }}">
        <i class="la la-user-graduate"></i> الطلاب النشطون
    </a>
    <a href="{{ url($crud->route) }}?filter=active_teachers"
       class="btn btn-sm {{ request('filter') === 'active_teachers' ? 'btn-primary' : 'btn-outline-primary' }}">
        <i class="la la-chalkboard-teacher"></i> المدرسون النشطون
    </a>
    <a href="{{ url($crud->route) }}?filter=deleted_students"
       class="btn btn-sm {{ request('filter') === 'deleted_students' ? 'btn-danger' : 'btn-outline-danger' }}">
        <i class="la la-user-slash"></i> الطلاب المحذوفون
    </a>
    <a href="{{ url($crud->route) }}?filter=deleted_teachers"
       class="btn btn-sm {{ request('filter') === 'deleted_teachers' ? 'btn-danger' : 'btn-outline-danger' }}">
        <i class="la la-chalkboard-teacher"></i> المدرسون المحذوفون
    </a>
    <a href="{{ url($crud->route) }}?filter=without_halqa"
       class="btn btn-sm {{ request('filter') === 'without_halqa' ? 'btn-warning' : 'btn-outline-warning' }}">
        <i class="la la-unlink"></i> بلا حلقة
    </a>
    @if(request('filter'))
        <a href="{{ url($crud->route) }}" class="btn btn-sm btn-outline-secondary">
            <i class="la la-times"></i> إزالة الفلتر
        </a>
    @endif
</div>
