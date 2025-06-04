@extends('backend.layouts.app')

@section('title')
    Search Users
@endsection

@push('after-styles')
<link rel="stylesheet" href="{{ asset('css/modern-dashboard-2025.css') }}">
<style>
    .search-page-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 2rem;
    }
    
    .search-header {
        background: var(--primary-gradient);
        color: white;
        padding: 3rem 2rem;
        border-radius: 24px;
        margin-bottom: 2rem;
        text-align: center;
        position: relative;
        overflow: hidden;
    }
    
    .search-header::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        animation: float 20s ease-in-out infinite;
    }
    
    .search-header h1 {
        font-size: 2.5rem;
        margin-bottom: 1rem;
        position: relative;
        z-index: 1;
    }
    
    .search-header p {
        font-size: 1.125rem;
        opacity: 0.9;
        position: relative;
        z-index: 1;
    }
    
    .advanced-search-box {
        background: white;
        border-radius: 20px;
        padding: 2rem;
        box-shadow: 0 4px 24px rgba(0, 0, 0, 0.06);
        margin-bottom: 2rem;
    }
    
    [data-bs-theme="dark"] .advanced-search-box {
        background: rgba(26, 26, 46, 0.8);
    }
    
    .search-main-input {
        position: relative;
        margin-bottom: 2rem;
    }
    
    .search-main-input input {
        width: 100%;
        padding: 1.25rem 1.5rem 1.25rem 3.5rem;
        font-size: 1.125rem;
        border: 2px solid transparent;
        border-radius: 16px;
        background: rgba(102, 126, 234, 0.05);
        transition: all 0.3s ease;
    }
    
    .search-main-input input:focus {
        background: white;
        border-color: var(--bs-primary);
        box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.1);
        outline: none;
    }
    
    [data-bs-theme="dark"] .search-main-input input {
        background: rgba(255, 255, 255, 0.05);
        color: white;
    }
    
    [data-bs-theme="dark"] .search-main-input input:focus {
        background: rgba(255, 255, 255, 0.1);
    }
    
    .search-main-input i {
        position: absolute;
        left: 1.5rem;
        top: 50%;
        transform: translateY(-50%);
        font-size: 1.25rem;
        color: #6c757d;
    }
    
    .search-filters {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        margin-bottom: 1.5rem;
    }
    
    .filter-chip {
        padding: 0.5rem 1rem;
        background: rgba(102, 126, 234, 0.1);
        border: 1px solid transparent;
        border-radius: 25px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-weight: 500;
        font-size: 0.875rem;
    }
    
    .filter-chip:hover {
        background: rgba(102, 126, 234, 0.15);
        border-color: var(--bs-primary);
    }
    
    .filter-chip.active {
        background: var(--primary-gradient);
        color: white;
        border-color: transparent;
    }
    
    .search-results-container {
        min-height: 400px;
    }
    
    .user-card {
        background: white;
        border-radius: 16px;
        padding: 1.5rem;
        margin-bottom: 1rem;
        box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
        transition: all 0.3s ease;
        cursor: pointer;
    }
    
    [data-bs-theme="dark"] .user-card {
        background: rgba(26, 26, 46, 0.6);
    }
    
    .user-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 24px rgba(102, 126, 234, 0.15);
    }
    
    .user-card-header {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-bottom: 1rem;
    }
    
    .user-avatar-large {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background: var(--primary-gradient);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        font-weight: 600;
    }
    
    .user-info h4 {
        margin-bottom: 0.25rem;
        font-weight: 600;
    }
    
    .user-info p {
        margin-bottom: 0;
        color: #6c757d;
        font-size: 0.875rem;
    }
    
    .user-badges {
        display: flex;
        gap: 0.5rem;
        flex-wrap: wrap;
        margin-bottom: 0.5rem;
    }
    
    .user-badge {
        padding: 0.25rem 0.75rem;
        background: rgba(102, 126, 234, 0.1);
        color: var(--bs-primary);
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 600;
    }
    
    .user-stats {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
        gap: 1rem;
        padding-top: 1rem;
        border-top: 1px solid rgba(0, 0, 0, 0.05);
    }
    
    [data-bs-theme="dark"] .user-stats {
        border-top-color: rgba(255, 255, 255, 0.05);
    }
    
    .user-stat {
        text-align: center;
    }
    
    .user-stat-value {
        font-size: 1.25rem;
        font-weight: 700;
        color: var(--bs-primary);
    }
    
    .user-stat-label {
        font-size: 0.75rem;
        color: #6c757d;
        text-transform: uppercase;
        letter-spacing: 0.05em;
    }
    
    .search-empty {
        text-align: center;
        padding: 4rem 2rem;
    }
    
    .search-empty i {
        font-size: 4rem;
        color: #cbd5e0;
        margin-bottom: 1rem;
    }
    
    .search-empty h3 {
        color: #4a5568;
        margin-bottom: 0.5rem;
    }
    
    .search-empty p {
        color: #718096;
    }
    
    .loading-skeleton {
        background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
        background-size: 200% 100%;
        animation: shimmer 1.5s infinite;
        border-radius: 8px;
        height: 120px;
        margin-bottom: 1rem;
    }
    
    @keyframes shimmer {
        0% { background-position: 200% 0; }
        100% { background-position: -200% 0; }
    }
</style>
@endpush

@section('content')
<div class="search-page-container">
    <!-- Search Header -->
    <div class="search-header fade-in">
        <h1>Search Users</h1>
        <p>Find users, customers, and employees quickly and efficiently</p>
    </div>
    
    <!-- Advanced Search Box -->
    <div class="advanced-search-box fade-in-up">
        <div class="search-main-input">
            <i class="fas fa-search"></i>
            <input type="text" 
                   id="userSearchInput" 
                   placeholder="Search by name, email, ID, or role..." 
                   autocomplete="off"
                   autofocus>
        </div>
        
        <div class="search-filters">
            <button class="filter-chip active" data-type="all">
                <i class="fas fa-users me-1"></i> All Users
            </button>
            <button class="filter-chip" data-type="customers">
                <i class="fas fa-user me-1"></i> Customers
            </button>
            <button class="filter-chip" data-type="employees">
                <i class="fas fa-user-tie me-1"></i> Employees
            </button>
            <button class="filter-chip" data-type="admin">
                <i class="fas fa-user-shield me-1"></i> Admins
            </button>
        </div>
        
        <div class="row">
            <div class="col-md-3">
                <select class="form-select" id="statusFilter">
                    <option value="">All Status</option>
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                    <option value="pending">Pending</option>
                </select>
            </div>
            <div class="col-md-3">
                <select class="form-select" id="sortBy">
                    <option value="name">Sort by Name</option>
                    <option value="created_at">Sort by Date</option>
                    <option value="email">Sort by Email</option>
                </select>
            </div>
            <div class="col-md-3">
                <button class="btn btn-modern btn-modern-primary w-100" id="searchButton">
                    <i class="fas fa-search me-2"></i> Search
                </button>
            </div>
            <div class="col-md-3">
                <button class="btn btn-modern btn-modern-ghost w-100" id="resetButton">
                    <i class="fas fa-redo me-2"></i> Reset
                </button>
            </div>
        </div>
    </div>
    
    <!-- Search Results -->
    <div class="search-results-container" id="searchResults">
        <!-- Initial state -->
        <div class="search-empty">
            <i class="fas fa-search"></i>
            <h3>Start Searching</h3>
            <p>Enter a search term above to find users</p>
        </div>
    </div>
</div>
@endsection

@push('after-scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('userSearchInput');
    const searchButton = document.getElementById('searchButton');
    const resetButton = document.getElementById('resetButton');
    const resultsContainer = document.getElementById('searchResults');
    const filterChips = document.querySelectorAll('.filter-chip');
    const statusFilter = document.getElementById('statusFilter');
    const sortBy = document.getElementById('sortBy');
    
    let currentFilter = 'all';
    let searchTimeout;
    
    // Filter chip handling
    filterChips.forEach(chip => {
        chip.addEventListener('click', function() {
            filterChips.forEach(c => c.classList.remove('active'));
            this.classList.add('active');
            currentFilter = this.dataset.type;
            performSearch();
        });
    });
    
    // Search input handling
    searchInput.addEventListener('input', function() {
        clearTimeout(searchTimeout);
        if (this.value.length >= 2) {
            searchTimeout = setTimeout(performSearch, 300);
        }
    });
    
    // Search button
    searchButton.addEventListener('click', performSearch);
    
    // Reset button
    resetButton.addEventListener('click', function() {
        searchInput.value = '';
        statusFilter.value = '';
        sortBy.value = 'name';
        filterChips.forEach(c => c.classList.remove('active'));
        filterChips[0].classList.add('active');
        currentFilter = 'all';
        resultsContainer.innerHTML = `
            <div class="search-empty">
                <i class="fas fa-search"></i>
                <h3>Start Searching</h3>
                <p>Enter a search term above to find users</p>
            </div>
        `;
    });
    
    // Keyboard shortcut (Ctrl/Cmd + K)
    document.addEventListener('keydown', function(e) {
        if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
            e.preventDefault();
            searchInput.focus();
            searchInput.select();
        }
    });
    
    function performSearch() {
        const query = searchInput.value.trim();
        
        if (query.length < 2 && currentFilter === 'all') {
            return;
        }
        
        // Show loading
        showLoading();
        
        // Determine search type based on filter
        let searchType = 'customers';
        if (currentFilter === 'employees' || currentFilter === 'admin') {
            searchType = 'employees';
        }
        
        // Make API call
        fetch(`{{ route('backend.get_search_data') }}?type=${searchType}&q=${query}`)
            .then(response => response.json())
            .then(data => {
                displayResults(data.results || []);
            })
            .catch(error => {
                console.error('Search error:', error);
                showError();
            });
    }
    
    function showLoading() {
        resultsContainer.innerHTML = `
            <div class="loading-skeleton"></div>
            <div class="loading-skeleton"></div>
            <div class="loading-skeleton"></div>
        `;
    }
    
    function displayResults(users) {
        if (users.length === 0) {
            resultsContainer.innerHTML = `
                <div class="search-empty">
                    <i class="fas fa-search-minus"></i>
                    <h3>No Results Found</h3>
                    <p>Try adjusting your search terms or filters</p>
                </div>
            `;
            return;
        }
        
        let html = `<h5 class="mb-3">Found ${users.length} users</h5>`;
        
        users.forEach(user => {
            const initials = user.text.split(' ').map(n => n[0]).join('').toUpperCase().slice(0, 2);
            
            html += `
                <div class="user-card fade-in-up" onclick="window.location.href='/app/users/${user.id}'">
                    <div class="user-card-header">
                        <div class="user-avatar-large">
                            ${initials}
                        </div>
                        <div class="user-info flex-grow-1">
                            <h4>${user.text}</h4>
                            <p>ID: ${user.id}</p>
                            <div class="user-badges">
                                <span class="user-badge">
                                    <i class="fas fa-${currentFilter === 'employees' ? 'user-tie' : 'user'} me-1"></i>
                                    ${currentFilter === 'employees' ? 'Employee' : 'Customer'}
                                </span>
                                <span class="user-badge" style="background: rgba(16, 185, 129, 0.1); color: #10b981;">
                                    <i class="fas fa-check-circle me-1"></i> Active
                                </span>
                            </div>
                        </div>
                        <div>
                            <i class="fas fa-chevron-right text-muted"></i>
                        </div>
                    </div>
                    <div class="user-stats">
                        <div class="user-stat">
                            <div class="user-stat-value">--</div>
                            <div class="user-stat-label">Orders</div>
                        </div>
                        <div class="user-stat">
                            <div class="user-stat-value">--</div>
                            <div class="user-stat-label">Revenue</div>
                        </div>
                        <div class="user-stat">
                            <div class="user-stat-value">--</div>
                            <div class="user-stat-label">Last Active</div>
                        </div>
                    </div>
                </div>
            `;
        });
        
        resultsContainer.innerHTML = html;
    }
    
    function showError() {
        resultsContainer.innerHTML = `
            <div class="search-empty">
                <i class="fas fa-exclamation-triangle text-warning"></i>
                <h3>Search Error</h3>
                <p>Something went wrong. Please try again.</p>
            </div>
        `;
    }
});
</script>
@endpush 