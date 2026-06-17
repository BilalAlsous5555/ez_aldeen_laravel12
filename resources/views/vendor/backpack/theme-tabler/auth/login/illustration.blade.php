@extends(backpack_view('layouts.auth'))

@section('content')
    <div class="page page-center">
        <div class="container container-normal py-4">
            <div class="row align-items-center g-4">
                <div class="col-lg">
                    <div class="container-tight">
                        <div class="text-center mb-4 display-6 auth-logo-container">
                            {!! backpack_theme_config('project_logo') !!}
                        </div>
                        <div class="card card-md">
                            <div class="card-body pt-0">
                                @include(backpack_view('auth.login.inc.form'))
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg d-none d-lg-block">
                    <svg class="img d-block mx-auto" xmlns="http://www.w3.org/2000/svg" height="400" fill="none" viewBox="0 0 800 600">
                        <style>
                            :where(.theme-dark, [data-bs-theme="dark"]) .tblr-illustrations-boy-with-key-a { fill: black; opacity: 0.07; } :where(.theme-dark, [data-bs-theme="dark"]) .tblr-illustrations-boy-with-key-b { fill: #454C5E; } :where(.theme-dark, [data-bs-theme="dark"]) .tblr-illustrations-boy-with-key-c { fill: #232B41; } :where(.theme-dark, [data-bs-theme="dark"]) .tblr-illustrations-boy-with-key-d { fill: #1A2030; }
                            @media (prefers-color-scheme: dark) { .tblr-illustrations-boy-with-key-a { fill: black; opacity: 0.07; } .tblr-illustrations-boy-with-key-b { fill: #454C5E; } .tblr-illustrations-boy-with-key-c { fill: #232B41; } .tblr-illustrations-boy-with-key-d { fill: #1A2030; } }
                        </style>
                        <path d="M186.938 250.28C186.938 282.917 221.448 306.586 236.694 332.944C252.426 360.117 256.201 401.692 283.389 417.41C309.747 432.656 347.26 415.608 379.897 415.608C412.534 415.608 450.047 432.656 476.405 417.41C503.578 401.678 507.368 360.132 523.1 332.944C538.346 306.586 572.856 282.888 572.856 250.28C572.856 217.672 538.346 193.974 523.1 167.616C507.368 140.443 503.593 98.8821 476.405 83.1502C450.047 67.9046 412.534 84.9665 379.897 84.9665C347.26 84.9665 309.747 67.9046 283.389 83.1502C256.216 98.8821 252.426 140.443 236.694 167.616C221.448 193.974 186.938 217.672 186.938 250.28Z" fill="#F7F8FC" class="tblr-illustrations-boy-with-key-a"/>
                    </svg>
                </div>
            </div>
        </div>
    </div>
@endsection