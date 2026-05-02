@extends(backpack_view('blank'))

@php
    $widgets['before_content'][] = [
        'type' => 'jumbotron',
        'heading' => trans('backpack::base.welcome'),
        'heading_class' =>
            'display-3 ' . (backpack_theme_config('layout') === 'horizontal_overlap' ? ' text-white' : ''),
        'content' => trans('backpack::base.use_sidebar'),
        'content_class' => backpack_theme_config('layout') === 'horizontal_overlap' ? 'text-white' : '',
        'button_link' => backpack_url('logout'),
        'button_text' => trans('backpack::base.logout'),
    ];
    Widget::add()
        ->to('before_content')
        ->type('div')
        ->class('row mt-3')
        ->content([
            Widget::make()
                ->type('progress')
                ->class('card mb-3')
                ->statusBorder('start')
                ->accentColor('primary')
                // ->ribbon(['left', 'la-user'])
                ->progressClass('progress-bar')
                ->value(239)
                ->description('Registered users.')
                ->progress((100 * (int) 239) / 1000)
                ->hint(1000 - 239 . ' more until next milestone.'),

            Widget::make()
                ->type('progress')
                ->class('card mb-3')
                ->statusBorder('start')
                ->accentColor('success')
                // ->ribbon(['top', 'la-user'])
                ->progressClass('progress-bar')
                ->value(239)
                ->description('Registered users.')
                ->progress((100 * (int) 239) / 1000)
                ->hint(1000 - 239 . ' more until next milestone.'),

            Widget::make()
                ->type('progress')
                ->class('card mb-3')
                ->statusBorder('start')
                ->accentColor('warning')
                // ->ribbon(['left', 'la-user'])
                ->progressClass('progress-bar')
                ->value(239)
                ->description('Registered users.')
                ->progress((100 * (int) 239) / 1000)
                ->hint(1000 - 239 . ' more until next milestone.'),

            Widget::make()
                ->type('progress')
                ->class('card mb-3')
                ->statusBorder('start')
                ->accentColor('danger')
                // ->ribbon(['left', 'la-user'])
                ->progressClass('progress-bar')
                ->value(239)
                ->description('Registered users.')
                ->progress((100 * (int) 239) / 1000)
                ->hint(1000 - 239 . ' more until next milestone.'),
        ]);
@endphp

@section('content')
    <div class="col-md-6 col-lg-4">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Social Media Traffic</h3>
            </div>
            <table class="table card-table table-vcenter">
                <thead>
                    <tr>
                        <th>Network</th>
                        <th colspan="2">Visitors</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Instagram</td>
                        <td>3,550</td>
                        <td class="w-50">
                            <div class="progress progress-xs">
                                <div class="progress-bar bg-primary" style="width: 71%"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Twitter</td>
                        <td>1,798</td>
                        <td class="w-50">
                            <div class="progress progress-xs">
                                <div class="progress-bar bg-primary" style="width: 35.96%"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Facebook</td>
                        <td>1,245</td>
                        <td class="w-50">
                            <div class="progress progress-xs">
                                <div class="progress-bar bg-primary" style="width: 24.9%"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>TikTok</td>
                        <td>986</td>
                        <td class="w-50">
                            <div class="progress progress-xs">
                                <div class="progress-bar bg-primary" style="width: 19.72%"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Pinterest</td>
                        <td>854</td>
                        <td class="w-50">
                            <div class="progress progress-xs">
                                <div class="progress-bar bg-primary" style="width: 17.080000000000002%"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>VK</td>
                        <td>650</td>
                        <td class="w-50">
                            <div class="progress progress-xs">
                                <div class="progress-bar bg-primary" style="width: 13%"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Pinterest</td>
                        <td>420</td>
                        <td class="w-50">
                            <div class="progress progress-xs">
                                <div class="progress-bar bg-primary" style="width: 8.4%"></div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
@endsection
