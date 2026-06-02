@extends(backpack_view('blank'))

@section('after_styles')
<style>
    i.la, span.la, i[class*="la-"], span[class*="la-"],
    .la, [class*="la-"] {
        font-family: 'Line Awesome Free', 'Line Awesome' !important;
        font-style: normal !important;
        font-variant: normal !important;
        text-rendering: auto !important;
        -webkit-font-smoothing: antialiased !important;
        -moz-osx-font-smoothing: grayscale !important;
        line-height: 1 !important;
        speak: none !important;
    }
</style>
@endsection

@section('content')
    <div class="row">
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-graduation-cap la-3x text-primary"></i></div>
                    <div>
                        <div class="text-muted small">إجمالي الطلاب</div>
                        <div class="fs-2 fw-bold">{{ $activeStudentsCount }}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-chalkboard-teacher la-3x text-success"></i></div>
                    <div>
                        <div class="text-muted small">إجمالي المدرسين</div>
                        <div class="fs-2 fw-bold">{{ $activeTeachersCount }}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-users la-3x text-info"></i></div>
                    <div>
                        <div class="text-muted small">الحلقات النشطة</div>
                        <div class="fs-2 fw-bold">{{ $activeHalakatCount }}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-exclamation-triangle la-3x text-warning"></i></div>
                    <div>
                        <div class="text-muted small">طلاب بدون حلقة</div>
                        <div class="fs-2 fw-bold">{{ $withoutHalqaCount }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-book-open la-3x text-purple" style="color: #7c3aed;"></i></div>
                    <div>
                        <div class="text-muted small">السور المكتملة</div>
                        <div class="fs-2 fw-bold">{{ $totalSurahsCount }}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-layer-group la-3x text-success"></i></div>
                    <div>
                        <div class="text-muted small">الأجزاء المكتملة</div>
                        <div class="fs-2 fw-bold">{{ $totalJuzCount }}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-check-circle la-3x text-info"></i></div>
                    <div>
                        <div class="text-muted small">حضور اليوم</div>
                        <div class="fs-2 fw-bold">{{ $todayAttendanceCount }}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card mb-3">
                <div class="card-body d-flex align-items-center">
                    <div class="me-3"><i class="la la-user-times la-3x text-danger"></i></div>
                    <div>
                        <div class="text-muted small">غياب اليوم</div>
                        <div class="fs-2 fw-bold">{{ $todayAbsentCount }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="card mb-3 age-groups-card">
                <div class="card-header">
                    <h3 class="card-title"><i class="la la-chart-pie"></i> الفئات العمرية لطلاب المعهد</h3>
                </div>
                <div class="card-body">
                    <div class="row text-center justify-content-center">
                        <div class="col-6 col-md-3">
                            <div class="p-3 d-flex flex-column align-items-center justify-content-center">
                                <div class="mb-2"><i class="la la-child la-2x text-warning"></i></div>
                                <div class="fs-1 fw-bold text-warning">{{ $ageGroups['under8'] }}</div>
                                <div class="text-muted fw-semibold">دون 8 سنوات</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-3">
                            <div class="p-3 d-flex flex-column align-items-center justify-content-center">
                                <div class="mb-2"><i class="la la-user la-2x text-info"></i></div>
                                <div class="fs-1 fw-bold text-info">{{ $ageGroups['bet8_12'] }}</div>
                                <div class="text-muted fw-semibold">من 8 إلى 12</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-3">
                            <div class="p-3 d-flex flex-column align-items-center justify-content-center">
                                <div class="mb-2"><i class="la la-male la-2x text-primary"></i></div>
                                <div class="fs-1 fw-bold text-primary">{{ $ageGroups['bet12_18'] }}</div>
                                <div class="text-muted fw-semibold">من 12 إلى 18</div>
                            </div>
                        </div>
                        <div class="col-6 col-md-3">
                            <div class="p-3 d-flex flex-column align-items-center justify-content-center">
                                <div class="mb-2"><i class="la la-user-secret la-2x text-success"></i></div>
                                <div class="fs-1 fw-bold text-success">{{ $ageGroups['over18'] }}</div>
                                <div class="text-muted fw-semibold">فوق 18</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if ($halakat->isNotEmpty())
        <div class="row">
            @foreach ($halakat as $halqa)
                @php $students = $halqa->activeStudents; @endphp
                <div class="col-md-12 mb-3">
                    <div class="card mb-0">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="la la-circle text-primary"></i>
                                {{ $halqa->name }}
                                @if($halqa->teacher)
                                    <span class="badge bg-success-lt ms-2">
                                        <i class="la la-chalkboard-teacher"></i>
                                        {{ $halqa->teacher->name }}
                                    </span>
                                @endif
                                <span class="badge bg-white text-primary border border-primary rounded-pill fs-6 px-3 ms-2">{{ $students->count() }}
                                    طالب</span>
                            </h3>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-vcenter card-table table-sm">
                                <thead>
                                    <tr>
                                        <th>اسم الطالب</th>
                                        <th>الحضور</th>
                                        <th>عذر الغياب</th>
                                        <th>عدد الحضور</th>
                                        <th>عدد الغياب</th>
                                        <th>نسبة الحضور في الحلقة</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($students as $student)
                                        @php
                                            $key = $student->id . '_' . $halqa->id;
                                            $sa = $attendanceData->get($key, collect());
                                            $todayRecord = $sa->first(
                                                fn($r) => $r->attendance_date->isSameDay(today()),
                                            );

                                            $halqaRecs = $halqaAttendanceData->get($key, collect());
                                            $halqaPresent = $halqaRecs->where('status', 'حاضر')->count();
                                            $halqaAbsent = $halqaRecs->where('status', 'غائب')->count();
                                            $halqaTotal = $halqaRecs->count();
                                            $halqaPct = $halqaTotal > 0 ? round(($halqaPresent / $halqaTotal) * 100) : 0;
                                        @endphp
                                        <tr>
                                            <td><a
                                                    href="{{ backpack_url('user/' . $student->id . '/show') }}">{{ $student->name }}</a>
                                            </td>
                                            <td>{{ $todayRecord ? ($todayRecord->status === 'حاضر' ? 'حاضر' : 'غائب') : '—' }}
                                            </td>
                                            <td>{{ $todayRecord && $todayRecord->status === 'غائب' && $todayRecord->excused_reason ? $todayRecord->excused_reason : '—' }}
                                            </td>
                                            <td>{{ $halqaPresent }}</td>
                                            <td>{{ $halqaAbsent }}</td>
                                            <td>{{ $halqaPct }}%</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="6" class="text-muted text-center">لا يوجد طلاب</td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    @else
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-3">
                    <div class="card-body text-muted text-center">لا توجد حلقات نشطة</div>
                </div>
            </div>
        </div>
    @endif

    <div class="row">
        <div class="col-md-12">
            <div class="card mb-3">
                <div class="card-header">
                    <h3 class="card-title"><i class="la la-layer-group"></i> أسماء الحفاظ لكل جزء</h3>
                </div>
                <div class="table-responsive">
                    <table class="table table-vcenter card-table table-sm">
                        <thead>
                            <tr>
                                <th>رقم الجزء</th>
                                <th>الطلاب الذين أتموا هذا الجزء</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($juzProgress as $juzNumber => $achievements)
                                <tr>
                                    <td class="fw-bold">الجزء {{ $juzNumber }}</td>
                                    <td>
                                        @foreach ($achievements as $ach)
                                            <a href="{{ backpack_url('user/' . $ach->student_id . '/show') }}"
                                                class="badge bg-white text-success border border-success rounded-pill text-decoration-none me-1 mb-1">{{ $ach->student->name }}</a>
                                        @endforeach
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="2" class="text-muted text-center">لا توجد بيانات بعد</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <div class="row">
        <div class="col-md-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h3 class="card-title"><i class="la la-book"></i> آخر السور المحفوظة</h3>
                </div>
                <table class="table table-vcenter card-table">
                    <thead>
                        <tr>
                            <th>الطالب</th>
                            <th>السورة</th>
                            <th>تاريخ الإنجاز</th>
                            <th>المدرس</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($recentSurahs as $a)
                            <tr>
                                <td><a
                                        href="{{ backpack_url('user/' . $a->student_id . '/show') }}">{{ $a->student->name }}</a>
                                </td>
                                <td>{{ $a->surah?->name ?? '—' }}</td>
                                <td>{{ $a->achieved_at->format('Y-m-d') }}</td>
                                <td>{{ $a->teacher->name }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-muted text-center">لا توجد بيانات بعد</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h3 class="card-title"><i class="la la-layer-group"></i> آخر الأجزاء المحفوظة</h3>
                </div>
                <table class="table table-vcenter card-table">
                    <thead>
                        <tr>
                            <th>الطالب</th>
                            <th>الجزء</th>
                            <th>تاريخ الإنجاز</th>
                            <th>المدرس</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($recentJuz as $a)
                            <tr>
                                <td><a
                                        href="{{ backpack_url('user/' . $a->student_id . '/show') }}">{{ $a->student->name }}</a>
                                </td>
                                <td>الجزء {{ $a->juz_number }}</td>
                                <td>{{ $a->achieved_at->format('Y-m-d') }}</td>
                                <td>{{ $a->teacher->name }}</td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="4" class="text-muted text-center">لا توجد بيانات بعد</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
</div>

    <div class="row">
        <div class="col-md-12">
            <div class="card mb-3">
                <div class="card-header">
                    <h3 class="card-title"><i class="la la-trophy"></i> أكثر الطلاب التزاما في المعهد</h3>
                </div>
                <div class="table-responsive">
                    <table class="table table-vcenter card-table">
                        <thead>
                            <tr>
                                <th>اسم الطالب</th>
                                <th>عدد مرات الحضور الكلي</th>
                                <th>عدد مرات الغياب الكلي</th>
                                <th>النسبة المئوية الكلية</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($committedStudents as $cs)
                                <tr>
                                    <td><a
                                            href="{{ backpack_url('user/' . $cs->student->id . '/show') }}">{{ $cs->student->name }}</a>
                                    </td>
                                    <td>{{ $cs->present }}</td>
                                    <td>{{ $cs->absent }}</td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="progress progress-xs flex-grow-1">
                                                <div class="progress-bar {{ $cs->percentage >= 80 ? 'bg-success' : ($cs->percentage >= 60 ? 'bg-primary' : ($cs->percentage >= 40 ? 'bg-warning' : 'bg-danger')) }}"
                                                    style="width: {{ $cs->percentage }}%"></div>
                                            </div>
                                            <span class="ms-2">{{ $cs->percentage }}%</span>
                                        </div>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="text-muted text-center">لا توجد بيانات بعد</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection