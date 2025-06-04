<?php
$notifications = optional(auth()->user())->unreadNotifications;
$notifications_count = optional($notifications)->count();
$notifications_latest = optional($notifications)->take(5);
?>
<nav
    class="nav navbar navbar-expand-xl navbar-light iq-navbar header-hover-menu left-border {{ !empty(getCustomizationSetting('navbar_show')) ? getCustomizationSetting('navbar_show') : '' }} {{ getCustomizationSetting('header_navbar') }}">
    <div class="container-fluid navbar-inner">
            <a href="{{route('backend.dashboard')}}" class="navbar-brand">
                <div class="logo-main">
                    <div class="logo-mini d-none">
                        <img src="{{asset(setting('mini_logo'))}}" height="30" alt="{{ app_name() }}">
                    </div>
                    <div class="logo-normal">
                        <img src="{{asset(setting('dark_logo'))}}" height="30" alt="{{ app_name() }}">
                        {{-- <h4 class="logo-title d-none d-sm-block">{{app_name()}}</h4> --}}
                    </div>
                </div>
            </a>
            <div class="sidebar-toggle" data-toggle="sidebar" data-active="true">
                <i class="icon d-flex">
                    <svg class="icon-20" xmlns="http://www.w3.org/2000/svg" width="13" height="12" viewBox="0 0 13 12" fill="none">
                        <path d="M8.25 9.5L4.75 6L8.25 2.5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                            stroke-linejoin="round" />
                    </svg>
                </i>
            </div>
            {{-- Modern Search Bar --}}
            <div class="modern-search-container mx-3 flex-grow-1 d-none d-md-block" style="max-width: 500px;">
                <div class="position-relative">
                    <div class="modern-search-input-wrapper">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" 
                               class="form-control modern-search-input" 
                               id="globalSearch" 
                               placeholder="Search users, customers, employees..." 
                               autocomplete="off">
                        <div class="search-loader d-none">
                            <div class="spinner-border spinner-border-sm text-primary" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                    </div>
                    <div class="modern-search-results d-none" id="searchResults">
                        <div class="search-results-inner">
                            <!-- Results will be populated here -->
                        </div>
                    </div>
                </div>
            </div>
            {{-- <div>
                @php

                $admin = \App\Models\Setting::where('name','default_time_zone')->first();
                $time_zone = $admin->val ?? 'UTC';
                $currentTime = \Carbon\Carbon::now($time_zone);
                $message = '';
                $hour = $currentTime->hour;

                if ($hour >= 1 && $hour <= 12) { $message="Good Morning" ; } else if ($hour> 12 && $hour <= 16) {
                        $message="Good Afternoon" ; } else if ($hour> 16 && $hour <= 21) { $message="Good Evening" ; } else
                            { $message="Good Night" ; } @endphp

                <small class="d-none d-xl-block m-0">
                    {{ \Carbon\Carbon::now()->format('j F') }}</small>

                <h5 class="d-none d-xl-block m-0 day-message">{{$message}}</h5>

            </div> --}}
            <div class="d-none d-xl-block m-0 d-flex align-items-center justify-content-between product-offcanvas">

                    {{-- @auth
                    <h4 class="m-0">Welcome {{ ucfirst(auth()->user()->user_type)}}!</h4>
                    @endauth --}}
                {{-- <div class="breadcrumb-title border-end me-3 pe-3 d-none d-xl-block">
                <small class="mb-0 text-capitalize">@yield('title')</small>
                </div> --}}
                @role('employee')
                {{-- <div class="offcanvas offcanvas-end shadow-none iq-product-menu-responsive" tabindex="-1"
                    id="offcanvasBottom">
                    <div class="offcanvas-body">
                        <ul class="iq-nav-menu list-unstyled">
                            @include(('vendor.laravel-menu.custom-menu-items'), ['items' => $horizontal_menu->roots()])
                        </ul>
                    </div>
                </div> --}}
                @endrole
            </div>
        <div class="right-data">
            <div class="d-flex align-items-center">
                <button id="navbar-toggle" class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon">
                        <span class="navbar-toggler-bar bar1 mt-1"></span>
                        <span class="navbar-toggler-bar bar2"></span>
                        <span class="navbar-toggler-bar bar3"></span>
                    </span>
                </button>
            </div>
            <div class="collapse navbar-collapse header-right-panel" id="navbarSupportedContent">
                <ul class="mb-2 navbar-nav ms-auto align-items-center navbar-list mb-lg-0">
                    {{-- Mobile Search Button --}}
                    <li class="nav-item d-md-none">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#searchModal">
                            <i class="fas fa-search"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown me-0 me-xl-3">
                        <div class="d-flex align-items-center mr-2 iq-font-style" role="group" aria-label="First group">
                            <input type="radio" class="btn-check" name="theme_font_size" value="theme-fs-sm" id="font-size-sm" checked>
                            <label for="font-size-sm" class="btn btn-border border-0 btn-icon btn-sm" data-bs-toggle="tooltip"
                            title="Font size 14px" data-bs-placement="bottom">
                            <span class="mb-0 h6" style="color: inherit !important;">A</span>
                            </label>
                            <input type="radio" class="btn-check" name="theme_font_size" value="theme-fs-md" id="font-size-md">
                            <label for="font-size-md" class="btn btn-border border-0 btn-icon" data-bs-toggle="tooltip"
                            title="Font size 16px" data-bs-placement="bottom">
                            <span class="mb-0 h4" style="color: inherit !important;">A</span>
                            </label>
                            <input type="radio" class="btn-check" name="theme_font_size" value="theme-fs-lg" id="font-size-lg">
                            <label for="font-size-lg" class="btn btn-border border-0 btn-icon" data-bs-toggle="tooltip"
                            title="Font size 18px" data-bs-placement="bottom">
                            <span class="mb-0 h2" style="color: inherit !important;">A</span>
                            </label>
                        </div>
                    </li>

                    @if(isset($is_single_branch) && !$is_single_branch)
                    <li class="nav-item dropdown me-0 me-xl-1 pe-3 border-end iq-dropdown">
                        <a href="javascript:void(0)" class="nav-link p-0" data-bs-toggle="dropdown">
                            @if(isset($selected_branch))
                            <div class="iq-sub-card">
                                <div class="d-flex align-items-center">
                                    <span class="iq-media-group">
                                        <div class="icon iq-icon-box-3 rounded-pill">
                                            {{substr($selected_branch->name, 0, 1)}}</div>
                                    </span>
                                    <div class="ms-3 flex-grow-1">
                                        <h6 class="mb-0 ">{{$selected_branch->name}}</h6>
                                    </div>
                                </div>
                            </div>
                            @endif
                        </a>
                        @role('admin')
                        <ul class="p-0 sub-drop dropdown-menu dropdown-menu-end iq-sub-drop">
                            <div class="m-0 shadow-none card">
                                <div class="py-3 card-header d-flex justify-content-between border-bottom">
                                    <div class="header-title">
                                        <h5 class="mb-0">Branches</h5>
                                    </div>
                                </div>
                                <div class="p-0 card-body max-17 scroll-thin">
                                    <form action="{{ route('backend.reset-branch') }}" method="post">
                                        @csrf
                                        <div
                                            class="iq-sub-card {{ !isset($selected_branch) ? 'bg-primary-subtle text-primary' : '' }} iq-branch-dropdown border-bottom">
                                            <div class="d-flex align-items-center">
                                                <span class="iq-media-group">
                                                    <div class="icon iq-icon-box-3 rounded-pill">{{substr('A',0,1)}}</div>
                                                </span>
                                                <div class="ms-3 flex-grow-1">
                                                    <h6 class="mb-0 ">All Branches</h6>
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-sm rounded">
                                                    <span class="btn-inner">
                                                        Apply
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    @isset($auth_user_branches)
                                    @foreach ($auth_user_branches as $key => $branch)
                                    <form action="{{route('backend.set-current-branch', $branch->id)}}" method="post">
                                        @csrf
                                        <div
                                            class="iq-sub-card {{ isset($selected_branch) && $branch->id == $selected_branch->id ? 'bg-primary-subtle text-primary' : '' }} iq-branch-dropdown border-bottom">
                                            <div class="d-flex align-items-center">
                                                <span class="iq-media-group">
                                                    <div class="icon iq-icon-box-3 rounded-pill">
                                                        {{substr($branch->name,0,1)}}</div>
                                                </span>
                                                <div class="ms-3 flex-grow-1">
                                                    <h6 class="mb-0 ">{{$branch->name}}</h6>
                                                </div>
                                                <button type="submit" class="btn btn-primary btn-sm rounded">
                                                    <span class="btn-inner">
                                                        Apply
                                                    </span>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    @endforeach
                                    @endisset
                                </div>
                            </div>
                        </ul>
                        @endrole
                    </li>
                    @endif
                    <li class="nav-item theme-scheme-dropdown dropdown iq-dropdown">
                        <a href="javascript:void(0)" class="nav-link d-flex align-items-center change-mode"
                            id="mode-drop">
                            <i class="ph ph-sun mode-icons light-mode"></i>
                            <i class="ph ph-moon mode-icons dark-mode"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown iq-dropdown">
                        <a class="nav-link btn-action" data-bs-toggle="dropdown" href="#">
                            <div class="iq-sub-card">
                                <div class="d-flex align-items-center notification_list position-relative">
                                    <span class="btn-inner">
                                        <i class="ph ph-bell"></i>
                                    </span>
                                    @if($notifications_count)<span class="notification-alert">{{$notifications_count}}</span>@endif
                                </div>
                            </div>
                        </a>
                        <ul class="p-0 sub-drop dropdown-menu dropdown-menu-end">
                            <div class="m-0 shadow-none card notification_data"></div>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link d-flex align-items-center" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="ph ph-globe-simple me-2"></i>
                            <span class="font-size-14">{{strtoupper(App::getLocale())}}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <div class="dropdown-header bg-primary-subtle text-primary py-2 rounded">
                                <div class="fw-semibold">{{ __('messages.change_language') }}</div>
                            </div>
                            @foreach(config('app.available_locales') as $locale => $title)
                            <a class="dropdown-item" href="{{route("language.switch", $locale)}}">
                                {{ $title }}
                            </a>
                            @endforeach
                        </div>
                    </li>
                    <li class="nav-item dropdown dropdown-user">
                        <a class="nav-link py-0" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <div class="avatar avatar-md">
                                <img class="avatar avatar-40 img-fluid rounded-pill" src="{{ asset(user_avatar()) }}" alt="{{ auth()->user()->name ?? default_user_name() }}" loading="lazy">
                                <span class="active-badge"></span>
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-0">
                            <li>
                                <div class="dropdown-header pt-3 mb-2 rounded">
                                  <div class="d-flex gap-2 align-items-center">
                                    <img class="avatar avatar-40 img-fluid rounded-pill" src="{{ asset(user_avatar()) }}"/>
                                    <div class="d-flex flex-column align-items-start">
                                        <h6 class="m-0 text-primary">{{ Auth::user()->full_name ?? default_user_name() }}</h6>
                                        {{-- <small class="text-muted">{{ Auth::user()->email ?? 'abc@email.com' }}</small> --}}
                                    </div>
                                  </div>
                                </div>
                            </li>

                            <li>
                                <a class="dropdown-item d-flex align-items-center gap-2"
                                    href="{{ route('backend.my-profile') }}"><i class="ph ph-user font-size-18"></i>{{ __('messages.myprofile') }}</a>
                            </li>
                            @role('admin')
                            <li>
                                <a class="dropdown-item d-flex align-items-center gap-2"
                                    href="{{ route('backend.settings') }}">
                                    <i class="ph ph-gear font-size-18"></i> @lang('settings.title')
                                </a>
                            </li>
                            @endrole
                            <li class="bg-primary mt-3 mb-0">
                                <a class="dropdown-item d-flex align-items-center justify-content-center gap-2 text-white"
                                    href="{{ route('logout') }}"
                                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                    <i class="icon-signout"></i> @lang('messages.logout')
                                </a>
                            </li>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf </form>
                          </ul>
                        {{-- <ul class="dropdown-menu dropdown-menu-end">
                            <div class="dropdown-header border-bottom mb-3">
                                <div class="d-flex align-items-center gap-3">
                                    <img class="avatar avatar-40 img-fluid rounded-pill" src="{{ asset(user_avatar()) }}" />
                                    <div class="d-flex flex-column align-items-start">
                                        <h6 class="m-0">{{ Auth::user()->full_name ?? default_user_name() }}</h6>
                                        <!-- <small class="text-muted">{{ Auth::user()->email ?? 'abc@email.com' }}</small> -->
                                    </div>
                                </div>
                            </div>

                            @role('admin')

                            @endrole

                        </ul> --}}
                    </li>

                </ul>
            </div>
        </div>
    </div>
</nav>

{{-- Mobile Search Modal --}}
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="searchModalLabel">Search</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="position-relative">
                    <div class="modern-search-input-wrapper">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" 
                               class="form-control modern-search-input" 
                               id="mobileGlobalSearch" 
                               placeholder="Search users, customers, employees..." 
                               autocomplete="off">
                        <div class="search-loader d-none">
                            <div class="spinner-border spinner-border-sm text-primary" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                    </div>
                    <div class="modern-search-results mt-3" id="mobileSearchResults">
                        <div class="search-results-inner">
                            <!-- Results will be populated here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@push('after-styles')
<style>
/* Modern Search Styles */
.modern-search-container {
    position: relative;
    z-index: 100;
}

.modern-search-input-wrapper {
    position: relative;
}

.modern-search-input {
    padding: 0.75rem 1rem 0.75rem 3rem !important;
    border-radius: 12px !important;
    border: 2px solid transparent !important;
    background: rgba(0, 0, 0, 0.05) !important;
    transition: all 0.3s ease !important;
    font-size: 0.95rem !important;
}

[data-bs-theme="dark"] .modern-search-input {
    background: rgba(255, 255, 255, 0.05) !important;
    color: #fff !important;
}

.modern-search-input:focus {
    background: white !important;
    border-color: var(--bs-primary) !important;
    box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.1) !important;
    outline: none !important;
}

[data-bs-theme="dark"] .modern-search-input:focus {
    background: rgba(255, 255, 255, 0.1) !important;
}

.search-icon {
    position: absolute;
    left: 1rem;
    top: 50%;
    transform: translateY(-50%);
    color: #6c757d;
    z-index: 10;
}

.search-loader {
    position: absolute;
    right: 1rem;
    top: 50%;
    transform: translateY(-50%);
}

.modern-search-results {
    position: absolute;
    top: calc(100% + 0.5rem);
    left: 0;
    right: 0;
    background: white;
    border-radius: 12px;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
    max-height: 400px;
    overflow-y: auto;
    z-index: 1055;
}

[data-bs-theme="dark"] .modern-search-results {
    background: #1a1a2e;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
}

.search-results-inner {
    padding: 0.5rem;
}

.search-result-item {
    padding: 0.75rem 1rem;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s ease;
    display: flex;
    align-items: center;
    gap: 1rem;
}

.search-result-item:hover {
    background: rgba(102, 126, 234, 0.1);
}

.search-result-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: var(--bs-primary);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 600;
    flex-shrink: 0;
}

.search-result-info {
    flex: 1;
    min-width: 0;
}

.search-result-name {
    font-weight: 600;
    margin-bottom: 0.125rem;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.search-result-type {
    font-size: 0.875rem;
    color: #6c757d;
}

.search-no-results {
    padding: 2rem;
    text-align: center;
    color: #6c757d;
}

.search-category-header {
    padding: 0.5rem 1rem;
    font-weight: 600;
    color: #6c757d;
    font-size: 0.875rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    background: rgba(0, 0, 0, 0.03);
    margin: 0.25rem 0;
    border-radius: 6px;
}

[data-bs-theme="dark"] .search-category-header {
    background: rgba(255, 255, 255, 0.05);
}

/* Mobile specific */
#searchModal .modern-search-results {
    position: static;
    box-shadow: none;
    border: 1px solid rgba(0, 0, 0, 0.1);
}

[data-bs-theme="dark"] #searchModal .modern-search-results {
    border-color: rgba(255, 255, 255, 0.1);
}
</style>
@endpush

@push('after-scripts')


<script type="text/javascript">
$(document).ready(function() {

    $('.change-mode').on('click', function() {
        // if(value !== 'dark'){

        // }
        // $(this).data('change-mode', value == 'dark' ? 'light' : 'dark')
        const element = document.querySelector('html');
        let value = element.getAttribute('data-bs-theme');
        sessionStorage.setItem('theme_mode', value !== 'dark' ? 'dark' : 'light');
        if (value !== 'dark') {
            $('html').attr('data-bs-theme','dark');
        } else {
            $('html').attr('data-bs-theme','light');
        }
    });

    $('input[name="theme_font_size"]').on('change', function() {
        const font = $('[name="theme_font_size"]').map(function() {
            return $(this).attr('value')
        }).get();
        $('html').removeClass(font).addClass($(this).val());
    });
    $('.notification_list').on('click', function() {
        notificationList();
    });
    
    // Modern Search Implementation
    let searchTimeout;
    const searchUrl = "{{ route('backend.get_search_data') }}";
    
    function initializeSearch(inputId, resultsId) {
        const searchInput = document.getElementById(inputId);
        const searchResults = document.getElementById(resultsId);
        const searchLoader = searchInput.parentElement.querySelector('.search-loader');
        
        searchInput.addEventListener('input', function() {
            clearTimeout(searchTimeout);
            const query = this.value.trim();
            
            if (query.length < 2) {
                searchResults.classList.add('d-none');
                return;
            }
            
            searchLoader.classList.remove('d-none');
            
            searchTimeout = setTimeout(() => {
                performSearch(query, searchResults, searchLoader);
            }, 300);
        });
        
        // Hide results when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.modern-search-container') && !e.target.closest('#searchModal')) {
                searchResults.classList.add('d-none');
            }
        });
        
        // Show results when focusing on input
        searchInput.addEventListener('focus', function() {
            if (this.value.trim().length >= 2 && searchResults.querySelector('.search-result-item')) {
                searchResults.classList.remove('d-none');
            }
        });
    }
    
    function performSearch(query, resultsContainer, loader) {
        // Search for multiple types
        const searchTypes = ['customers', 'employees'];
        const promises = searchTypes.map(type => 
            $.ajax({
                url: searchUrl,
                type: 'GET',
                data: {
                    type: type,
                    q: query
                }
            })
        );
        
        Promise.all(promises).then(responses => {
            loader.classList.add('d-none');
            displaySearchResults(responses, resultsContainer, query);
        }).catch(error => {
            loader.classList.add('d-none');
            console.error('Search error:', error);
        });
    }
    
    function displaySearchResults(responses, container, query) {
        const resultsInner = container.querySelector('.search-results-inner');
        resultsInner.innerHTML = '';
        
        let hasResults = false;
        
        // Combine and display results
        const categories = [
            { name: 'Customers', data: responses[0]?.results || [], icon: 'fa-user' },
            { name: 'Employees', data: responses[1]?.results || [], icon: 'fa-user-tie' }
        ];
        
        categories.forEach(category => {
            if (category.data.length > 0) {
                hasResults = true;
                
                // Add category header
                const categoryHeader = document.createElement('div');
                categoryHeader.className = 'search-category-header';
                categoryHeader.textContent = category.name;
                resultsInner.appendChild(categoryHeader);
                
                // Add results
                category.data.forEach(item => {
                    const resultItem = createResultItem(item, category.icon);
                    resultsInner.appendChild(resultItem);
                });
            }
        });
        
        if (!hasResults) {
            resultsInner.innerHTML = `
                <div class="search-no-results">
                    <i class="fas fa-search fa-3x mb-3 text-muted"></i>
                    <p class="mb-0">No results found for "${query}"</p>
                </div>
            `;
        }
        
        container.classList.remove('d-none');
    }
    
    function createResultItem(item, icon) {
        const div = document.createElement('div');
        div.className = 'search-result-item';
        
        const initials = item.text.split(' ').map(n => n[0]).join('').toUpperCase().slice(0, 2);
        
        div.innerHTML = `
            <div class="search-result-avatar">
                ${initials}
            </div>
            <div class="search-result-info">
                <div class="search-result-name">${highlightMatch(item.text, item.text)}</div>
                <div class="search-result-type">ID: ${item.id}</div>
            </div>
            <i class="fas fa-chevron-right text-muted"></i>
        `;
        
        div.addEventListener('click', function() {
            // Navigate to user profile or details page
            window.location.href = `/app/users/${item.id}`;
        });
        
        return div;
    }
    
    function highlightMatch(text, query) {
        // Simple highlight function - can be improved
        return text;
    }
    
    // Initialize search for both desktop and mobile
    initializeSearch('globalSearch', 'searchResults');
    initializeSearch('mobileGlobalSearch', 'mobileSearchResults');
});

function notificationList(type = '') {
    var url = "{{ route('notification.list') }}";
    $.ajax({
        type: 'get',
        url: url,
        data: {
            'type': type
        },
        success: function(res) {

            $('.notification_data').html(res.data);
            getNotificationCounts();
            if (res.type == "markas_read") {
                notificationList();
            }
            $('.notify_count').removeClass('notification_tag').text('');
        }
    });
}
</script>
@endpush
