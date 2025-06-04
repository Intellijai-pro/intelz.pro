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
    <link rel="stylesheet" href="{{ asset('css/alignment-fix.css') }}">
    <link rel="stylesheet" href="{{ asset('css/premium-dashboard.css') }}">
    <link rel="stylesheet" href="{{ asset('css/icon-visibility-fix.css') }}">
    <link rel="stylesheet" href="{{ asset('css/modern-dashboard-2025.css') }}">
    <link rel="stylesheet" href="{{ asset('css/global-visibility-fix.css') }}">
    <link rel="stylesheet" href="{{ asset('css/navbar-top-fix.css') }}">
    <link rel="stylesheet" href="{{ asset('css/dashboard-top-override.css') }}">
    <link rel="stylesheet" href="{{ asset('css/navbar-absolute-top.css') }}">
    <link rel="stylesheet" href="{{ asset('css/navbar-search-center.css') }}">

    @if(request()->is('backend'))
        <link rel="stylesheet" href="{{ asset('css/alignment-fix.css') }}">
        <link rel="stylesheet" href="{{ asset('css/modern-professional-dashboard.css') }}">
        <link rel="stylesheet" href="{{ asset('css/icon-visibility-fix.css') }}">
    @endif

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

        /* Theme Variables */
        :root {
            --neural-primary: #00ffff;
            --neural-secondary: #ff00ff;
            --neural-success: #00ff00;
            --neural-warning: #ffff00;
            --neural-danger: #ff0066;
            --neural-info: #0066ff;
        }

        /* Light Mode Variables */
        [data-bs-theme="light"] {
            --neural-bg: #f5f5f5;
            --neural-bg-secondary: #ffffff;
            --neural-text: #333333;
            --neural-text-secondary: #666666;
            --neural-border: rgba(0, 0, 0, 0.1);
            --neural-glow-opacity: 0.3;
            --neural-particle-opacity: 0.5;
            --neural-overlay-opacity: 0.02;
        }

        /* Dark Mode Variables */
        [data-bs-theme="dark"] {
            --neural-bg: #0a0a0a;
            --neural-bg-secondary: #1a1a1a;
            --neural-text: #ffffff;
            --neural-text-secondary: #cccccc;
            --neural-border: rgba(255, 255, 255, 0.1);
            --neural-glow-opacity: 0.6;
            --neural-particle-opacity: 1;
            --neural-overlay-opacity: 0.05;
        }

        /* Critical visibility fixes */
        /* Fix header z-index and positioning */
        .iq-navbar {
            position: sticky !important;
            top: 0 !important;
            z-index: 1030 !important;
            background: var(--neural-bg-secondary) !important;
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--neural-border) !important;
            box-shadow: 0 2px 20px rgba(0, 255, 255, calc(var(--neural-glow-opacity) * 0.3));
            transition: all 0.3s ease;
        }

        /* Fix dropdown visibility */
        .dropdown-menu,
        .iq-sub-dropdown {
            z-index: 1055 !important;
            position: absolute !important;
            background: var(--neural-bg-secondary) !important;
            border: 1px solid var(--neural-border) !important;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3) !important;
        }

        /* Ensure sidebar is properly positioned */
        .sidebar-base {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            height: 100vh !important;
            z-index: 1025 !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
        }

        /* Fix main content positioning */
        .main-content {
            margin-left: 260px !important;
            min-height: 100vh !important;
            position: relative !important;
            z-index: 1 !important;
            margin-top: 60px !important; /* Account for fixed navbar */
        }

        .sidebar-mini .main-content {
            margin-left: 70px !important;
        }

        @media (max-width: 1199px) {
            .main-content {
                margin-left: 0 !important;
            }
        }

        /* Fix content wrapper to prevent header overlap */
        .wrapper {
            position: relative !important;
            overflow: visible !important;
        }

        /* Ensure dropdowns in header are visible */
        .navbar-nav .dropdown {
            position: relative !important;
        }

        .navbar-nav .dropdown-menu {
            position: absolute !important;
            top: calc(100% + 5px) !important;
            right: 0 !important;
            left: auto !important;
            margin-top: 0 !important;
        }

        /* Fix notification dropdown */
        .notification_list .iq-sub-dropdown,
        .iq-user-dropdown .iq-sub-dropdown {
            position: absolute !important;
            top: calc(100% + 10px) !important;
            right: 0 !important;
            left: auto !important;
            min-width: 300px !important;
            max-width: 400px !important;
            max-height: 500px !important;
            overflow-y: auto !important;
        }

        /* Fix sidebar menu items */
        .iq-sidebar-menu {
            padding: 1rem 0 !important;
        }

        .iq-sidebar-menu .nav-item {
            position: relative !important;
        }

        /* Fix submenu visibility */
        .iq-sidebar-menu .collapse,
        .iq-sidebar-menu .collapsing {
            position: relative !important;
            z-index: 10 !important;
        }

        /* Ensure content doesn't hide behind fixed header */
        .content-inner {
            padding-top: 60px !important; /* Changed from 120px to 60px */
            min-height: calc(100vh - 80px) !important; /* Adjusted calculation */
        }

        /* Push main content down for better spacing */
        .main-content {
            padding-top: 0 !important;
            margin-top: 60px !important; /* Account for fixed navbar */
        }

        /* Add extra spacing for pages with banners */
        .iq-banner + .container-fluid,
        .default + .container-fluid {
            margin-top: 20px !important; /* Changed from 50px to 20px */
        }

        /* Global page body spacing */
        .container-fluid.content-inner {
            padding-top: 70px !important; /* Changed from 140px to 70px */
            padding-bottom: 60px !important; /* Changed from 80px to 60px */
        }

        /* Ensure all first elements have proper spacing */
        .content-inner > *:first-child {
            margin-top: 0 !important;
        }

        /* Page header spacing */
        .page-header,
        .page-title-box {
            padding: 20px 0 !important; /* Changed from 40px to 20px */
            margin-bottom: 20px !important; /* Changed from 40px to 20px */
        }

        /* Extra spacing after navbar */
        .iq-navbar {
            margin-bottom: 0 !important; /* Changed from 70px since navbar is fixed */
            box-shadow: 0 2px 20px rgba(0, 255, 255, calc(var(--neural-glow-opacity) * 0.3));
        }

        /* Force minimum height for spacious feel */
        body {
            background: var(--neural-bg) !important;
            font-family: 'Rajdhani', sans-serif !important;
            color: var(--neural-text) !important;
            position: relative;
            overflow-x: hidden;
            transition: all 0.3s ease;
            min-height: 100vh;
            padding-top: 0 !important; /* Changed from 80px to position navbar at top */
        }

        /* Animated Background - Only in Dark Mode */
        [data-bs-theme="dark"] body::before {
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

        /* Grid Overlay - Adjusted opacity for both modes */
        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 200%;
            height: 200%;
            background-image: 
                linear-gradient(rgba(0, 255, 255, var(--neural-overlay-opacity)) 1px, transparent 1px),
                linear-gradient(90deg, rgba(0, 255, 255, var(--neural-overlay-opacity)) 1px, transparent 1px);
            background-size: 100px 100px;
            animation: gridSlide 60s linear infinite;
            z-index: -1;
            pointer-events: none;
        }

        @keyframes gridSlide {
            0% { transform: translate(0, 0); }
            100% { transform: translate(-100px, -100px); }
        }

        /* Sidebar Glow Effect - Only in Dark Mode */
        [data-bs-theme="dark"] .sidebar-base::before {
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
                var(--neural-primary), 
                transparent
            );
            opacity: var(--neural-glow-opacity);
        }

        .navbar-brand {
            display: inline-block;
            transition: all 0.3s ease;
        }

        .navbar-brand:hover {
            filter: drop-shadow(0 0 10px rgba(0, 255, 255, var(--neural-glow-opacity)));
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

        [data-bs-theme="light"] .sidebar-toggle {
            background: rgba(0, 255, 255, 0.05) !important;
            border: 1px solid rgba(0, 255, 255, 0.2) !important;
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
            border-color: var(--neural-primary) !important;
            box-shadow: 0 0 15px rgba(0, 255, 255, var(--neural-glow-opacity));
        }

        /* Menu Items Enhancement */
        .iq-main-menu .nav-link {
            color: var(--neural-text) !important;
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
            background: linear-gradient(90deg, var(--neural-primary), var(--neural-secondary));
            transition: width 0.3s ease;
        }

        .iq-main-menu .nav-link:hover::before,
        .iq-main-menu .nav-link.active::before {
            width: 100%;
        }

        .iq-main-menu .nav-link:hover,
        .iq-main-menu .nav-link.active {
            color: var(--neural-primary) !important;
            background: rgba(0, 255, 255, 0.1) !important;
            padding-left: 25px;
            box-shadow: 
                inset 0 0 20px rgba(0, 255, 255, 0.1),
                0 0 10px rgba(0, 255, 255, var(--neural-glow-opacity));
        }

        .iq-main-menu .nav-link svg,
        .iq-main-menu .nav-link i {
            color: var(--neural-primary) !important;
            filter: drop-shadow(0 0 3px currentColor);
            transition: all 0.3s ease;
            font-size: 20px;
            margin-right: 10px;
        }

        .iq-main-menu .nav-link:hover svg,
        .iq-main-menu .nav-link:hover i {
            transform: scale(1.2) rotate(10deg);
        }

        /* Footer Enhancement */
        .footer {
            background: var(--neural-bg-secondary) !important;
            border-top: 1px solid var(--neural-border) !important;
            color: var(--neural-text-secondary) !important;
            position: relative;
        }

        /* Modal Enhancement */
        .modal-content {
            background: var(--neural-bg-secondary) !important;
            backdrop-filter: blur(20px);
            border: 1px solid var(--neural-border) !important;
            border-radius: 15px !important;
            overflow: hidden;
            color: var(--neural-text) !important;
        }

        .modal-header {
            background: rgba(0, 255, 255, 0.05) !important;
            border-bottom: 1px solid var(--neural-border) !important;
        }

        .modal-title {
            color: var(--neural-primary) !important;
            font-family: 'Orbitron', monospace !important;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* Button Close - Theme Aware */
        [data-bs-theme="dark"] .btn-close {
            filter: invert(1);
            opacity: 0.8;
        }

        .btn-close:hover {
            opacity: 1;
            transform: rotate(90deg);
        }

        /* Forms - Theme Aware */
        .form-control, .form-select {
            background: rgba(0, 255, 255, 0.05) !important;
            border: 1px solid rgba(0, 255, 255, 0.2) !important;
            color: var(--neural-text) !important;
            transition: all 0.3s ease;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(0, 255, 255, 0.08) !important;
            border-color: var(--neural-primary) !important;
            box-shadow: 0 0 15px rgba(0, 255, 255, var(--neural-glow-opacity)) !important;
            color: var(--neural-text) !important;
        }

        /* Cards - Theme Aware */
        .card {
            background: var(--neural-bg-secondary) !important;
            border: 1px solid var(--neural-border) !important;
            color: var(--neural-text) !important;
            transition: all 0.3s ease;
        }

        [data-bs-theme="dark"] .card {
            background: rgba(10, 10, 10, 0.8) !important;
            backdrop-filter: blur(20px);
            border: 1px solid rgba(0, 255, 255, 0.3) !important;
        }

        /* Tables - Theme Aware */
        .table {
            color: var(--neural-text) !important;
        }

        .table thead th {
            color: var(--neural-primary) !important;
            border-color: var(--neural-border) !important;
        }

        .table tbody td {
            color: var(--neural-text) !important;
            border-color: var(--neural-border) !important;
        }

        /* Pulse Animation for Active Elements */
        @keyframes neuralPulse {
            0%, 100% { 
                box-shadow: 
                    0 0 5px rgba(0, 255, 255, var(--neural-glow-opacity)),
                    inset 0 0 5px rgba(0, 255, 255, 0.2);
            }
            50% { 
                box-shadow: 
                    0 0 20px rgba(0, 255, 255, var(--neural-glow-opacity)),
                    inset 0 0 10px rgba(0, 255, 255, 0.4);
            }
        }

        /* Apply pulse to interactive elements - only in dark mode */
        [data-bs-theme="dark"] .btn:hover,
        [data-bs-theme="dark"] .nav-link:hover,
        [data-bs-theme="dark"] .card:hover {
            animation: neuralPulse 2s ease-in-out infinite;
        }

        /* Light mode specific adjustments */
        [data-bs-theme="light"] .btn-primary {
            background: linear-gradient(45deg, var(--neural-primary), var(--neural-secondary)) !important;
            border: none !important;
            color: #000 !important;
        }

        [data-bs-theme="light"] .card:hover {
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            transform: translateY(-2px);
        }

        /* Extra push for main wrapper */
        .wrapper {
            padding-top: 0 !important; /* Changed from 50px */
        }

        /* Responsive spacing adjustments */
        @media (max-width: 768px) {
            .content-inner {
                padding-top: 40px !important; /* Changed from 80px to 40px */
            }
            
            .container-fluid.content-inner {
                padding-top: 50px !important; /* Changed from 100px to 50px */
                padding-bottom: 40px !important; /* Changed from 60px to 40px */
            }
            
            .page-header,
            .page-title-box {
                padding: 15px 0 !important; /* Changed from 30px to 15px */
                margin-bottom: 15px !important; /* Changed from 30px to 15px */
            }
            
            .iq-navbar {
                margin-bottom: 0 !important;
            }
            
            .wrapper {
                padding-top: 0 !important;
            }
        }
    </style>
    
    <!-- Push all content up override -->
    <style>
        /* Global positioning - 15% down from top of viewport */
        /* 15vh = 15% of viewport height */
        html body .main-content {
            margin-top: calc(70px + 15vh) !important; /* 70px for navbar + 15% viewport height */
            padding-top: 0 !important;
        }
        
        html body .content-inner,
        html body #page_layout {
            padding-top: 15px !important;
        }
        
        /* Remove any extra spacing */
        html body .wrapper {
            padding-top: 0 !important;
        }
        
        html body .position-relative.iq-banner,
        html body .position-relative.default {
            margin-top: 0 !important;
            padding-top: 0 !important;
        }
        
        /* First children have no margin */
        html body .content-inner > *:first-child {
            margin-top: 0 !important;
        }
        
        /* Dashboard specific */
        html body .dashboard-container {
            margin-top: 0 !important;
            padding-top: 0 !important;
        }
        
        /* Add 15% viewport height spacing from top */
        @media (max-width: 768px) {
            html body .main-content {
                margin-top: calc(60px + 15vh) !important; /* Adjusted for mobile */
            }
        }
        
        /* Force navbar to absolute top position */
        html body .iq-navbar,
        html body header.iq-navbar,
        html body nav.iq-navbar {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
            z-index: 9999 !important;
            margin: 0 !important;
            transform: none !important;
        }
        
        /* Center search bar in navbar */
        html body .modern-search-container {
            position: absolute !important;
            left: 50% !important;
            transform: translateX(-50%) !important;
            top: 50% !important;
            transform: translate(-50%, -50%) !important;
            width: 100% !important;
            max-width: 500px !important;
            margin: 0 !important;
            z-index: 10 !important;
        }
        
        /* Ensure navbar has relative positioning for absolute children */
        html body .iq-navbar .container-fluid,
        html body .iq-navbar .navbar-inner {
            position: relative !important;
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            height: 100% !important;
        }
        
        /* Keep other navbar elements in proper position */
        html body .iq-navbar .navbar-brand,
        html body .iq-navbar .sidebar-toggle {
            position: relative !important;
            z-index: 11 !important;
        }
        
        html body .iq-navbar .right-data {
            position: relative !important;
            z-index: 11 !important;
            margin-left: auto !important;
        }
        
        /* Hide search on mobile */
        @media (max-width: 768px) {
            html body .modern-search-container {
                display: none !important;
            }
        }
    </style>
</head>

<body class="{{ !empty(getCustomizationSetting('card_style')) ? getCustomizationSetting('card_style') : '' }} >
    <script>
        // Immediate fix for dashboard spacing
        (function() {
            var currentPath = window.location.pathname;
            // Only apply fix on dashboard or backend pages
            if (currentPath.includes('/backend') || currentPath.includes('/dashboard') || currentPath === '/' || currentPath === '') {
                document.addEventListener('DOMContentLoaded', function() {
                    // Find and hide the banner wrapper if it doesn't have iq-banner class
                    var bannerWrappers = document.querySelectorAll('.position-relative.default');
                    bannerWrappers.forEach(function(wrapper) {
                        if (!wrapper.classList.contains('iq-banner')) {
                            wrapper.style.display = 'none';
                        }
                    });
                    
                    // Ensure content starts at top
                    var contentInner = document.querySelector('.content-inner');
                    if (contentInner) {
                        contentInner.style.paddingTop = '1rem';
                    }
                });
            }
        })();
    </script>
    
    <style>
        /* Force extra spacing at body level */
        body {
            padding-top: 0 !important;
        }
        
        /* Ensure no element can override the minimum spacing */
        .main-content .content-inner {
            min-height: 600px !important;
            padding-top: 60px !important; /* Changed from 120px to 60px */
        }
        
        /* Dashboard gets minimal space - right under navbar */
        body.dashboard-page .content-inner,
        .dashboard-container,
        body:has(.dashboard-container) .content-inner,
        body:has(.modern-dashboard) .content-inner,
        body:has(.welcome-section) .content-inner {
            padding-top: 15px !important; /* Changed from 20px to 15px */
            min-padding-top: 15px !important; /* Changed from 20px to 15px */
        }
        
        /* Force all pages to respect the spacing */
        @media screen and (min-width: 769px) {
            #page_layout {
                padding-top: 60px !important; /* Changed from 120px to 60px */
            }
            
            /* Dashboard override */
            #page_layout:has(.dashboard-container),
            #page_layout:has(.modern-dashboard),
            #page_layout:has(.welcome-section) {
                padding-top: 15px !important; /* Changed from 20px to 15px */
            }
        }
        
        /* Additional forced spacing for non-dashboard pages */
        .content-inner > div:first-child,
        .content-inner > section:first-child {
            margin-top: 15px !important; /* Changed from 30px to 15px */
        }
        
        /* Dashboard first elements have no margin */
        .dashboard-container > *:first-child,
        .welcome-section,
        .content-inner:has(.dashboard-container) > div:first-child {
            margin-top: 0 !important;
        }
    </style>
    
    <!-- Loader Start -->
    <div id="loading">
        <x-partials._body_loader />
    </div>
    <!-- Loader End -->
    <!-- Sidebar -->
    @include('backend.includes.sidebar')

    <!-- /Sidebar -->
    <div class="main-content wrapper">
        <div class="position-relative  {{ ($isBanner ?? true) ? 'iq-banner' : '' }} default ">
            <!-- Header -->
            @include('backend.includes.header')
            <!-- /Header -->
            @if ($isBanner ?? true)
            <!-- Header Banner Start-->
                @include('components.partials.sub-header')
            <!-- Header Banner End-->
            @endif
        </div>

        <div class="container-fluid content-inner pb-0" id="page_layout">

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
    <script src="{{ asset('js/menu-visibility-fix.js') }}"></script>
    <script src="{{ asset('js/navbar-search-center.js') }}"></script>
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
    const theme_mode = sessionStorage.getItem('theme_mode') || localStorage.getItem('theme') || 'light'
    const element = document.querySelector('html');
    
    // Set theme based on user preference
    element.setAttribute('data-bs-theme', theme_mode)
    sessionStorage.setItem('theme_mode', theme_mode)
    </script>

</body>

</html>
