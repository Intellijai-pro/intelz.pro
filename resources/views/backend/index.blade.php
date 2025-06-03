@extends('backend.layouts.app', ['isBanner' => false])

@section('title')
{{ 'Neural Command Center' }}
@endsection

@push('after-styles')
<style>
    /* Futuristic Dashboard Styles */
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700;900&family=Rajdhani:wght@300;400;500;600;700&display=swap');

    /* Override default theme */
    body {
        background: #0a0a0a !important;
        font-family: 'Rajdhani', sans-serif !important;
        color: #fff !important;
    }

    .wrapper {
        background: #0a0a0a !important;
    }

    /* Animated Background */
    .content-inner {
        position: relative;
        background: transparent !important;
    }

    .content-inner::before {
        content: '';
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: 
            radial-gradient(circle at 20% 50%, rgba(120, 255, 255, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 80% 50%, rgba(255, 120, 255, 0.1) 0%, transparent 50%),
            radial-gradient(circle at 50% 50%, rgba(120, 120, 255, 0.05) 0%, transparent 70%);
        animation: backgroundPulse 10s ease-in-out infinite;
        z-index: -2;
        pointer-events: none;
    }

    /* Grid Pattern */
    .content-inner::after {
        content: '';
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: 
            linear-gradient(rgba(0, 255, 255, 0.03) 1px, transparent 1px),
            linear-gradient(90deg, rgba(0, 255, 255, 0.03) 1px, transparent 1px);
        background-size: 50px 50px;
        z-index: -1;
        animation: gridMove 20s linear infinite;
        pointer-events: none;
    }

    @keyframes backgroundPulse {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.8; }
    }

    @keyframes gridMove {
        0% { transform: translate(0, 0); }
        100% { transform: translate(50px, 50px); }
    }

    /* Futuristic Cards */
    .card {
        background: rgba(10, 10, 10, 0.8) !important;
        backdrop-filter: blur(20px);
        border: 1px solid rgba(0, 255, 255, 0.3) !important;
        border-radius: 15px !important;
        position: relative;
        overflow: hidden;
        transition: all 0.3s ease;
    }

    .card::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 2px;
        background: linear-gradient(90deg, transparent, #00ffff, transparent);
        animation: cardScan 4s linear infinite;
    }

    @keyframes cardScan {
        0% { left: -100%; }
        100% { left: 100%; }
    }

    .card:hover {
        border-color: #00ffff !important;
        box-shadow: 
            0 0 30px rgba(0, 255, 255, 0.3),
            inset 0 0 15px rgba(0, 255, 255, 0.1) !important;
        transform: translateY(-2px);
    }

    .card-body {
        background: transparent !important;
        position: relative;
        z-index: 1;
    }

    /* Stat Cards */
    .card-height .content p {
        color: #00ffff !important;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-weight: 500;
        margin-bottom: 10px;
    }

    .card-height .counter {
        font-family: 'Orbitron', monospace !important;
        font-size: 36px !important;
        font-weight: 900 !important;
        background: linear-gradient(45deg, #00ffff, #ff00ff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: counterGlow 3s ease-in-out infinite;
    }

    @keyframes counterGlow {
        0%, 100% { filter: brightness(1); }
        50% { filter: brightness(1.3); }
    }

    /* Icon Styling */
    .card-icon-40 {
        width: 50px !important;
        height: 50px !important;
        background: rgba(0, 255, 255, 0.1) !important;
        border: 1px solid rgba(0, 255, 255, 0.3) !important;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        overflow: hidden;
    }

    .card-icon-40::before {
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

    .card:hover .card-icon-40::before {
        width: 100px;
        height: 100px;
    }

    .card-icon-40 i {
        color: #00ffff !important;
        font-size: 24px !important;
        position: relative;
        z-index: 1;
        filter: drop-shadow(0 0 5px currentColor);
    }

    /* Chart Cards */
    h3 {
        font-family: 'Orbitron', monospace !important;
        color: #00ffff !important;
        font-size: 20px !important;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    /* Buttons */
    .btn-primary {
        background: linear-gradient(45deg, #00ffff, #ff00ff) !important;
        border: none !important;
        color: #000 !important;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
        position: relative;
        overflow: hidden;
        transition: all 0.3s ease;
    }

    .btn-primary::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
        transition: left 0.5s ease;
    }

    .btn-primary:hover::before {
        left: 100%;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 20px rgba(0, 255, 255, 0.5) !important;
    }

    /* Forms */
    .form-control {
        background: rgba(0, 255, 255, 0.05) !important;
        border: 1px solid rgba(0, 255, 255, 0.2) !important;
        color: #fff !important;
        transition: all 0.3s ease;
    }

    .form-control:focus {
        background: rgba(0, 255, 255, 0.08) !important;
        border-color: #00ffff !important;
        box-shadow: 0 0 15px rgba(0, 255, 255, 0.3) !important;
        color: #fff !important;
    }

    /* Alert Cards */
    .alert-warning {
        background: rgba(255, 200, 0, 0.1) !important;
        border: 1px solid rgba(255, 200, 0, 0.3) !important;
        color: #ffc800 !important;
        animation: warningPulse 2s ease-in-out infinite;
    }

    @keyframes warningPulse {
        0%, 100% { box-shadow: 0 0 10px rgba(255, 200, 0, 0.3); }
        50% { box-shadow: 0 0 20px rgba(255, 200, 0, 0.5); }
    }

    .alert-warning .btn-warning {
        background: #ffc800 !important;
        border: none !important;
        color: #000 !important;
    }

    /* Mini Chart Containers */
    #total-users, #total-generated-word, #total-active-subscriptions, 
    #total-images-generated, #total-ai-writer, #ai-art-generated, 
    #ai-code, #ai-images, #ai-chat, #total-revenue {
        height: 60px;
        margin: 15px 0;
        position: relative;
    }

    /* Table Styling */
    .table {
        background: transparent !important;
        color: #fff !important;
    }

    .table thead tr {
        background: rgba(0, 255, 255, 0.1) !important;
        border-bottom: 2px solid rgba(0, 255, 255, 0.3);
    }

    .table thead th {
        color: #00ffff !important;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-size: 12px;
        border: none !important;
        padding: 15px;
    }

    .table tbody tr {
        border-bottom: 1px solid rgba(0, 255, 255, 0.1);
        transition: all 0.3s ease;
    }

    .table tbody tr:hover {
        background: rgba(0, 255, 255, 0.05) !important;
        box-shadow: 0 0 20px rgba(0, 255, 255, 0.2);
    }

    .table tbody td {
        border: none !important;
        padding: 15px;
        color: #fff !important;
    }

    /* Status Badge */
    .btn-success-subtle {
        background: rgba(0, 255, 0, 0.2) !important;
        color: #00ff00 !important;
        border: 1px solid rgba(0, 255, 0, 0.3) !important;
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    /* Avatar */
    .avatar {
        border: 2px solid rgba(0, 255, 255, 0.3);
        box-shadow: 0 0 10px rgba(0, 255, 255, 0.3);
    }

    /* Dropdown */
    .dropdown-menu {
        background: rgba(10, 10, 10, 0.95) !important;
        border: 1px solid rgba(0, 255, 255, 0.3) !important;
        backdrop-filter: blur(20px);
    }

    .dropdown-item {
        color: #fff !important;
        transition: all 0.3s ease;
    }

    .dropdown-item:hover {
        background: rgba(0, 255, 255, 0.2) !important;
        color: #00ffff !important;
    }

    /* Chart styling */
    .apexcharts-text {
        fill: #fff !important;
    }

    .apexcharts-gridline {
        stroke: rgba(0, 255, 255, 0.1) !important;
    }

    /* Percentage indicators */
    .text-success {
        color: #00ff00 !important;
        filter: drop-shadow(0 0 3px currentColor);
    }

    /* Loading indicators */
    #userchart_loader, #popular_loader, #revenue_loader, #subscription_loader {
        color: #00ffff;
        text-align: center;
        padding: 20px;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    /* Scan line effect for dashboard */
    .dashboard-scan {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        height: 3px;
        background: linear-gradient(90deg, transparent, #00ffff, transparent);
        animation: dashboardScan 5s linear infinite;
        z-index: 9999;
        pointer-events: none;
    }

    @keyframes dashboardScan {
        0% { top: 0; }
        100% { top: 100%; }
    }

    /* Holographic effect for headers */
    .holographic-text {
        background: linear-gradient(45deg, #00ffff, #ff00ff, #00ffff);
        background-size: 200% 200%;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: holographicShift 3s ease infinite;
    }

    @keyframes holographicShift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }
</style>
@endpush

@section('content')
<!-- Dashboard Scan Line -->
<div class="dashboard-scan"></div>

<div class="row">
    <div class="col-12">
        
        <!-- Alert Section -->
        <div class="row">
        @if($data['cutout_pro_limit_over']==1)
          <div class="col-12">
            <div id="cutout_pro" class="alert alert-warning">
                <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap">
                   <span><i class="ph ph-warning-circle me-2"></i>SYSTEM ALERT: Cutout.pro balance critical. Recharge required for continued operations.</span>
                   <button onclick="Upgradeplan('cutout_pro')" class="btn btn-warning">ACKNOWLEDGE</button>
                </div>
            </div>
          </div>
        @endif

        @if($data['open_ai_limit_over']==1)
           <div class="col-12">
                <div id="open_ai" class="alert alert-warning">
                    <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap">
                        <span><i class="ph ph-warning-circle me-2"></i>SYSTEM ALERT: OpenAI neural link depleted. Immediate recharge required.</span>
                        <button onclick="Upgradeplan('open_ai')" class="btn btn-warning">ACKNOWLEDGE</button>
                    </div>    
                </div>
           </div>
        @endif

        @if($data['picsart_limit_over']==1)
            <div class="col-12">
               <div id="picsart" class="alert alert-warning">
                    <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap">
                        <span><i class="ph ph-warning-circle me-2"></i>SYSTEM ALERT: Picsart integration offline. Balance restoration needed.</span>
                        <button onclick="Upgradeplan('picsart')" class="btn btn-warning">ACKNOWLEDGE</button>
                    </div>    
                </div>
            </div>
        @endif
        </div>

        <!-- Stats Grid -->
        <div class="row row-cols-xl-5 row-cols-md-3 row-cols-sm-2 row-cols-1">
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between flex-wrap">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Neural Connections') }}</p>
                                <h1 class="counter">{{$data['totalUsersCount']}}</h1>
                            </div>
                            <div class="icon flex-shrink-0">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-users font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-users"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageUsers']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('GROWTH RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Data Processed') }}</p>
                                <h1 class="counter">{{$data['totalWordCount']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-textbox font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-generated-word"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageWordCountLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('PROCESSING RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Active Protocols') }}</p>
                                <h1 class="counter">{{$data['activeSubscriptionCount']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-currency-circle-dollar font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-active-subscriptions"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['lastMothsubsctiption']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('ACTIVATION RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Visual Data') }}</p>
                                <h1 class="counter">{{$data['totalImageCount']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-images font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-images-generated"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageImageCountLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('RENDER RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('AI Writers') }}</p>
                                <h1 class="counter">{{$data['totalAIwriter']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-pen font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-ai-writer"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageAIwriterLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('GENERATION RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Art Matrix') }}</p>
                                <h1 class="counter">{{$data['totalAIart']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-palette font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-art-generated"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageAIartLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('CREATION RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Code Forge') }}</p>
                                <h1 class="counter">{{$data['totalAIcode']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-file-code font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-code"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageAIcodeLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('COMPILE RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Image Core') }}</p>
                                <h1 class="counter">{{$data['totalAIimage']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-image font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-images"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageAIimageLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('PROCESS RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Neural Chat') }}</p>
                                <h1 class="counter">{{$data['totalAIchat']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-chat-circle-text font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-chat"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentageAIchatLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('RESPONSE RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1">{{ __('Credits Flow') }}</p>
                                <h1 class="counter">{{Currency::format($data['totalRevenue'])}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle">
                                    <i class="ph ph-hand-coins font-size-20"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-revenue"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14">+{{$data['percentagerevenueLastMonth']}}%</span>
                                <span class="text-capitalize font-size-14" style="color: #888;">{{ __('INCOME RATE') }}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ... existing code below ... -->
        <div class="row">
            <div class="col-md-12">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize holographic-text">{{ __('REVENUE ANALYTICS') }}</h3>
                            <div class="d-flex flex-wrap gap-3">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="revenue_date_range" value="{{ session('revenue_date_range') }}" id="revenuedateRangeInput" class="form-control revenue-date-range" placeholder="Select Date Range" readonly="readonly">
        
                                    <button id="refreshRevenuechart" class="btn btn-primary">
                                       <i class="ph ph-arrow-counter-clockwise"></i>
                                    </button>
                                </div>
                                <div class="dropdown">
                                    <a href="#" class="btn btn-primary dropdown-toggle total_revenue text-capitalize" id="dropdownTotalUsers3" data-bs-toggle="dropdown" aria-expanded="false">
                                        {{ __('TEMPORAL RANGE') }}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers3">
                                        <li><a class="revenue-dropdown-item dropdown-item" data-type="year">{{ __('ANNUAL CYCLE') }}</a></li>
                                        <li><a class="revenue-dropdown-item dropdown-item" data-type="month">{{ __('MONTHLY CYCLE') }}</a></li>
                                        <li><a class="revenue-dropdown-item dropdown-item" data-type="week">{{ __('WEEKLY CYCLE') }}</a></li>
                                    </ul>
                                </div>
                            </div>
    
                        </div>
                        <div id="revenue_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">PROCESSING DATA STREAM...</p>
                            </div>
                        </div>
                        <div id="total-revenue-chart" class="total-revenue-chart"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize">{{ __('USER MATRIX') }}</h3>
                            <div class="d-inline-flex align-items-center gap-3 flex-wrap">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="date_range" value="{{ session('date_range') }}" id="dateRangeInput" class="form-control user-date-range" placeholder="Select Date Range" readonly="readonly">
    
                                    <button id="refreshUserchart" class="btn btn-primary"><i class="ph ph-arrow-counter-clockwise"></i></button>
                                </div>
    
    
                                <div class="flex-shrink-0">
    
                                    <div class="d-flex align-items-center gap-1">
                                        <span class="text-capitalize" style="color: #00ffff;">{{ __('TOTAL NODES') }}</span>
                                        <h6 class="m-0 holographic-text" id="chart_newUsers">{{$data['chart_newUsers']}}
                                            <h6>
                                    </div>
                                    <div class="d-flex align-items-center gap-1">
                                        <span class="text-capitalize" style="color: #ff00ff;">{{ __('ACTIVE NODES') }}</span>
                                        <h6 class="m-0 holographic-text" id="chart_activeUsers">{{$data['chart_activeUsers']}}
                                            <h6>
                                    </div>
                                </div>
                                <div class="flex-shrink-0">
                                    <div class="dropdown">
                                        <a href="#" class="btn btn-primary dropdown-toggle total_users text-capitalize" id="dropdownTotalUsers1" data-bs-toggle="dropdown" aria-expanded="false">
                                            {{ __('TIME FRAME') }}
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers1">
                                            <li><a class="user-dropdown-item dropdown-item" data-type="year"> {{ __('ANNUAL') }}</a></li>
                                            <li><a class="user-dropdown-item dropdown-item" data-type="month"> {{ __('MONTHLY') }}</a></li>
                                            <li><a class="user-dropdown-item dropdown-item" data-type="week"> {{ __('WEEKLY') }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
    
                        </div>
                        <div id="userchart_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">ANALYZING USER PATTERNS...</p>
                            </div>
                        </div>
    
                        <div id="user-chart" class="user-chart"> </div>

                         <div id="user_chart_graph" class="user_chart_graph"> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize">{{ __('CONTENT ANALYTICS') }}</h3>

                            <div class="d-flex flex-wrap gap-3">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="content_date_range" value="{{ session('content_date_range') }}" id="contentdateRangeInput" class="form-control content-date-range" placeholder="Select Date Range" readonly="readonly">
        
                                    <button id="refreshContentchart" class="btn btn-primary"><i class="ph ph-arrow-counter-clockwise"></i></button>
                                </div>
                                <div class="dropdown">
                                    <a href="#" class="btn btn-primary dropdown-toggle popular_content text-capitalize" id="dropdownTotalUsers2" data-bs-toggle="dropdown" aria-expanded="false">
                                        {{ __('ANALYSIS PERIOD') }}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers2">
                                        <li><a class="popular-dropdown-item dropdown-item" data-type="year">{{ __('ANNUAL DATA') }}</a></li>
                                        <li><a class="popular-dropdown-item dropdown-item" data-type="month">{{ __('MONTHLY DATA') }}</a></li>
                                        <li><a class="popular-dropdown-item dropdown-item" data-type="week"> {{ __('WEEKLY DATA') }}</a></li>
                                    </ul>
                                </div>
                            </div>
    
                        </div>
                        <div id="popular_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">SCANNING CONTENT MATRIX...</p>
                            </div>
                        </div>
                        <div id="popular-content" class="popular-content"></div>
                          <div id="popular_content_data" class="popular_content_data"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize">{{ __('SUBSCRIPTION PROTOCOLS') }}</h3>
    
                            <div class="d-flex flex-wrap gap-3">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="subscription_range" value="{{ session('subscription_range') }}" id="subscriptionRangeInput" class="form-control subscription-date-range" placeholder="Select Date Range" readonly="readonly">
        
                                    <button id="refreshSubscriptionchart" class="btn btn-primary d-none"><i class="ph ph-arrow-counter-clockwise"></i></button>
                                </div>
        
                                <div class="flex-shrink-0">
                                    <div class="dropdown">
                                        <a href="#" class="btn btn-primary dropdown-toggle subscription text-capitalize" id="dropdownTotalUsers4" data-bs-toggle="dropdown" aria-expanded="false">
                                            {{ __('TIME WINDOW') }}
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers4">
                                            <li><a class="subscription-dropdown-item  dropdown-item" data-type="year">{{ __('YEARLY VIEW') }}</a></li>
                                            <li><a class="subscription-dropdown-item  dropdown-item" data-type="month">{{ __('MONTHLY VIEW') }}</a></li>
                                            <li><a class="subscription-dropdown-item  dropdown-item" data-type="week">{{ __('WEEKLY VIEW') }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
    
                        </div>
                        <div id="subscription_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">LOADING SUBSCRIPTION DATA...</p>
                            </div>
                        </div>
                      <div id="subscription_data" class="subscription_data"></div>
                        <div id="subscription" class="subscription"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card card-height">
                    <div class="card-body">
                        <h3 class="text-capitalize mb-5">{{ __('TRANSACTION LOG') }}</h3>
                        <div class="table-responsive card-height-table">
                            <table id="datatable" class="table table-striped table-hover transaction_history_table dataTable">
                                <thead>
                                    <tr class="bg-body">
                                        <th>
                                            <h6 class="m-0">{{ __('USER ID') }}</h6>
                                        </th>
                                        <th>
                                            <h6 class="m-0">{{ __('PROTOCOL') }}</h6>
                                        </th>
    
                                        <th>
                                            <h6 class="m-0">{{ __('CREDITS') }}</h6>
                                        </th>
    
                                        <th>
                                            <h6 class="m-0">{{ __('TIMESTAMP') }}</h6>
                                        </th>
                                        <th>
                                            <h6 class="m-0">{{ __('STATUS') }}</h6>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($data['transactionHistory'] as $transaction)
                                    <tr>
                                        <td>
                                            <div class="d-flex gap-3 align-items-center">
                                                <img src="{{ optional(optional($transaction->subscription)->user)->profile_image ?? default_user_avatar() }}" alt="avatar" class="avatar avatar-40 rounded-pill">
                                                <div class="text-start">
                                                    <h6 class="m-0" style="color: #00ffff;">{{ optional(optional($transaction->subscription)->user)->full_name ?? default_user_name() }}</h6>
                                                    <span style="color: #888; font-size: 12px;">{{ optional(optional($transaction->subscription)->user)->email ?? '--' }}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span style="color: #ff00ff;">{{ optional(optional($transaction->subscription)->plan)->name ?? null }}</span></td>
                                        <td><span class="holographic-text">{{ Currency::format($transaction->amount) }}</span></td>
                                        <td><span style="color: #888; font-size: 12px;">{{ $transaction->created_at }}</span></td>
                                        <td><span class="btn btn-sm btn-success-subtle pe-none">ACTIVE</span></td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


@endsection

@push('after-scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.40.0/apexcharts.min.js" integrity="sha512-Kr1p/vGF2i84dZQTkoYZ2do8xHRaiqIa7ysnDugwoOcG0SbIx98erNekP/qms/hBDiBxj336//77d0dv53Jmew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    // Override ApexCharts default colors for futuristic theme
    window.Apex = {
        chart: {
            foreColor: '#fff',
            toolbar: {
                show: false
            }
        },
        grid: {
            borderColor: 'rgba(0, 255, 255, 0.1)'
        },
        colors: ['#00ffff', '#ff00ff', '#00ff00', '#ffff00', '#ff0066', '#0066ff'],
        theme: {
            mode: 'dark'
        },
        tooltip: {
            theme: 'dark',
            style: {
                fontSize: '12px',
                fontFamily: 'Rajdhani, sans-serif'
            },
            fillSeriesColor: false,
            onDatasetHover: {
                highlightDataSeries: true,
            },
            x: {
                show: true,
                formatter: function(val) {
                    return val;
                }
            },
            y: {
                formatter: function(val) {
                    return val;
                }
            }
        }
    };

    // Mini chart configurations with futuristic colors
    const miniChartOptions = {
        chart: {
            type: 'area',
            sparkline: {
                enabled: true
            },
            height: 60
        },
        stroke: {
            curve: 'smooth',
            width: 2
        },
        fill: {
            type: 'gradient',
            gradient: {
                shadeIntensity: 1,
                opacityFrom: 0.4,
                opacityTo: 0.1,
                stops: [0, 90, 100]
            }
        },
        colors: ['#00ffff'],
        tooltip: {
            enabled: false
        }
    };

    // Initialize mini charts for stat cards
    @if(isset($data['last_month_user_graph_data']) && count($data['last_month_user_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-users"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_user_graph_data'])
        }]
    }).render();
    @endif

    @if(isset($data['last_month_word_graph_data']) && count($data['last_month_word_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-generated-word"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_word_graph_data'])
        }],
        colors: ['#ff00ff']
    }).render();
    @endif

    @if(isset($data['last_month_subscription_graph_data']) && count($data['last_month_subscription_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-active-subscriptions"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_subscription_graph_data'])
        }],
        colors: ['#00ff00']
    }).render();
    @endif

    @if(isset($data['last_month_image_graph_data']) && count($data['last_month_image_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-images-generated"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_image_graph_data'])
        }],
        colors: ['#ffff00']
    }).render();
    @endif

    @if(isset($data['last_month_ai_writer_graph_data']) && count($data['last_month_ai_writer_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-ai-writer"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_writer_graph_data'])
        }],
        colors: ['#ff0066']
    }).render();
    @endif

    @if(isset($data['last_month_ai_art_graph_data']) && count($data['last_month_ai_art_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-art-generated"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_art_graph_data'])
        }],
        colors: ['#0066ff']
    }).render();
    @endif

    @if(isset($data['last_month_ai_code_graph_data']) && count($data['last_month_ai_code_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-code"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_code_graph_data'])
        }],
        colors: ['#00ffff']
    }).render();
    @endif

    @if(isset($data['last_month_ai_image_graph_data']) && count($data['last_month_ai_image_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-images"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_image_graph_data'])
        }],
        colors: ['#ff00ff']
    }).render();
    @endif

    @if(isset($data['last_month_ai_chat_graph_data']) && count($data['last_month_ai_chat_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-chat"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_chat_graph_data'])
        }],
        colors: ['#00ff00']
    }).render();
    @endif

    @if(isset($data['last_month_revenue_graph_data']) && count($data['last_month_revenue_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-revenue"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_revenue_graph_data'])
        }],
        colors: ['#ffff00']
    }).render();
    @endif

    // Counter animation
    document.querySelectorAll('.counter').forEach(counter => {
        const target = parseInt(counter.innerText.replace(/[^0-9]/g, ''));
        const duration = 2000;
        const increment = target / (duration / 16);
        let current = 0;
        
        const updateCounter = () => {
            current += increment;
            if (current < target) {
                counter.innerText = Math.floor(current).toLocaleString();
                requestAnimationFrame(updateCounter);
            } else {
                counter.innerText = target.toLocaleString();
            }
        };
        
        updateCounter();
    });

    // Rest of the existing scripts with color updates...
    const range_flatpicker = document.querySelectorAll('.user-date-range, .revenue-date-range, .subscription-date-range, .content-date-range')
    Array.from(range_flatpicker, (elem) => {
        if (typeof flatpickr !== typeof undefined) {
            flatpickr(elem, {
                mode: "range",
                theme: "dark"
            })
        }
    })

    // Apply futuristic theme to all charts
    $(document).ready(function() {
        // Override chart colors globally
        const futuristicColors = ['#00ffff', '#ff00ff', '#00ff00', '#ffff00', '#ff0066', '#0066ff'];
        
        // Apply to existing chart functions
        if (typeof user_chart === 'function') {
            window.user_chart = user_chart;
        }
        if (typeof popular_content === 'function') {
            window.popular_content = popular_content;
        }
        if (typeof total_revenue_chart === 'function') {
            window.total_revenue_chart = total_revenue_chart;
        }
        if (typeof subscription === 'function') {
            window.subscription = subscription;
        }
        
        // Override IQUtils colors if available
        if (typeof IQUtils !== 'undefined' && IQUtils.getVariableColor) {
            const originalGetVariableColor = IQUtils.getVariableColor;
            IQUtils.getVariableColor = function() {
                return {
                    primary: '#00ffff',
                    info: '#ff00ff',
                    warning: '#ffff00',
                    success: '#00ff00',
                    danger: '#ff0066',
                    secondary: '#0066ff'
                };
            };
        }
    });

    // Copy existing chart initialization code but maintain it as-is
    {{ str_replace(['<script>', '</script>'], '', file_get_contents(resource_path('views/backend/index-charts.js')) ?? '') }}
</script>
@endpush
