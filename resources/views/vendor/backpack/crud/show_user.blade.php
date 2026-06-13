@php
    use App\Models\Studentachievement;

    $student = $entry;
    $currentEnrollment = $student->activeEnrollment()->with('halqa.teacher')->first();
    $currentHalqa = $currentEnrollment?->halqa;
    $currentHalqaId = $currentHalqa?->id;

    $lastProgress = $student->progress()->with('surah')->where('memorize_type', 'حفظ')->whereNotNull('surah_id')->latest('id')->first();

$currentSurahs = collect();
    $currentJuz = collect();
    if ($currentHalqaId) {
        $currentSurahs = Studentachievement::where('student_id', $student->id)
            ->where('type', 'surah_memorized')
            ->where('halakat_id', $currentHalqaId)
            ->with('surah')
            ->get();

        $currentJuz = collect();
        if ($currentHalqaId) {
            $currentJuz = $student->progress()
                ->where('memorize_type', 'حفظ')
                ->whereNotNull('juz_number')
                ->whereNull('surah_id')
                ->where('halakat_id', $currentHalqaId)
                ->orderBy('date', 'desc')
                ->get();
        }

        $revisionSurahs = $student->progress()
            ->where('memorize_type', 'مراجعة')
            ->whereNotNull('surah_id')
            ->where('halakat_id', $currentHalqaId)
            ->with('surah')
            ->orderBy('date', 'desc')
            ->get()
            ->unique('surah_id');

$revisionJuzProgress = $student->progress()
             ->where('memorize_type', 'مراجعة')
             ->whereNotNull('juz_number')
             ->whereNull('surah_id')
             ->where('halakat_id', $currentHalqaId)
             ->with('surah')
             ->orderBy('date', 'desc')
             ->get();
    }

    $totalAtt = $student->attendances()->count();
    $presentAtt = $student->attendances()->where('status', 'حاضر')->count();
    $attPct = $totalAtt > 0 ? round(($presentAtt / $totalAtt) * 100) : 0;

    $halqaAttTotal = 0;
    $halqaAttPresent = 0;
    $halqaAttPct = 0;
    if ($currentHalqaId) {
        $halqaAttTotal = $student->attendances()->where('halakat_id', $currentHalqaId)->count();
        $halqaAttPresent = $student->attendances()->where('halakat_id', $currentHalqaId)->where('status', 'حاضر')->count();
        $halqaAttPct = $halqaAttTotal > 0 ? round(($halqaAttPresent / $halqaAttTotal) * 100) : 0;
    }

    $oldEnrollments = $student
        ->enrollments()
        ->where('is_active', false)
        ->with(['halqa' => fn($q) => $q->withTrashed(), 'halqa.teacher' => fn($q) => $q->withTrashed()])
        ->get();
@endphp

@section('before_styles')
    <style>
        @media print {

            .d-print-none,
            .card-header .btn,
            .navbar,
            .sidebar,
            footer,
            .breadcrumb,
            .d-print-none {
                display: none !important;
            }

            .card {
                border: none !important;
                box-shadow: none !important;
            }

            .card-header {
                padding: 0 !important;
            }

            .progress {
                border: 1px solid #000;
            }

            .progress-bar {
                background-color: #000 !important;
                color: #fff;
            }
        }
    </style>
@endsection

@extends(backpack_view('blank'))

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-3">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="card-title mb-0"><i class="la la-user"></i> {{ $student->name }}</h3>
                    <div>
                                                <a href="{{ backpack_url('user/' . $student->id . '/edit') }}" class="btn btn-sm btn-outline-primary"><i class="la la-edit"></i> تعديل</a>
                        <form method="POST" action="{{ backpack_url('user/' . $student->id) }}" style="display:inline;" onsubmit="return confirm('هل أنت متأكد من حذف هذا الطالب؟');">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-outline-danger"><i class="la la-trash"></i> حذف</button>
                        </form>
                        <a href="javascript: window.print();" class="btn btn-sm btn-outline-secondary"><i
                                class="la la-print"></i> طباعة</a>
                        <a href="{{ backpack_url('dashboard') }}" class="btn btn-sm btn-outline-secondary"><i
                                class="la la-arrow-right"></i> عودة</a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <table class="table table-sm table-borderless">
                                <tr>
                                    <th class="ps-0" style="width:140px">الاسم</th>
                                    <td>{{ $student->name }}</td>
                                </tr>
                                <tr>
                                    <th class="ps-0">البريد الإلكتروني</th>
                                    <td>{{ $student->email ?? '—' }}</td>
                                </tr>
                                <tr>
                                    <th class="ps-0">رقم الهاتف</th>
                                    <td>{{ $student->phone ?? '—' }}</td>
                                </tr>
                                <tr>
                                    <th class="ps-0">تاريخ الميلاد</th>
                                    <td>{{ $student->birth_date ? $student->birth_date->format('Y-m-d') : '—' }}</td>
                                </tr>
                                <tr>
                                    <th class="ps-0">الجنس</th>
                                    <td>{{ $student->gender }}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table class="table table-sm table-borderless">
                                <tr>
                                    <th class="ps-0" style="width:140px">الدور</th>
                                    <td>{{ $student->arabic_role }}</td>
                                </tr>
                                <tr>
                                    <th class="ps-0">تاريخ الانضمام</th>
                                    <td>{{ $student->created_at->format('Y-m-d') }}</td>
                                </tr>
                                @if ($student->isStudent())
                                    <tr>
                                        <th class="ps-0">الحلقة الحالية</th>
                                        <td>
                                            @if ($currentHalqa)
                                                <a
                                                    href="{{ backpack_url('halakat/' . $currentHalqa->id . '/show') }}">{{ $currentHalqa->name }}</a>
                                            @else
                                                —
                                            @endif
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="ps-0">المدرس الحالي</th>
                                        <td>
                                            @if ($currentHalqa?->teacher)
                                                <a
                                                    href="{{ backpack_url('user/' . $currentHalqa->teacher->id . '/show') }}">{{ $currentHalqa->teacher->name }}</a>
                                            @else
                                                —
                                            @endif
                                        </td>
                                    </tr>
                                @endif
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if ($student->isStudent())
        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-question-circle"></i> آخر ما تم الوصول اليه</h3>
                    </div>
                    <div class="card-body">
                        @if ($lastProgress)
                            <div class="fs-4">
                                {{ $lastProgress->surah?->name ?? '—' }}
                                <span class="text-muted">(اية {{ $lastProgress->to_aya }})</span>
                            </div>
                            <div class="text-muted small">
                                {{ $lastProgress->date->format('Y-m-d') }}
                                — {{ $lastProgress->teacher?->name ?? '—' }}
                            </div>
                        @else
                            <div class="text-muted">—</div>
                        @endif
                    </div>
                </div>

                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-book"></i> السور التي تم حفظها</h3>
                    </div>
                    <div class="card-body">
                        @if ($currentSurahs->isNotEmpty())
                            <div class="table-responsive">
                                <table class="table table-vcenter table-sm">
                                    <thead><tr><th>السورة</th><th>تاريخ الإنجاز</th></tr></thead>
                                    <tbody>
                                        @foreach ($currentSurahs as $ach)
                                            <tr>
                                                <td>{{ $ach->surah?->name ?? '—' }}</td>
                                                <td>{{ $ach->achieved_at?->format('Y-m-d') ?? '—' }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        @else
                            <div class="text-muted">—</div>
                        @endif
                    </div>
                </div>

                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-layer-group"></i> الأجزاء التي تم حفظها</h3>
                    </div>
                    <div class="card-body">
                        @if ($currentJuz->isNotEmpty())
                            <div class="table-responsive">
                                <table class="table table-vcenter table-sm">
                                    <thead><tr><th>الجزء</th><th>التقييم</th><th>ملاحظات المدرس</th><th>التاريخ</th></tr></thead>
                                    <tbody>
                                        @foreach ($currentJuz as $progress)
                                            <tr>
                                                <td>
                                                    @php
                                                        $juzArr = is_array($progress->juz_number) ? $progress->juz_number : json_decode($progress->juz_number, true);
                                                        echo is_array($juzArr) ? implode('، ', array_map(fn($n) => 'الجزء ' . ((int) $n), $juzArr)) : '—';
                                                    @endphp
                                                </td>
                                                <td>{{ $progress->evaluation ?? '—' }}</td>
                                                <td>{{ $progress->notes ?? '—' }}</td>
                                                <td>{{ $progress->date?->format('Y-m-d') ?? '—' }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        @else
                            <div class="text-muted">—</div>
                        @endif
                    </div>
                </div>

            </div>
            <div class="col-md-6">

                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-refresh"></i> سور المراجعة</h3>
                    </div>
                    <div class="card-body">
                        @if ($revisionSurahs->isNotEmpty())
                            <div class="table-responsive">
                                <table class="table table-vcenter table-sm">
                                    <thead><tr><th>السورة</th><th>التقييم</th><th>ملاحظات</th><th>التاريخ</th></tr></thead>
                                    <tbody>
                                        @foreach ($revisionSurahs as $prog)
                                            <tr>
                                                <td>{{ $prog->surah?->name ?? '—' }}</td>
                                                <td>{{ $prog->evaluation ?? '—' }}</td>
                                                <td>{{ $prog->notes ?? '—' }}</td>
                                                <td>{{ $prog->date?->format('Y-m-d') ?? '—' }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        @else
                            <div class="text-muted">—</div>
                        @endif
                    </div>
                </div>

                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-layer-group"></i> الأجزاء التي تمت مراجعتها</h3>
                    </div>
                    <div class="card-body">
                        @if ($revisionJuzProgress->isNotEmpty())
                            <div class="table-responsive">
                                <table class="table table-vcenter table-sm">
                                    <thead><tr><th>الجزء</th><th>التقييم</th><th>ملاحظات</th><th>التاريخ</th></tr></thead>
                                    <tbody>
                                        @foreach ($revisionJuzProgress as $prog)
                                            @foreach (collect($prog->juz_number) as $jz)
                                                <tr>
                                                    <td>الجزء {{ $jz }}</td>
                                                    <td>{{ $prog->evaluation ?? '—' }}</td>
                                                    <td>{{ $prog->notes ?? '—' }}</td>
                                                    <td>{{ $prog->date?->format('Y-m-d') ?? '—' }}</td>
                                                </tr>
                                            @endforeach
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        @else
                            <div class="text-muted">—</div>
                        @endif
                    </div>
                </div>

                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-chart-line"></i> نسبة الحضور الكلية في المعهد</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="progress flex-grow-1" style="height:24px">
                                <div class="progress-bar {{ $attPct >= 80 ? 'bg-success' : ($attPct >= 60 ? 'bg-primary' : ($attPct >= 40 ? 'bg-warning' : 'bg-danger')) }}"
                                    style="width: {{ $attPct }}%">{{ $attPct }}%</div>
                            </div>
                        </div>
                        <div class="text-muted small mt-1">حضور: {{ $presentAtt }} | غياب: {{ $totalAtt - $presentAtt }}
                            | إجمالي: {{ $totalAtt }}</div>
                    </div>
                </div>

                @if($currentHalqaId)
                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-calendar-check"></i> نسبة الحضور في الحلقة</h3>
                    </div>
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="progress flex-grow-1" style="height:24px">
                                <div class="progress-bar {{ $halqaAttPct >= 80 ? 'bg-success' : ($halqaAttPct >= 60 ? 'bg-primary' : ($halqaAttPct >= 40 ? 'bg-warning' : 'bg-danger')) }}"
                                    style="width: {{ $halqaAttPct }}%">{{ $halqaAttPct }}%</div>
                            </div>
                        </div>
                        <div class="text-muted small mt-1">حضور: {{ $halqaAttPresent }} | غياب: {{ $halqaAttTotal - $halqaAttPresent }}
                            | إجمالي: {{ $halqaAttTotal }}</div>
                    </div>
                </div>
                @endif

                <div class="card mb-3">
                    <div class="card-header">
                        <h3 class="card-title"><i class="la la-history"></i> الانجازات السابقة</h3>
                    </div>
                    <div class="card-body">
                        @if ($oldEnrollments->isNotEmpty())
                            @foreach ($oldEnrollments as $enr)
                                @php
                                    $oldAchievements = Studentachievement::where('student_id', $student->id)
                                        ->where('halakat_id', $enr->halakat_id)
                                        ->with('surah')
                                        ->get();
                                    $oldSurahs = $oldAchievements->where('type', 'surah_memorized');
                                    $oldJuz = $oldAchievements->where('type', 'juz_memorized');
                                @endphp
                                <div class="mb-3 p-3 border rounded">
                                    <div class="fw-bold">{{ $enr->halqa?->name ?? 'حلقة محذوفة' }}
                                        <small class="text-muted">— {{ $enr->halqa?->teacher?->name ?? '—' }}</small>
                                    </div>
                                    <div class="text-muted small mb-2">
                                        من {{ $enr->joined_at ? $enr->joined_at->format('Y-m-d') : '?' }} إلى
                                        {{ $enr->left_at ? $enr->left_at->format('Y-m-d') : 'الآن' }}
                                    </div>
                                    @if ($oldSurahs->isNotEmpty())
                                        <div class="mb-1">
                                            <span class="text-muted small">السور:</span>
                                            @foreach ($oldSurahs as $ach)
                                                <span
                                                    class="badge bg-white text-primary border border-primary rounded-pill">{{ $ach->surah?->name ?? '—' }}</span>
                                            @endforeach
                                        </div>
                                    @endif
                                    @if ($oldJuz->isNotEmpty())
                                        <div>
                                            <span class="text-muted small">الأجزاء:</span>
                                            @foreach ($oldJuz as $ach)
                                                <span
                                                    class="badge bg-white text-success border border-success rounded-pill">الجزء
                                                    {{ $ach->juz_number }}</span>
                                            @endforeach
                                        </div>
                                    @endif
                                    @if ($oldSurahs->isEmpty() && $oldJuz->isEmpty())
                                        <div class="text-muted small">—</div>
                                    @endif
                                </div>
                            @endforeach
                        @else
                            <div class="text-muted">لا يوجد</div>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    @endif
@endsection
