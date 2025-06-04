/**
 * Modern Dashboard 2025 - Interactive Features
 */

// Theme Manager
class ThemeManager {
    constructor() {
        this.currentTheme = document.documentElement.getAttribute('data-bs-theme') || 'light';
        this.init();
    }

    init() {
        this.createThemeToggle();
        this.attachEventListeners();
        this.syncWithExistingTheme();
    }

    createThemeToggle() {
        // Create theme toggle button if it doesn't exist
        if (!document.querySelector('.theme-toggle-modern')) {
            const headerActions = document.querySelector('.header-modern-actions');
            if (!headerActions) {
                // If modern header doesn't exist, add to existing header
                const existingHeader = document.querySelector('.iq-navbar .navbar-nav');
                if (existingHeader) {
                    const toggleLi = document.createElement('li');
                    toggleLi.className = 'nav-item';
                    toggleLi.innerHTML = `
                        <button class="btn btn-link theme-toggle-modern nav-link" title="Toggle Theme">
                            <i class="fas fa-moon" id="theme-icon"></i>
                        </button>
                    `;
                    existingHeader.appendChild(toggleLi);
                }
            } else {
                const toggleBtn = document.createElement('div');
                toggleBtn.className = 'header-modern-action theme-toggle-modern';
                toggleBtn.innerHTML = '<i class="fas fa-moon" id="theme-icon"></i>';
                toggleBtn.title = 'Toggle Theme';
                headerActions.appendChild(toggleBtn);
            }
        }
        this.updateThemeIcon();
    }

    applyTheme(theme) {
        document.documentElement.setAttribute('data-bs-theme', theme);
        localStorage.setItem('theme', theme);
        this.currentTheme = theme;
        this.updateThemeIcon();
        this.updateCharts();
        
        // Trigger custom event for other components to react
        window.dispatchEvent(new CustomEvent('themeChanged', { detail: { theme } }));
    }

    toggleTheme() {
        const newTheme = this.currentTheme === 'light' ? 'dark' : 'light';
        this.applyTheme(newTheme);
    }

    updateThemeIcon() {
        const icon = document.querySelector('#theme-icon');
        if (icon) {
            icon.className = this.currentTheme === 'light' ? 'fas fa-moon' : 'fas fa-sun';
        }
    }

    syncWithExistingTheme() {
        // Listen for theme changes from other sources
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'attributes' && mutation.attributeName === 'data-bs-theme') {
                    this.currentTheme = document.documentElement.getAttribute('data-bs-theme');
                    this.updateThemeIcon();
                    this.updateCharts();
                }
            });
        });

        observer.observe(document.documentElement, {
            attributes: true,
            attributeFilter: ['data-bs-theme']
        });
    }

    attachEventListeners() {
        // Modern theme toggle
        document.addEventListener('click', (e) => {
            if (e.target.closest('.theme-toggle-modern')) {
                this.toggleTheme();
            }
        });

        // Listen for existing theme toggle if any
        const existingThemeToggle = document.querySelector('[data-setting="color-mode"]');
        if (existingThemeToggle) {
            existingThemeToggle.addEventListener('click', () => {
                setTimeout(() => {
                    this.currentTheme = document.documentElement.getAttribute('data-bs-theme');
                    this.updateThemeIcon();
                }, 100);
            });
        }
    }

    updateCharts() {
        // Update chart colors based on theme
        if (window.Chart) {
            const isDark = this.currentTheme === 'dark';
            
            // Update all chart defaults
            Chart.defaults.color = isDark ? '#E9ECEF' : '#525F7F';
            Chart.defaults.borderColor = isDark ? 'rgba(255, 255, 255, 0.1)' : 'rgba(0, 0, 0, 0.1)';
            Chart.defaults.plugins.legend.labels.color = isDark ? '#E9ECEF' : '#525F7F';
            
            // Update existing charts
            if (window.charts) {
                Object.values(window.charts).forEach(chart => {
                    if (chart && chart.update) {
                        chart.update();
                    }
                });
            }
        }
    }
}

// Notification System
class NotificationSystem {
    constructor() {
        this.container = this.createContainer();
    }

    createContainer() {
        const container = document.createElement('div');
        container.className = 'notification-container';
        container.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 9999;
            display: flex;
            flex-direction: column;
            gap: 10px;
        `;
        document.body.appendChild(container);
        return container;
    }

    show(message, type = 'info', duration = 3000) {
        const notification = document.createElement('div');
        notification.className = `notification glass-card fade-in-up ${type}`;
        notification.style.cssText = `
            padding: 1rem 1.5rem;
            min-width: 300px;
            max-width: 400px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 10px;
            cursor: pointer;
        `;

        const icon = this.getIcon(type);
        const iconElement = document.createElement('i');
        iconElement.className = `fas ${icon}`;
        iconElement.style.fontSize = '1.25rem';

        const messageElement = document.createElement('span');
        messageElement.textContent = message;
        messageElement.style.flex = '1';

        notification.appendChild(iconElement);
        notification.appendChild(messageElement);

        notification.addEventListener('click', () => this.dismiss(notification));

        this.container.appendChild(notification);

        if (duration > 0) {
            setTimeout(() => this.dismiss(notification), duration);
        }

        return notification;
    }

    getIcon(type) {
        const icons = {
            success: 'fa-check-circle',
            error: 'fa-exclamation-circle',
            warning: 'fa-exclamation-triangle',
            info: 'fa-info-circle'
        };
        return icons[type] || icons.info;
    }

    dismiss(notification) {
        notification.style.opacity = '0';
        notification.style.transform = 'translateX(100%)';
        setTimeout(() => notification.remove(), 300);
    }
}

// Dashboard Analytics
class DashboardAnalytics {
    constructor() {
        this.initializeAnalytics();
    }

    initializeAnalytics() {
        this.trackPageViews();
        this.trackInteractions();
    }

    trackPageViews() {
        const pageData = {
            page: 'dashboard',
            timestamp: new Date().toISOString(),
            userAgent: navigator.userAgent
        };
        console.log('Page view tracked:', pageData);
    }

    trackInteractions() {
        document.addEventListener('click', (e) => {
            const target = e.target.closest('[data-track]');
            if (target) {
                const trackData = {
                    action: target.dataset.track,
                    timestamp: new Date().toISOString(),
                    element: target.tagName
                };
                console.log('Interaction tracked:', trackData);
            }
        });
    }
}

// Real-time Data Updater
class RealTimeUpdater {
    constructor() {
        this.updateInterval = 30000; // 30 seconds
        this.isActive = true;
        this.init();
    }

    init() {
        this.startUpdates();
        this.handleVisibilityChange();
    }

    startUpdates() {
        if (this.isActive) {
            this.updateData();
            this.intervalId = setInterval(() => this.updateData(), this.updateInterval);
        }
    }

    stopUpdates() {
        if (this.intervalId) {
            clearInterval(this.intervalId);
        }
    }

    updateData() {
        // Simulate real-time updates
        this.updateStats();
        this.updateNotifications();
    }

    updateStats() {
        const statsElements = document.querySelectorAll('[data-stat-update]');
        statsElements.forEach(element => {
            const currentValue = parseInt(element.textContent.replace(/\D/g, ''));
            const change = Math.floor(Math.random() * 10) - 5; // Random change between -5 and 5
            const newValue = Math.max(0, currentValue + change);
            
            this.animateValue(element, currentValue, newValue, 1000);
        });
    }

    animateValue(element, start, end, duration) {
        const range = end - start;
        const startTime = performance.now();
        
        const animate = (currentTime) => {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            
            const value = Math.floor(start + range * this.easeOutQuart(progress));
            element.textContent = value.toLocaleString();
            
            if (progress < 1) {
                requestAnimationFrame(animate);
            }
        };
        
        requestAnimationFrame(animate);
    }

    easeOutQuart(t) {
        return 1 - Math.pow(1 - t, 4);
    }

    updateNotifications() {
        const random = Math.random();
        if (random > 0.7) {
            const messages = [
                { text: 'New user registered', type: 'success' },
                { text: 'Payment received', type: 'info' },
                { text: 'Server load optimal', type: 'success' },
                { text: 'Report generated', type: 'info' }
            ];
            const message = messages[Math.floor(Math.random() * messages.length)];
            window.notificationSystem.show(message.text, message.type);
        }
    }

    handleVisibilityChange() {
        document.addEventListener('visibilitychange', () => {
            if (document.hidden) {
                this.stopUpdates();
                this.isActive = false;
            } else {
                this.isActive = true;
                this.startUpdates();
            }
        });
    }
}

// Search Functionality
class SearchManager {
    constructor() {
        this.searchInput = document.querySelector('.header-modern-search-input');
        this.init();
    }

    init() {
        if (this.searchInput) {
            this.attachEventListeners();
            this.createSearchResults();
        }
    }

    attachEventListeners() {
        this.searchInput.addEventListener('input', this.debounce(this.handleSearch.bind(this), 300));
        this.searchInput.addEventListener('focus', () => this.showResults());
        this.searchInput.addEventListener('blur', () => {
            setTimeout(() => this.hideResults(), 200);
        });
    }

    createSearchResults() {
        const resultsContainer = document.createElement('div');
        resultsContainer.className = 'search-results glass-card';
        resultsContainer.style.cssText = `
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            margin-top: 8px;
            border-radius: 12px;
            max-height: 400px;
            overflow-y: auto;
            display: none;
            z-index: 1000;
        `;
        this.searchInput.parentElement.appendChild(resultsContainer);
        this.resultsContainer = resultsContainer;
    }

    handleSearch(e) {
        const query = e.target.value.trim();
        if (query.length > 2) {
            this.performSearch(query);
        } else {
            this.hideResults();
        }
    }

    performSearch(query) {
        // Simulate search results
        const results = this.getMockResults(query);
        this.displayResults(results);
    }

    getMockResults(query) {
        const allItems = [
            { type: 'user', title: 'John Doe', subtitle: 'john@example.com', icon: 'fa-user' },
            { type: 'transaction', title: 'Transaction #1234', subtitle: '$250.00', icon: 'fa-receipt' },
            { type: 'report', title: 'Monthly Revenue Report', subtitle: 'Generated 2 days ago', icon: 'fa-file-alt' },
            { type: 'setting', title: 'Payment Settings', subtitle: 'Configure payment methods', icon: 'fa-cog' }
        ];
        
        return allItems.filter(item => 
            item.title.toLowerCase().includes(query.toLowerCase()) ||
            item.subtitle.toLowerCase().includes(query.toLowerCase())
        );
    }

    displayResults(results) {
        if (results.length === 0) {
            this.resultsContainer.innerHTML = `
                <div class="p-3 text-center text-muted">
                    <i class="fas fa-search fa-2x mb-2"></i>
                    <p class="mb-0">No results found</p>
                </div>
            `;
        } else {
            this.resultsContainer.innerHTML = results.map(result => `
                <div class="search-result-item p-3 hover-float" style="cursor: pointer; transition: all 0.3s;">
                    <div class="d-flex align-items-center">
                        <div class="icon-wrapper me-3" style="width: 40px; height: 40px; background: var(--primary-gradient); border-radius: 10px; display: flex; align-items: center; justify-content: center; color: white;">
                            <i class="fas ${result.icon}"></i>
                        </div>
                        <div class="flex-grow-1">
                            <h6 class="mb-0">${result.title}</h6>
                            <small class="text-muted">${result.subtitle}</small>
                        </div>
                        <i class="fas fa-arrow-right text-muted"></i>
                    </div>
                </div>
            `).join('');
        }
        this.showResults();
    }

    showResults() {
        this.resultsContainer.style.display = 'block';
        this.resultsContainer.classList.add('fade-in');
    }

    hideResults() {
        this.resultsContainer.style.display = 'none';
    }

    debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }
}

// Quick Actions Handler
class QuickActionsHandler {
    constructor() {
        this.init();
    }

    init() {
        const quickActionCards = document.querySelectorAll('.quick-action-card');
        quickActionCards.forEach(card => {
            card.addEventListener('click', (e) => this.handleAction(e));
        });
    }

    handleAction(e) {
        const card = e.currentTarget;
        const actionTitle = card.querySelector('h6').textContent;
        
        // Add ripple effect
        this.createRipple(e, card);
        
        // Handle specific actions
        switch(actionTitle) {
            case 'Add New User':
                this.showModal('Add New User', 'User creation form would go here');
                break;
            case 'View Reports':
                this.showModal('Reports', 'Reports dashboard would go here');
                break;
            case 'Settings':
                this.showModal('Settings', 'Settings panel would go here');
                break;
            case 'Export Data':
                this.handleExport();
                break;
        }
    }

    createRipple(e, element) {
        const ripple = document.createElement('span');
        const rect = element.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        const x = e.clientX - rect.left - size / 2;
        const y = e.clientY - rect.top - size / 2;
        
        ripple.style.cssText = `
            position: absolute;
            width: ${size}px;
            height: ${size}px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            pointer-events: none;
            transform: scale(0);
            animation: ripple 0.6s ease-out;
            left: ${x}px;
            top: ${y}px;
        `;
        
        element.style.position = 'relative';
        element.style.overflow = 'hidden';
        element.appendChild(ripple);
        
        setTimeout(() => ripple.remove(), 600);
    }

    showModal(title, content) {
        // Simple modal implementation
        const modal = document.createElement('div');
        modal.className = 'modal fade show';
        modal.style.display = 'block';
        modal.innerHTML = `
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content glass-card">
                    <div class="modal-header">
                        <h5 class="modal-title gradient-text">${title}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p>${content}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-modern btn-modern-ghost" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-modern btn-modern-primary">Save changes</button>
                    </div>
                </div>
            </div>
        `;
        
        const backdrop = document.createElement('div');
        backdrop.className = 'modal-backdrop fade show';
        
        document.body.appendChild(backdrop);
        document.body.appendChild(modal);
        document.body.classList.add('modal-open');
        
        // Close modal functionality
        const closeModal = () => {
            modal.remove();
            backdrop.remove();
            document.body.classList.remove('modal-open');
        };
        
        modal.querySelector('.btn-close').addEventListener('click', closeModal);
        modal.querySelectorAll('[data-bs-dismiss="modal"]').forEach(btn => {
            btn.addEventListener('click', closeModal);
        });
    }

    handleExport() {
        window.notificationSystem.show('Preparing export...', 'info');
        
        // Simulate export process
        setTimeout(() => {
            window.notificationSystem.show('Data exported successfully!', 'success');
            
            // Create download link
            const data = { dashboard: 'Modern Dashboard 2025', timestamp: new Date().toISOString() };
            const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'dashboard-export.json';
            a.click();
            URL.revokeObjectURL(url);
        }, 2000);
    }
}

// Initialize everything when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    // Initialize global systems
    window.themeManager = new ThemeManager();
    window.notificationSystem = new NotificationSystem();
    window.dashboardAnalytics = new DashboardAnalytics();
    window.realTimeUpdater = new RealTimeUpdater();
    window.searchManager = new SearchManager();
    window.quickActionsHandler = new QuickActionsHandler();
    
    // Add smooth scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });
    
    // Add intersection observer for animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);
    
    document.querySelectorAll('.fade-in-up, .slide-in-up, .scale-in').forEach(el => {
        observer.observe(el);
    });
    
    // Show welcome notification
    setTimeout(() => {
        window.notificationSystem.show('Welcome to Modern Dashboard 2025!', 'success', 5000);
    }, 1000);
});

// Add CSS for animations
const style = document.createElement('style');
style.textContent = `
    @keyframes ripple {
        to {
            transform: scale(2);
            opacity: 0;
        }
    }
    
    .animate-in {
        animation-play-state: running !important;
    }
    
    .modal {
        backdrop-filter: blur(5px);
    }
    
    .search-result-item:hover {
        background: rgba(102, 126, 234, 0.05);
        transform: translateX(5px);
    }
`;
document.head.appendChild(style); 