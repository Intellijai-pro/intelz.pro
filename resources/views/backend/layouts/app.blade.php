<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}" data-bs-theme="light" style="{{getCustomizationSetting('heading_font_family')}}" dir="{{ language_direction() }}" class="theme-fs-sm" data-bs-theme-color="{{getCustomizationSetting('theme_color')}}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="{{ asset(setting('logo')) }}">
    <link rel="apple-touch-icon" sizes="76x76" href="{{ asset(setting('favicon')) }}">
    <meta name="keyword" content="{{ setting('meta_keyword') }}">
    <meta name="description" content="{{ setting('meta_description') }}">
    <meta name="setting_options" content="{{ setting('customization_json') }}">
    <!-- Shortcut Icon -->
    <link rel="shortcut icon" href="{{ asset(setting('favicon')) }}">
    <link rel="icon" type="image/ico" href="{{ asset(setting('favicon')) }}" />

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="app_name" content="{{ app_name() }}">

    <meta name="data_table_limit" content="{{ setting('data_table_limit') }}">

    <meta name="auth_user_roles" content="{{auth()->user()->roles->pluck('name')}}">


    <title>@yield('title') | {{ app_name() }}</title>

    <link rel="stylesheet" href="{{ mix('css/icon.min.css') }}">
    @if ($isNoUISlider ?? '')
        <!-- NoUI Slider css -->
        <link rel="stylesheet" href="{{ asset('vendor/noUiSilder/style/nouislider.min.css') }}">
    @endif

    @stack('before-styles')
    <link rel="stylesheet" href="{{ mix('css/libs.min.css') }}">
    <link rel="stylesheet" href="{{ mix('css/backend.css') }}">
    <link rel="stylesheet" href="{{ asset('custom-css/dashboard.css') }}">

    @if(language_direction() == 'rtl')
        <link rel="stylesheet" href="{{ asset('css/rtl.css') }}">
    @endif

    <link rel="stylesheet" href="{{ asset('css/custom.css') }}">
    <link rel="stylesheet" href="{{ asset('css/customizer.css') }}">

    <style>
        :root{
          <?php
            $rootColors = setting('root_colors'); // Assuming the setting() function retrieves the JSON string

            // Check if the JSON string is not empty and can be decoded
            if (!empty($rootColors) && is_string($rootColors)) {
                $colors = json_decode($rootColors, true);

                // Check if decoding was successful and the colors array is not empty
                if (json_last_error() === JSON_ERROR_NONE && is_array($colors) && count($colors) > 0) {
                    foreach ($colors as $key => $value) {
                        echo $key . ': ' . $value . '; ';
                    }
                } else {
                    echo 'Invalid JSON or empty colors array.';
                }
            }
            ?>

        }
    </style>

    <!-- Scripts -->
    @php
        $currentLang = App::currentLocale();
        $langFolderPath = base_path("lang/$currentLang");
        $filePaths = \File::files($langFolderPath);
      @endphp

    @foreach ($filePaths as $filePath)
      @php
        $fileName = pathinfo($filePath, PATHINFO_FILENAME);
      @endphp
      <script>
        window.localMessagesUpdate = {
          ...window.localMessagesUpdate,
          "{{ $fileName }}": @json(require($filePath))
        }
      </script>
    @endforeach
    @php
    $role = !empty(auth()->user()) ? auth()->user()->getRoleNames() : null;

    @endphp

     @php

     $id = auth()->user()->id ?? '';
    @endphp



    <script>
        window.auth_role = @json($role)

    </script>

     <script>

       window.auth_id = @json($id)

    </script>
    <script>
        window.auth_permissions = @json($permissions)
    </script>
    @if(setting('is_one_signal_notification') == 1)
      <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" defer></script>
      <script>
        window.OneSignal = window.OneSignal || [];
        OneSignal.push(function() {
          OneSignal.init({
            appId: "{{ setting('onesignal_app_id') }}",
            safari_web_id: "web.onesignal.auto.3cbb98e8-d926-4cfe-89ae-1bc86ff7cf70",
            notifyButton: {
              enable: true,
            },
            subdomainName: "apps-iqonic",
          });
          window.OneSignal.getUserId(function (userId) {
            if(userId !== '{{ auth()->user()->web_player_id ?? '' }}' && '{{ auth()->user()->web_player_id ?? 'undefined' }}' !== 'undefined') {
                fetch("{{ route('backend.update-player-id') }}", {
                    method: 'POST',
                    headers: {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json',
                      'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: JSON.stringify({ player_id: userId })
                  })
                  .then((res) => res.json())
                  .then((data) => console.log(data))
              }
            })
        });
      </script>
    @endif
    <link rel="stylesheet" href="{{ asset('phosphoricons/style.css') }}">
    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700&display=swap" rel="stylesheet">
    {{-- <link href="https://fonts.googleapis.com/css2?family=Lexend+Deca&display=swap" rel="stylesheet"> --}}

    @stack('after-styles')

    <x-google-analytics />

    <style>
      {!! setting('custom_css_block') !!}
    </style>

    <!-- Futuristic Theme Enhancement Styles -->
    <style>
        /* Futuristic Sidebar & Dashboard Theme */
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700;900&family=Rajdhani:wght@300;400;500;600;700&display=swap');

        /* Global Body Enhancement */
        body {
            background: #0a0a0a !important;
            font-family: 'Rajdhani', sans-serif !important;
            color: #fff !important;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background Particles */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 50%, rgba(0, 255, 255, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 50%, rgba(255, 0, 255, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 50% 50%, rgba(0, 255, 255, 0.05) 0%, transparent 70%);
            animation: nebulaPulse 20s ease-in-out infinite;
            z-index: -2;
            pointer-events: none;
        }

        @keyframes nebulaPulse {
            0%, 100% { transform: scale(1) rotate(0deg); opacity: 0.8; }
            25% { transform: scale(1.1) rotate(90deg); opacity: 1; }
            50% { transform: scale(0.9) rotate(180deg); opacity: 0.6; }
            75% { transform: scale(1.05) rotate(270deg); opacity: 0.9; }
        }

        /* Grid Overlay */
        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 200%;
            height: 200%;
            background-image: 
                linear-gradient(rgba(0, 255, 255, 0.03) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0, 255, 255, 0.03) 1px, transparent 1px);
            background-size: 100px 100px;
            animation: gridSlide 60s linear infinite;
            z-index: -1;
            pointer-events: none;
        }

        @keyframes gridSlide {
            0% { transform: translate(0, 0); }
            100% { transform: translate(-100px, -100px); }
        }

        /* Enhanced Sidebar Styling */
        .sidebar-base {
            background: rgba(10, 10, 10, 0.95) !important;
            backdrop-filter: blur(20px) saturate(180%);
            border-right: 1px solid rgba(0, 255, 255, 0.2) !important;
            position: relative;
            overflow: hidden;
            z-index: 1000;
        }

        /* Sidebar Glow Effect */
        .sidebar-base::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -2px;
            width: 2px;
            height: 200%;
            background: linear-gradient(180deg, 
                transparent, 
                rgba(0, 255, 255, 0.8), 
                rgba(255, 0, 255, 0.8), 
                transparent
            );
            animation: sidebarGlow 4s ease-in-out infinite;
        }

        @keyframes sidebarGlow {
            0%, 100% { transform: translateY(0); opacity: 0.5; }
            50% { transform: translateY(-50%); opacity: 1; }
        }

        /* Logo Enhancement */
        .logo-main {
            position: relative;
            padding: 20px;
            margin-bottom: 20px;
        }

        .logo-main::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            height: 1px;
            background: linear-gradient(90deg, 
                transparent, 
                rgba(0, 255, 255, 0.6), 
                transparent
            );
        }

        .navbar-brand {
            display: inline-block;
            transition: all 0.3s ease;
        }

        .navbar-brand:hover {
            filter: drop-shadow(0 0 10px rgba(0, 255, 255, 0.8));
            transform: scale(1.05);
        }

        /* Sidebar Toggle Button */
        .sidebar-toggle {
            background: rgba(0, 255, 255, 0.1) !important;
            border: 1px solid rgba(0, 255, 255, 0.3) !important;
            transition: all 0.3s ease;
            overflow: hidden;
            position: relative;
        }

        .sidebar-toggle::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(0, 255, 255, 0.3);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: all 0.5s ease;
        }

        .sidebar-toggle:hover::before {
            width: 100px;
            height: 100px;
        }

        .sidebar-toggle:hover {
            border-color: #00ffff !important;
            box-shadow: 0 0 15px rgba(0, 255, 255, 0.5);
        }

        .sidebar-toggle svg {
            position: relative;
            z-index: 1;
        }

        /* Menu Items Enhancement */
        .iq-main-menu .nav-link {
            color: rgba(255, 255, 255, 0.8) !important;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            margin: 5px 15px;
            border-radius: 10px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 13px;
        }

        .iq-main-menu .nav-link::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #00ffff, #ff00ff);
            transition: width 0.3s ease;
        }

        .iq-main-menu .nav-link:hover::before,
        .iq-main-menu .nav-link.active::before {
            width: 100%;
        }

        .iq-main-menu .nav-link:hover,
        .iq-main-menu .nav-link.active {
            color: #00ffff !important;
            background: rgba(0, 255, 255, 0.1) !important;
            padding-left: 25px;
            box-shadow: 
                inset 0 0 20px rgba(0, 255, 255, 0.1),
                0 0 10px rgba(0, 255, 255, 0.3);
        }

        .iq-main-menu .nav-link svg,
        .iq-main-menu .nav-link i {
            color: #00ffff !important;
            filter: drop-shadow(0 0 3px currentColor);
            transition: all 0.3s ease;
            font-size: 20px;
            margin-right: 10px;
        }

        .iq-main-menu .nav-link:hover svg,
        .iq-main-menu .nav-link:hover i {
            transform: scale(1.2) rotate(10deg);
        }

        /* Submenu Styling */
        .iq-sidebar-menu .collapse {
            background: rgba(0, 0, 0, 0.3);
            border-left: 2px solid rgba(0, 255, 255, 0.3);
            margin: 5px 15px;
            border-radius: 0 10px 10px 0;
        }

        .iq-sidebar-menu .sub-nav .nav-link {
            font-size: 12px;
            padding-left: 50px !important;
            color: rgba(255, 255, 255, 0.6) !important;
        }

        .iq-sidebar-menu .sub-nav .nav-link:hover {
            color: #ff00ff !important;
            background: rgba(255, 0, 255, 0.1) !important;
        }

        /* Enhanced Header */
        .iq-navbar {
            background: rgba(10, 10, 10, 0.8) !important;
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(0, 255, 255, 0.2) !important;
            box-shadow: 0 2px 20px rgba(0, 255, 255, 0.1);
        }

        /* Search Bar Enhancement */
        .iq-search-bar {
            background: rgba(0, 255, 255, 0.05) !important;
            border: 1px solid rgba(0, 255, 255, 0.2) !important;
            border-radius: 10px;
            overflow: hidden;
        }

        .iq-search-bar input {
            background: transparent !important;
            border: none !important;
            color: #fff !important;
            font-family: 'Rajdhani', sans-serif;
            letter-spacing: 1px;
        }

        .iq-search-bar input::placeholder {
            color: rgba(0, 255, 255, 0.5) !important;
            text-transform: uppercase;
            font-size: 12px;
        }

        .iq-search-bar:focus-within {
            box-shadow: 
                0 0 20px rgba(0, 255, 255, 0.3),
                inset 0 0 10px rgba(0, 255, 255, 0.1);
            border-color: #00ffff !important;
        }

        /* Notification & Profile Dropdowns */
        .iq-sub-dropdown {
            background: rgba(10, 10, 10, 0.95) !important;
            backdrop-filter: blur(20px);
            border: 1px solid rgba(0, 255, 255, 0.3) !important;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.8);
            border-radius: 15px !important;
            overflow: hidden;
        }

        .iq-sub-dropdown::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            height: 2px;
            background: linear-gradient(90deg, #00ffff, #ff00ff);
            animation: dropdownGlow 2s linear infinite;
        }

        @keyframes dropdownGlow {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        .iq-sub-dropdown .iq-sub-card {
            background: transparent !important;
            border-bottom: 1px solid rgba(0, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .iq-sub-dropdown .iq-sub-card:hover {
            background: rgba(0, 255, 255, 0.1) !important;
            transform: translateX(5px);
        }

        /* Scrollbar Styling */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(0, 0, 0, 0.3);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(180deg, #00ffff, #ff00ff);
            border-radius: 10px;
            border: 2px solid transparent;
            background-clip: padding-box;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(180deg, #ff00ff, #00ffff);
            background-clip: padding-box;
        }

        /* Loading Screen Enhancement */
        #loading {
            background: #0a0a0a !important;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #loading::before {
            content: 'NEURAL SYSTEM INITIALIZING...';
            position: absolute;
            top: 60%;
            left: 50%;
            transform: translateX(-50%);
            font-family: 'Orbitron', monospace;
            color: #00ffff;
            font-size: 14px;
            letter-spacing: 3px;
            animation: loadingText 1.5s ease-in-out infinite;
        }

        @keyframes loadingText {
            0%, 100% { opacity: 0.3; }
            50% { opacity: 1; }
        }

        /* Enhanced Main Content Area */
        .main-content {
            background: transparent !important;
            position: relative;
        }

        .content-inner {
            position: relative;
            z-index: 1;
        }

        /* Banner Enhancement */
        .iq-banner {
            background: linear-gradient(135deg, 
                rgba(0, 255, 255, 0.1) 0%, 
                rgba(255, 0, 255, 0.1) 100%) !important;
            border-bottom: 1px solid rgba(0, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }

        .iq-banner::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, 
                transparent, 
                #00ffff, 
                #ff00ff, 
                transparent);
            animation: bannerScan 4s linear infinite;
        }

        @keyframes bannerScan {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        /* Breadcrumb Enhancement */
        .breadcrumb {
            background: transparent !important;
            padding: 0;
            margin: 0;
        }

        .breadcrumb-item {
            color: rgba(255, 255, 255, 0.6) !important;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 1px;
        }

        .breadcrumb-item.active {
            color: #00ffff !important;
            font-weight: 600;
        }

        .breadcrumb-item + .breadcrumb-item::before {
            content: '>' !important;
            color: #ff00ff !important;
            font-weight: bold;
        }

        /* Page Title Enhancement */
        h1, h2, h3, h4, h5, h6 {
            font-family: 'Orbitron', monospace !important;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .iq-navbar h4 {
            background: linear-gradient(45deg, #00ffff, #ff00ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: titleGlow 3s ease-in-out infinite;
        }

        @keyframes titleGlow {
            0%, 100% { filter: brightness(1); }
            50% { filter: brightness(1.3) drop-shadow(0 0 10px rgba(0, 255, 255, 0.5)); }
        }

        /* Footer Enhancement */
        .footer {
            background: rgba(10, 10, 10, 0.8) !important;
            border-top: 1px solid rgba(0, 255, 255, 0.2) !important;
            color: rgba(255, 255, 255, 0.6) !important;
            position: relative;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: -1px;
            left: 0;
            width: 100%;
            height: 1px;
            background: linear-gradient(90deg, 
                transparent, 
                #00ffff, 
                #ff00ff, 
                transparent);
            animation: footerScan 6s linear infinite;
        }

        @keyframes footerScan {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        /* Modal Enhancement */
        .modal-content {
            background: rgba(10, 10, 10, 0.95) !important;
            backdrop-filter: blur(20px);
            border: 1px solid rgba(0, 255, 255, 0.3) !important;
            border-radius: 15px !important;
            overflow: hidden;
        }

        .modal-header {
            background: rgba(0, 255, 255, 0.1) !important;
            border-bottom: 1px solid rgba(0, 255, 255, 0.2) !important;
        }

        .modal-title {
            color: #00ffff !important;
            font-family: 'Orbitron', monospace !important;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .btn-close {
            filter: invert(1);
            opacity: 0.8;
        }

        .btn-close:hover {
            opacity: 1;
            transform: rotate(90deg);
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .sidebar-base {
                background: rgba(10, 10, 10, 0.98) !important;
            }
            
            h1, h2, h3, h4, h5, h6 {
                font-size: calc(1rem + 1vw);
            }
        }

        /* Pulse Animation for Active Elements */
        @keyframes neuralPulse {
            0%, 100% { 
                box-shadow: 
                    0 0 5px rgba(0, 255, 255, 0.5),
                    inset 0 0 5px rgba(0, 255, 255, 0.2);
            }
            50% { 
                box-shadow: 
                    0 0 20px rgba(0, 255, 255, 0.8),
                    inset 0 0 10px rgba(0, 255, 255, 0.4);
            }
        }

        /* Apply pulse to interactive elements */
        .btn:hover,
        .nav-link:hover,
        .card:hover {
            animation: neuralPulse 2s ease-in-out infinite;
        }
    </style>
</head>

<body class="{{ !empty(getCustomizationSetting('card_style')) ? getCustomizationSetting('card_style') : '' }} >
    <!-- Loader Start -->
    <div id="loading">
        <x-partials._body_loader />
    </div>
    <!-- Loader End -->
    <!-- Sidebar -->
    @include('backend.includes.sidebar')

    <!-- /Sidebar -->
    <div class="main-content wrapper">
        <div class="position-relative  {{ !isset($isBanner) ? 'iq-banner' : '' }} default ">
            <!-- Header -->
            @include('backend.includes.header')
            <!-- /Header -->
            @if (!isset($isBanner))
            <!-- Header Banner Start-->
                @include('components.partials.sub-header')
            <!-- Header Banner End-->
            @endif
        </div>

        <div class="conatiner-fluid content-inner pb-0" id="page_layout">

            {{-- @include('flash::message') --}}

            <!-- Errors block -->
            {{-- @include('backend.includes.errors') --}}
            <!-- / Errors block -->
            <!-- Main content block -->
            @yield('content')
            <!-- / Main content block -->
        </div>

        <!-- Footer block -->
        @include('backend.includes.footer')
        <!-- / Footer block -->

    </div>

    <!-- Modal -->
    <div class="modal fade" data-iq-modal="renderer" id="renderModal" tabindex="-1" aria-labelledby="renderModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" data-iq-modal="content">
                <div class="modal-header">
                    <h5 class="modal-title" data-iq-modal="title">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" data-iq-modal="body">
                    <p>Modal body text goes here.</p>
                </div>
            </div>
        </div>
    </div>


    @stack('before-scripts')
    @if ($isNoUISlider ?? '')
        <!-- NoUI Slider Script -->
        <script src="{{ asset('vendor/noUiSilder/script/nouislider.min.js') }}"></script>
    @endif
    <script src="{{ mix('js/backend.js') }}"></script>
    {{-- <script src="{{ mix('js/iqonic-script/setting.min.js') }}"></script> --}}
    <script src="{{ asset('js/iqonic-script/utility.js')}}"></script>
    {{-- <script src="{{ asset('js/setting-init.js') }}"></script> --}}
    <script src="{{ asset('js/app.js') }}"></script>
    <script src="{{ asset('laravel-js/modal-view.js') }}" defer></script>
    <script>
      const currencyFormat = (amount) => {
        const DEFAULT_CURRENCY = JSON.parse(@json(json_encode(Currency::getDefaultCurrency(true))))
         const noOfDecimal = DEFAULT_CURRENCY.no_of_decimal
         const decimalSeparator = DEFAULT_CURRENCY.decimal_separator
         const thousandSeparator = DEFAULT_CURRENCY.thousand_separator
         const currencyPosition = DEFAULT_CURRENCY.currency_position
         const currencySymbol = DEFAULT_CURRENCY.currency_symbol
        return formatCurrency(amount, noOfDecimal, decimalSeparator, thousandSeparator, currencyPosition, currencySymbol)
      }
      window.currencyFormat = currencyFormat
      window.defaultCurrencySymbol = @json(Currency::defaultSymbol())

    </script>

    @if (isset($assets) && (in_array('textarea', $assets) || in_array('editor', $assets)))
        <script src="{{ asset('vendor/tinymce/js/tinymce/tinymce.min.js') }}"></script>
        <script src="{{ asset('vendor/tinymce/js/tinymce/jquery.tinymce.min.js') }}"></script>
    @endif

    @stack('after-scripts')
    <!-- / Scripts -->
    <script>

        $('.notification_list').on('click',function(){
            notificationList();
        });

        $(document).on('click','.notification_data',function(event){
            event.stopPropagation();
        })

        function notificationList(type=''){
            var url = "{{ route('notification.list') }}";
            $.ajax({
                type: 'get',
                url: url,
                data: {'type':type},
                success: function(res){
                    $('.notification_data').html(res.data);
                    getNotificationCounts();
                    if(res.type == "markas_read"){
                        notificationList();
                    }
                    $('.notify_count').removeClass('notification_tag').text('');
                }
            });
        }

        function setNotification(count){
            if(Number(count) >= 100){
                $('.notify_count').text('99+');
            }
        }
        function getNotificationCounts(){
            var url = "{{ route('notification.counts') }}";

            $.ajax({
                type: 'get',
                url: url,
                success: function(res){
                    if(res.counts > 0){
                        $('.notify_count').addClass('notification_tag').text(res.counts);
                        setNotification(res.counts);
                        $('.notification_list span.dots').addClass('d-none')
                        $('.notify_count').removeClass('d-none')
                    }else{
                        $('.notify_count').addClass('d-none')
                        $('.notification_list span.dots').removeClass('d-none')
                    }

                    if(res.counts <= 0 && res.unread_total_count > 0){
                        $('.notification_list span.dots').removeClass('d-none')
                    }else{
                        $('.notification_list span.dots').addClass('d-none')
                    }
                }
            });
        }

        getNotificationCounts();
    </script>

    <script>
      {!! setting('custom_js_block') !!}

    // dark and light mode code
    const theme_mode = sessionStorage.getItem('theme_mode')
    const element = document.querySelector('html');
    if(theme_mode === null ){
        element.setAttribute('data-bs-theme', 'light')
    } else {
        document.documentElement.setAttribute('data-bs-theme', theme_mode)
    }
    </script>

</body>

</html>
