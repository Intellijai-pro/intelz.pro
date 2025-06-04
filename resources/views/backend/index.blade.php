@extends('backend.layouts.app', ['isBanner' => false])

@section('title')
{{ 'Dashboard' }}
@endsection

@push('after-styles')
<link rel="stylesheet" href="{{ asset('css/modern-dashboard-2025.css') }}">
<style>
    /* Page specific styles with modern enhancements */
    .dashboard-container {
        padding: 2rem;
        max-width: 1440px;
        margin: 0 auto;
    }
    
    /* Enhanced Welcome Card */
    .welcome-card {
        background: var(--primary-gradient) !important;
        position: relative;
        overflow: hidden;
        border-radius: 24px;
        padding: 3rem;
        margin-bottom: 3rem;
        box-shadow: 0 10px 40px rgba(102, 126, 234, 0.25);
    }
    
    .welcome-card::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.15) 0%, transparent 70%);
        transform: rotate(45deg);
        animation: float 15s ease-in-out infinite;
    }
    
    .welcome-card::after {
        content: '';
        position: absolute;
        bottom: -30%;
        left: -30%;
        width: 150%;
        height: 150%;
        background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 60%);
        animation: float 20s ease-in-out infinite reverse;
    }

    .welcome-content {
        position: relative;
        z-index: 1;
    }
    
    .welcome-card h2 {
        color: white !important;
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
        text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    .welcome-card p {
        color: rgba(255, 255, 255, 0.9) !important;
        font-size: 1.125rem;
        margin-bottom: 2rem;
    }
    
    .welcome-stats {
        display: flex;
        gap: 3rem;
        margin-top: 2rem;
    }
    
    .welcome-stat {
        text-align: center;
    }
    
    .welcome-stat-value {
        font-size: 2rem;
        font-weight: 700;
        color: white;
        display: block;
        text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    .welcome-stat-label {
        color: rgba(255, 255, 255, 0.8);
        font-size: 0.875rem;
        text-transform: uppercase;
        letter-spacing: 0.05em;
    }

    /* Enhanced Stats Cards with Modern Design */
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
        gap: 2rem;
        margin-bottom: 3rem;
    }

    /* Additional modern styles */
    .chart-container {
        background: white;
        border-radius: 24px;
        padding: 2rem;
        box-shadow: 0 4px 24px rgba(0, 0, 0, 0.06);
        margin-bottom: 2rem;
        transition: all 0.3s ease;
    }
    
    [data-bs-theme="dark"] .chart-container {
        background: rgba(26, 26, 46, 0.8);
        box-shadow: 0 4px 24px rgba(0, 0, 0, 0.3);
    }
    
    .chart-container:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 48px rgba(102, 126, 234, 0.1);
    }

    /* Modern Activity Timeline */
    .activity-timeline {
        position: relative;
        padding-left: 3rem;
    }

    .activity-timeline::before {
        content: '';
        position: absolute;
        left: 24px;
        top: 0;
        bottom: 0;
        width: 2px;
        background: linear-gradient(180deg, var(--modern-primary) 0%, transparent 100%);
    }

    .activity-item {
        position: relative;
        padding-bottom: 2rem;
        animation: fadeInUp 0.6s ease-out;
        animation-fill-mode: both;
    }
    
    .activity-item:nth-child(1) { animation-delay: 0.1s; }
    .activity-item:nth-child(2) { animation-delay: 0.2s; }
    .activity-item:nth-child(3) { animation-delay: 0.3s; }
    .activity-item:nth-child(4) { animation-delay: 0.4s; }
    .activity-item:nth-child(5) { animation-delay: 0.5s; }

    .activity-icon {
        position: absolute;
        left: -1.75rem;
        width: 48px;
        height: 48px;
        background: var(--primary-gradient);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
            font-size: 1.25rem;
        border: 4px solid white;
        box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
    }
    
    [data-bs-theme="dark"] .activity-icon {
        border-color: #1a1a2e;
    }
    
    .activity-content {
        background: rgba(102, 126, 234, 0.05);
        border-radius: 16px;
        padding: 1.25rem;
        margin-left: 1rem;
        border: 1px solid rgba(102, 126, 234, 0.1);
        transition: all 0.3s ease;
    }
    
    .activity-content:hover {
        background: rgba(102, 126, 234, 0.08);
        border-color: rgba(102, 126, 234, 0.2);
        transform: translateX(4px);
    }
    
    /* Modern Transactions Table */
    .transactions-table {
        background: white;
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 4px 24px rgba(0, 0, 0, 0.06);
    }
    
    [data-bs-theme="dark"] .transactions-table {
        background: rgba(26, 26, 46, 0.8);
    }
    
    .table-header {
        background: linear-gradient(135deg, rgba(102, 126, 234, 0.05) 0%, rgba(118, 75, 162, 0.05) 100%);
        padding: 1.5rem 2rem;
        border-bottom: 1px solid rgba(102, 126, 234, 0.1);
    }
    
    /* Quick Actions */
    .quick-actions {
        display: flex;
        gap: 1rem;
        margin-bottom: 2rem;
        flex-wrap: wrap;
    }
    
    .quick-action-card {
        flex: 1;
        min-width: 200px;
        background: white;
        border-radius: 16px;
        padding: 1.5rem;
        text-align: center;
        border: 2px solid transparent;
        transition: all 0.3s ease;
        cursor: pointer;
        box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
    }
    
    [data-bs-theme="dark"] .quick-action-card {
        background: rgba(26, 26, 46, 0.6);
    }
    
    .quick-action-card:hover {
        border-color: var(--modern-primary);
        transform: translateY(-4px);
        box-shadow: 0 8px 24px rgba(102, 126, 234, 0.15);
    }

    .quick-action-icon {
        width: 60px;
        height: 60px;
        margin: 0 auto 1rem;
        background: var(--primary-gradient);
        border-radius: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 1.5rem;
        box-shadow: 0 4px 16px rgba(102, 126, 234, 0.25);
    }
    
    /* Alert Cards */
    .alert-card {
        background: rgba(251, 99, 64, 0.1);
        border: 1px solid rgba(251, 99, 64, 0.3);
        border-radius: 16px;
        padding: 1.5rem;
        margin-bottom: 2rem;
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .alert-card .alert-icon {
        width: 48px;
        height: 48px;
        background: var(--warning-gradient);
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 1.5rem;
        flex-shrink: 0;
    }

    /* Enhanced Responsive */
    @media (max-width: 768px) {
        .dashboard-container {
            padding: 1rem;
        }
        
        .welcome-card {
            padding: 2rem;
        }
        
        .welcome-card h2 {
            font-size: 1.75rem;
        }
        
        .welcome-stats {
            gap: 2rem;
            flex-wrap: wrap;
    }

        .stats-grid {
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }
        
        .quick-actions {
            flex-direction: column;
    }

        .quick-action-card {
            min-width: 100%;
        }
    }
</style>
@endpush

@section('content')
<div class="dashboard-container fade-in">
    <!-- Service Limit Alerts -->
    @if(isset($data['cutout_pro_limit_over']) && $data['cutout_pro_limit_over']==1 || isset($data['open_ai_limit_over']) && $data['open_ai_limit_over']==1 || isset($data['picsart_limit_over']) && $data['picsart_limit_over']==1)
    <div class="alert-card fade-in-up">
        <div class="alert-icon">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        <div class="flex-grow-1">
            <h5 class="mb-1">Service Limits Alert</h5>
            <p class="mb-2 text-muted">Some services have reached their limits. Please upgrade your plan to continue using these services.</p>
            <div class="d-flex gap-2 flex-wrap">
                        @if(isset($data['cutout_pro_limit_over']) && $data['cutout_pro_limit_over']==1)
                <button onclick="Upgradeplan('cutout_pro')" class="btn btn-modern btn-modern-primary btn-sm">
                    <i class="fas fa-bolt me-1"></i>Recharge Cutout.pro
                                </button>
                        @endif
                        @if(isset($data['open_ai_limit_over']) && $data['open_ai_limit_over']==1)
                <button onclick="Upgradeplan('open_ai')" class="btn btn-modern btn-modern-primary btn-sm">
                    <i class="fas fa-bolt me-1"></i>Recharge OpenAI
                                </button>
                        @endif
                        @if(isset($data['picsart_limit_over']) && $data['picsart_limit_over']==1)
                <button onclick="Upgradeplan('picsart')" class="btn btn-modern btn-modern-primary btn-sm">
                    <i class="fas fa-bolt me-1"></i>Recharge Picsart
                                </button>
                        @endif
            </div>
        </div>
    </div>
    @endif

    <!-- Modern Welcome Section -->
    <div class="welcome-card glass-card">
        <div class="welcome-content">
            <h2>Welcome back, {{ auth()->user()->name ?? 'User' }}! 👋</h2>
            <p>Here's what's happening with your AI platform today.</p>
            
            <div class="welcome-stats">
                <div class="welcome-stat">
                    <span class="welcome-stat-value" data-countup="true" data-prefix="$">{{ isset($data['totalRevenue']) ? number_format($data['totalRevenue'], 0, '', '') : '0' }}</span>
                    <span class="welcome-stat-label">Total Revenue</span>
                                </div>
                <div class="welcome-stat">
                    <span class="welcome-stat-value" data-countup="true">{{ isset($data['totalUsersCount']) ? $data['totalUsersCount'] : '0' }}</span>
                    <span class="welcome-stat-label">Total Users</span>
                                </div>
                <div class="welcome-stat">
                    <span class="welcome-stat-value" data-countup="true">{{ isset($data['activeSubscriptionCount']) ? $data['activeSubscriptionCount'] : '0' }}</span>
                    <span class="welcome-stat-label">Active Subscriptions</span>
                            </div>
                        </div>
                    </div>
                        </div>

    <!-- Quick Actions -->
    <div class="quick-actions">
        <div class="quick-action-card fade-in-up" style="animation-delay: 0.1s;">
            <div class="quick-action-icon">
                <i class="fas fa-plus"></i>
                    </div>
            <h6 class="mb-0">Add New User</h6>
                </div>
        <div class="quick-action-card fade-in-up" style="animation-delay: 0.2s;">
            <div class="quick-action-icon" style="background: var(--success-gradient);">
                <i class="fas fa-chart-line"></i>
            </div>
            <h6 class="mb-0">View Reports</h6>
                            </div>
        <div class="quick-action-card fade-in-up" style="animation-delay: 0.3s;">
            <div class="quick-action-icon" style="background: var(--warning-gradient);">
                <i class="fas fa-cog"></i>
                        </div>
            <h6 class="mb-0">Settings</h6>
                    </div>
        <div class="quick-action-card fade-in-up" style="animation-delay: 0.4s;">
            <div class="quick-action-icon" style="background: var(--info-gradient);">
                <i class="fas fa-download"></i>
                        </div>
            <h6 class="mb-0">Export Data</h6>
                </div>
            </div>

    <!-- Modern Stats Grid -->
    <div class="stats-grid">
        <!-- Total Users Card -->
        <div class="stats-card-modern fade-in-up" style="animation-delay: 0.1s;">
            <div class="stats-icon-modern">
                <i class="fas fa-users"></i>
                            </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalUsersCount']) ? $data['totalUsersCount'] : '0' }}</div>
            <div class="stats-label">Total Users</div>
            <div class="stats-change {{ isset($data['percentageUsers']) && $data['percentageUsers'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageUsers']) && $data['percentageUsers'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageUsers']) ? abs($data['percentageUsers']) : '0' }}% from last month</span>
                        </div>
                    </div>

        <!-- Words Generated Card -->
        <div class="stats-card-modern fade-in-up" style="animation-delay: 0.2s;">
            <div class="stats-icon-modern" style="background: var(--success-gradient);">
                <i class="fas fa-file-alt"></i>
                        </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalWordCount']) ? $data['totalWordCount'] : '0' }}</div>
            <div class="stats-label">Words Generated</div>
            <div class="stats-change {{ isset($data['percentageWordCountLastMonth']) && $data['percentageWordCountLastMonth'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageWordCountLastMonth']) && $data['percentageWordCountLastMonth'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageWordCountLastMonth']) ? abs($data['percentageWordCountLastMonth']) : '0' }}% from last month</span>
                    </div>
                </div>

        <!-- Images Generated Card -->
        <div class="stats-card-modern fade-in-up" style="animation-delay: 0.3s;">
            <div class="stats-icon-modern" style="background: var(--warning-gradient);">
                <i class="fas fa-image"></i>
            </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalImageCount']) ? $data['totalImageCount'] : '0' }}</div>
            <div class="stats-label">Images Generated</div>
            <div class="stats-change {{ isset($data['percentageImageCountLastMonth']) && $data['percentageImageCountLastMonth'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageImageCountLastMonth']) && $data['percentageImageCountLastMonth'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageImageCountLastMonth']) ? abs($data['percentageImageCountLastMonth']) : '0' }}% from last month</span>
        </div>
    </div>

        <!-- AI Chats Card -->
        <div class="stats-card-modern fade-in-up" style="animation-delay: 0.4s;">
            <div class="stats-icon-modern" style="background: var(--info-gradient);">
                <i class="fas fa-comments"></i>
                        </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalAIchat']) ? $data['totalAIchat'] : '0' }}</div>
            <div class="stats-label">AI Chats</div>
            <div class="stats-change {{ isset($data['percentageAIchatLastMonth']) && $data['percentageAIchatLastMonth'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageAIchatLastMonth']) && $data['percentageAIchatLastMonth'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageAIchatLastMonth']) ? abs($data['percentageAIchatLastMonth']) : '0' }}% from last month</span>
                        </div>
                    </div>
                </div>

    <!-- AI Services Section -->
    <h4 class="mb-3 mt-4">AI Services Usage</h4>
    <div class="stats-grid mb-4">
        <!-- AI Writer -->
        <div class="stats-card-modern fade-in-up">
            <div class="stats-icon-modern" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                <i class="fas fa-pen"></i>
                                        </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalAIwriter']) ? $data['totalAIwriter'] : '0' }}</div>
            <div class="stats-label">AI Writer Uses</div>
            <div class="stats-change {{ isset($data['percentageAIwriterLastMonth']) && $data['percentageAIwriterLastMonth'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageAIwriterLastMonth']) && $data['percentageAIwriterLastMonth'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageAIwriterLastMonth']) ? abs($data['percentageAIwriterLastMonth']) : '0' }}% from last month</span>
                                    </div>
                                </div>
                                
        <!-- AI Code -->
        <div class="stats-card-modern fade-in-up">
            <div class="stats-icon-modern" style="background: linear-gradient(135deg, #0ba360 0%, #3cba92 100%);">
                <i class="fas fa-code"></i>
                                        </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalAIcode']) ? $data['totalAIcode'] : '0' }}</div>
            <div class="stats-label">AI Code Generated</div>
            <div class="stats-change {{ isset($data['percentageAIcodeLastMonth']) && $data['percentageAIcodeLastMonth'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageAIcodeLastMonth']) && $data['percentageAIcodeLastMonth'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageAIcodeLastMonth']) ? abs($data['percentageAIcodeLastMonth']) : '0' }}% from last month</span>
                                        </div>
                                    </div>
                                    
        <!-- AI Art -->
        <div class="stats-card-modern fade-in-up">
            <div class="stats-icon-modern" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
                <i class="fas fa-palette"></i>
                                        </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalAIart']) ? $data['totalAIart'] : '0' }}</div>
            <div class="stats-label">AI Art Created</div>
            <div class="stats-change {{ isset($data['percentageAIartLastMonth']) && $data['percentageAIartLastMonth'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageAIartLastMonth']) && $data['percentageAIartLastMonth'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageAIartLastMonth']) ? abs($data['percentageAIartLastMonth']) : '0' }}% from last month</span>
                                        </div>
                                    </div>
                                    
        <!-- AI Images -->
        <div class="stats-card-modern fade-in-up">
            <div class="stats-icon-modern" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                <i class="fas fa-images"></i>
                                        </div>
            <div class="stats-value" data-countup="true">{{ isset($data['totalAIimage']) ? $data['totalAIimage'] : '0' }}</div>
            <div class="stats-label">AI Images</div>
            <div class="stats-change {{ isset($data['percentageAIimageLastMonth']) && $data['percentageAIimageLastMonth'] > 0 ? 'positive' : 'negative' }}">
                <i class="fas fa-arrow-{{ isset($data['percentageAIimageLastMonth']) && $data['percentageAIimageLastMonth'] > 0 ? 'up' : 'down' }}"></i>
                <span>{{ isset($data['percentageAIimageLastMonth']) ? abs($data['percentageAIimageLastMonth']) : '0' }}% from last month</span>
                                    </div>
                                </div>
                            </div>

    <!-- Charts Section -->
    <div class="row mt-4">
        <!-- Revenue Chart -->
        <div class="col-lg-8 mb-4">
            <div class="chart-modern fade-in-up">
                <div class="chart-modern-header">
                    <div class="chart-modern-title">
                        <i class="fas fa-chart-area"></i>
                        Revenue Overview
                        </div>
                    <div class="chart-modern-options">
                        <button class="chart-option-btn active" data-period="week">Week</button>
                        <button class="chart-option-btn" data-period="month">Month</button>
                        <button class="chart-option-btn" data-period="year">Year</button>
                                    </div>
                                </div>
                <div class="chart-wrapper">
                    <canvas id="revenueChart" height="300"></canvas>
                            </div>
                        </div>
                                    </div>

        <!-- User Growth Chart -->
        <div class="col-lg-4 mb-4">
            <div class="chart-modern fade-in-up">
                <div class="chart-modern-header">
                    <div class="chart-modern-title">
                        <i class="fas fa-chart-line"></i>
                        User Growth
                                </div>
                            </div>
                <div class="chart-wrapper">
                    <canvas id="userGrowthChart" height="300"></canvas>
                        </div>
            </div>
        </div>
                    </div>
                    
    <!-- Recent Activity & Transactions -->
    <div class="row">
        <!-- Recent Activity -->
        <div class="col-lg-4 mb-4">
            <div class="widget-modern fade-in-up">
                <div class="widget-modern-header">
                    <h5 class="widget-modern-title">Recent Activity</h5>
                    <a href="#" class="widget-modern-more">
                        View All
                        <i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                
                <div class="activity-timeline">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <i class="fas fa-user-plus"></i>
                </div>
                        <div class="activity-content">
                            <h6 class="mb-1">{{ isset($data['newUsers']) ? $data['newUsers'] : '0' }} new users</h6>
                            <p class="mb-0 text-muted small">Joined in the last 7 days</p>
                            <small class="text-muted">Updated just now</small>
            </div>
        </div>

                    <div class="activity-item">
                        <div class="activity-icon" style="background: var(--success-gradient);">
                            <i class="fas fa-shopping-cart"></i>
                </div>
                        <div class="activity-content">
                            <h6 class="mb-1">{{ isset($data['activeSubscriptionCount']) ? $data['activeSubscriptionCount'] : '0' }} active plans</h6>
                            <p class="mb-0 text-muted small">Premium subscriptions</p>
                            <small class="text-muted">As of today</small>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon" style="background: var(--warning-gradient);">
                            <i class="fas fa-file-alt"></i>
                    </div>
                        <div class="activity-content">
                            <h6 class="mb-1">{{ isset($data['totalWordCount']) ? $data['totalWordCount'] : '0' }} words</h6>
                            <p class="mb-0 text-muted small">Total content generated</p>
                            <small class="text-muted">All time</small>
        </div>
    </div>

                    <div class="activity-item">
                        <div class="activity-icon" style="background: var(--info-gradient);">
                            <i class="fas fa-image"></i>
                        </div>
                        <div class="activity-content">
                            <h6 class="mb-1">{{ isset($data['totalImageCount']) ? $data['totalImageCount'] : '0' }} images</h6>
                            <p class="mb-0 text-muted small">Total images created</p>
                            <small class="text-muted">All time</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
        <!-- Recent Transactions -->
        <div class="col-lg-8 mb-4">
            <div class="table-modern fade-in-up">
                <div class="table-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Recent Transactions</h5>
                        @if(Route::has('backend.customer.transaction.index'))
                        <a href="{{ route('backend.customer.transaction.index') }}" class="btn btn-modern btn-modern-ghost btn-sm">
                            View All
                        </a>
                                    @endif
                    </div>
                </div>
                
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th>Transaction ID</th>
                                <th>Customer</th>
                                    <th>Plan</th>
                                <th>Amount</th>
                                    <th>Status</th>
                                <th>Date</th>
                                </tr>
                            </thead>
                            <tbody>
                            @if(isset($data['transactionHistory']) && count($data['transactionHistory']) > 0)
                                @foreach($data['transactionHistory'] as $transaction)
                                <tr class="transaction-row">
                                    <td>
                                        <span class="fw-medium">#{{ $transaction->id ?? 'N/A' }}</span>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm me-2">
                                                <span class="avatar-title rounded-circle bg-gradient-primary text-white">
                                                    {{ isset($transaction->subscription->user->name) ? substr($transaction->subscription->user->name, 0, 1) : 'U' }}
                                                </span>
                                            </div>
                                            <div>
                                                <h6 class="mb-0">{{ $transaction->subscription->user->name ?? 'Unknown' }}</h6>
                                                <small class="text-muted">{{ $transaction->subscription->user->email ?? '' }}</small>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="badge rounded-pill bg-gradient-primary">
                                            {{ isset($transaction->subscription->plan->name) ? $transaction->subscription->plan->name : 'N/A' }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="fw-bold text-primary">${{ isset($transaction->amount) ? number_format($transaction->amount, 2) : '0.00' }}</span>
                                    </td>
                                    <td>
                                        @if(isset($transaction->status))
                                            @if($transaction->status == 'completed' || $transaction->status == 'approved')
                                                <span class="badge badge-success">
                                                    <i class="fas fa-check-circle me-1"></i>Completed
                                                </span>
                                            @elseif($transaction->status == 'pending')
                                                <span class="badge badge-warning">
                                                    <i class="fas fa-clock me-1"></i>Pending
                                                </span>
                                            @else
                                                <span class="badge badge-danger">
                                                    <i class="fas fa-times-circle me-1"></i>Failed
                                                </span>
                                            @endif
                                        @else
                                            <span class="badge badge-secondary">Unknown</span>
                                        @endif
                                    </td>
                                    <td>
                                        <small class="text-muted">
                                            @if(isset($transaction->created_at))
                                                {{ $transaction->created_at->format('M d, Y') }}
                                            @else
                                                N/A
                                            @endif
                                        </small>
                                    </td>
                                </tr>
                                @endforeach
                                @else
                                <tr>
                                <td colspan="6" class="text-center py-5">
                                        <div class="empty-state">
                                        <i class="fas fa-receipt fa-3x text-muted mb-3 empty-state-icon"></i>
                                        <h5 class="text-muted">No recent transactions</h5>
                                        <p class="text-muted">Transactions will appear here once they are made.</p>
                                        </div>
                                    </td>
                                </tr>
                                @endif
                            </tbody>
                        </table>
                    </div>
                        </div>
        </div>
    </div>
</div>
@endsection

@push('after-scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
<script src="{{ asset('js/modern-dashboard.js') }}"></script>
<script>
    // Chart data from controller
    const chartData = {
        revenue: @json($data['last_month_revenue_graph_data'] ?? []),
        users: @json($data['last_month_user_graph_data'] ?? []),
        wordCount: @json($data['last_month_word_count_graph_data'] ?? []),
        subscriptions: @json($data['last_month_subscription_graph_data'] ?? [])
    };

    // Count-up animation for numbers
    document.addEventListener('DOMContentLoaded', function() {
        const countUpElements = document.querySelectorAll('[data-countup="true"]');
        
        countUpElements.forEach(element => {
            const text = element.textContent.replace(/[^0-9.-]/g, '');
            const endValue = parseInt(text) || 0;
            const prefix = element.dataset.prefix || '';
            const suffix = element.dataset.suffix || '';
            const duration = 2000;
            const startTime = Date.now();
            
            const animate = () => {
                const currentTime = Date.now();
                const elapsed = currentTime - startTime;
                const progress = Math.min(elapsed / duration, 1);
                
                const value = Math.floor(progress * endValue);
                element.textContent = prefix + value.toLocaleString() + suffix;
                
                if (progress < 1) {
                    requestAnimationFrame(animate);
            }
            };
            
            animate();
        });

        // Theme-aware chart colors
        const getChartColors = () => {
            const isDark = document.documentElement.getAttribute('data-bs-theme') === 'dark';
            return {
                primary: '#667eea',
                success: '#0ba360',
                warning: '#fa709a',
                info: '#4facfe',
                textColor: isDark ? '#E9ECEF' : '#525F7F',
                gridColor: isDark ? 'rgba(255, 255, 255, 0.05)' : 'rgba(0, 0, 0, 0.05)',
                borderColor: isDark ? 'rgba(255, 255, 255, 0.1)' : 'rgba(0, 0, 0, 0.1)'
            };
    };

    // Initialize Revenue Chart
        const revenueCtx = document.getElementById('revenueChart');
        if (revenueCtx) {
            const colors = getChartColors();
            window.revenueChart = new Chart(revenueCtx.getContext('2d'), {
                type: 'line',
                data: {
                    labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                    datasets: [{
                        label: 'Revenue',
                        data: chartData.revenue,
                        borderColor: colors.primary,
                        backgroundColor: 'rgba(102, 126, 234, 0.1)',
                        borderWidth: 3,
                        tension: 0.4,
                        fill: true,
                        pointRadius: 0,
                        pointHoverRadius: 6,
                        pointBackgroundColor: colors.primary,
                        pointBorderColor: '#fff',
                        pointBorderWidth: 2,
                        pointHoverBackgroundColor: colors.primary,
                        pointHoverBorderColor: '#fff',
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.8)',
                            padding: 12,
                            cornerRadius: 8,
                            titleFont: {
                                size: 14,
                                weight: '600'
                            },
                            bodyFont: {
                                size: 13
                            },
                            callbacks: {
                                label: function(context) {
                                    return '$' + context.parsed.y.toLocaleString();
                                }
                            }
                        }
                    },
                    scales: {
                        x: {
                            grid: {
                                display: false
                            },
                            ticks: {
                                font: {
                                    size: 12
                                },
                                color: colors.textColor
                            }
                        },
                        y: {
                            grid: {
                                borderDash: [5, 5],
                                color: colors.gridColor
                            },
                            ticks: {
                                font: {
                                    size: 12
                                },
                                color: colors.textColor,
                                callback: function(value) {
                                    return '$' + value.toLocaleString();
                                }
                            }
                        }
                    },
                    interaction: {
                        intersect: false,
                        mode: 'index'
                    }
                }
            });
        }

        // Initialize User Growth Chart
        const userGrowthCtx = document.getElementById('userGrowthChart');
        if (userGrowthCtx) {
            const colors = getChartColors();
            window.userGrowthChart = new Chart(userGrowthCtx.getContext('2d'), {
                type: 'bar',
                data: {
                    labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
                    datasets: [{
                        label: 'New Users',
                        data: chartData.users,
                        backgroundColor: 'rgba(102, 126, 234, 0.8)',
                        borderColor: colors.primary,
                        borderWidth: 0,
                        borderRadius: 8,
                        barThickness: 40
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.8)',
                            padding: 12,
                            cornerRadius: 8,
                            callbacks: {
                                label: function(context) {
                                    return context.parsed.y + ' users';
                        }
                    }
                }
            },
                    scales: {
                        x: {
                            grid: {
                                display: false
                            },
                            ticks: {
                                font: {
                                    size: 12
                                },
                                color: colors.textColor
                }
            },
                        y: {
                            grid: {
                                borderDash: [5, 5],
                                color: colors.gridColor
                            },
                            ticks: {
                                font: {
                                    size: 12
                                },
                                color: colors.textColor
                    }
                }
            }
                }
            });
        }

        // Listen for theme changes to update charts
        window.addEventListener('themeChanged', (e) => {
            const colors = getChartColors();
            
            // Update Revenue Chart
            if (window.revenueChart) {
                window.revenueChart.options.scales.x.ticks.color = colors.textColor;
                window.revenueChart.options.scales.y.ticks.color = colors.textColor;
                window.revenueChart.options.scales.y.grid.color = colors.gridColor;
                window.revenueChart.update();
    }
            
            // Update User Growth Chart
            if (window.userGrowthChart) {
                window.userGrowthChart.options.scales.x.ticks.color = colors.textColor;
                window.userGrowthChart.options.scales.y.ticks.color = colors.textColor;
                window.userGrowthChart.options.scales.y.grid.color = colors.gridColor;
                window.userGrowthChart.update();
            }
        });

        // Chart period selector
        document.querySelectorAll('.chart-option-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.chart-option-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                const period = this.dataset.period;
                // Here you would typically make an AJAX call to get data for the selected period
                console.log('Loading data for period:', period);
            });
        });

        // Quick action cards click handlers
        document.querySelectorAll('.quick-action-card').forEach(card => {
            card.addEventListener('click', function() {
                const action = this.querySelector('h6').textContent;
                switch(action) {
                    case 'Add New User':
                        @if(Route::has('backend.users.create'))
                            window.location.href = '{{ route("backend.users.create") }}';
                        @else
                            window.location.href = '/app/users/create';
                        @endif
                        break;
                    case 'View Reports':
                        // Reports route doesn't exist, so we'll show a notification
                        window.notificationSystem.show('Reports feature coming soon!', 'info');
                        break;
                    case 'Settings':
                        @if(Route::has('backend.settings'))
                            window.location.href = '{{ route("backend.settings") }}';
                        @else
                            window.location.href = '/app/settings';
                        @endif
                        break;
                    case 'Export Data':
                        // Handle export
                        window.notificationSystem.show('Preparing export...', 'info');
            setTimeout(() => {
                            window.notificationSystem.show('Export feature coming soon!', 'info');
            }, 1000);
                        break;
                }
            });
        });
    });

    // Upgrade plan function
    function Upgradeplan(type) {
        fetch("{{ route('backend.upgrade-account') }}", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({ type: type })
        })
        .then(response => response.json())
        .then(data => {
            if (data.status) {
                window.notificationSystem.show('Service upgraded successfully!', 'success');
                setTimeout(() => location.reload(), 1500);
    }
        })
        .catch(error => {
            window.notificationSystem.show('An error occurred. Please try again.', 'error');
        });
    }
</script>
@endpush
