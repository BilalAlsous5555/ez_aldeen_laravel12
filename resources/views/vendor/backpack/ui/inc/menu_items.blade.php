{{-- This file is used for menu items by any Backpack v7 theme --}}
<li class="nav-item"><a class="nav-link" href="{{ backpack_url('dashboard') }}"><i class="la la-home nav-icon"></i> {{ trans('backpack::base.dashboard') }}</a></li>

<x-backpack::menu-item title="افراد المعهد" icon="la la-question" :link="backpack_url('user')" />
<x-backpack::menu-item title="حلقات المعهد" icon="la la-question" :link="backpack_url('halakat')" />
<x-backpack::menu-item title="احصائيات التقدم القرآني " icon="la la-question" :link="backpack_url('quran-progress')" />
{{-- <x-backpack::menu-item title="Surahs" icon="la la-question" :link="backpack_url('surah')" />
<x-backpack::menu-item title="Quran pages" icon="la la-question" :link="backpack_url('quran-page')" /> --}}
<x-backpack::menu-item title="احصائيات الحضور" icon="la la-question" :link="backpack_url('attendance')" />