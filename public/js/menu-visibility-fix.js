/**
 * Menu Visibility Fix
 * Ensures all dropdown menus and popups are fully visible
 */

(function() {
    'use strict';

    // Wait for DOM to be ready
    document.addEventListener('DOMContentLoaded', function() {
        initMenuVisibilityFixes();
        ensureProperSpacing();
    });

    function initMenuVisibilityFixes() {
        // Fix dropdown positioning
        fixDropdownPositioning();
        
        // Fix notification dropdown
        fixNotificationDropdown();
        
        // Fix sidebar submenu
        fixSidebarSubmenus();
        
        // Fix header overflow
        fixHeaderOverflow();
        
        // Monitor for dynamic content
        observeDynamicContent();
    }

    function fixDropdownPositioning() {
        // Get all dropdowns
        const dropdowns = document.querySelectorAll('.dropdown');
        
        dropdowns.forEach(dropdown => {
            const toggle = dropdown.querySelector('.dropdown-toggle');
            const menu = dropdown.querySelector('.dropdown-menu');
            
            if (toggle && menu) {
                toggle.addEventListener('click', function(e) {
                    setTimeout(() => {
                        positionDropdown(menu);
                    }, 10);
                });
            }
        });
    }

    function positionDropdown(menu) {
        if (!menu || !menu.classList.contains('show')) return;
        
        const rect = menu.getBoundingClientRect();
        const viewportHeight = window.innerHeight;
        const viewportWidth = window.innerWidth;
        
        // Reset positioning
        menu.style.transform = '';
        menu.style.top = '';
        menu.style.left = '';
        menu.style.right = '';
        
        // Check if menu goes beyond viewport bottom
        if (rect.bottom > viewportHeight) {
            const parent = menu.parentElement.getBoundingClientRect();
            menu.style.top = 'auto';
            menu.style.bottom = (parent.height + 10) + 'px';
        }
        
        // Check if menu goes beyond viewport right
        if (rect.right > viewportWidth) {
            menu.style.left = 'auto';
            menu.style.right = '0';
        }
        
        // Check if menu goes beyond viewport left
        if (rect.left < 0) {
            menu.style.left = '0';
            menu.style.right = 'auto';
        }
    }

    function fixNotificationDropdown() {
        const notificationDropdowns = document.querySelectorAll('.notification_list, .iq-user-dropdown');
        
        notificationDropdowns.forEach(dropdown => {
            dropdown.addEventListener('click', function(e) {
                const submenu = this.querySelector('.iq-sub-dropdown');
                if (submenu) {
                    setTimeout(() => {
                        positionNotificationDropdown(submenu);
                    }, 10);
                }
            });
        });
    }

    function positionNotificationDropdown(dropdown) {
        if (!dropdown) return;
        
        const rect = dropdown.getBoundingClientRect();
        const viewportWidth = window.innerWidth;
        
        // Ensure dropdown doesn't go off-screen
        if (rect.right > viewportWidth) {
            const overflow = rect.right - viewportWidth;
            dropdown.style.transform = `translateX(-${overflow + 20}px)`;
        }
    }

    function fixSidebarSubmenus() {
        const sidebarMenus = document.querySelectorAll('.iq-sidebar-menu .nav-item');
        
        sidebarMenus.forEach(menuItem => {
            const submenu = menuItem.querySelector('.iq-sub-menu, .collapse');
            if (submenu) {
                menuItem.addEventListener('mouseenter', function() {
                    ensureSubmenuVisible(submenu);
                });
            }
        });
    }

    function ensureSubmenuVisible(submenu) {
        if (!submenu) return;
        
        const rect = submenu.getBoundingClientRect();
        const viewportHeight = window.innerHeight;
        
        if (rect.bottom > viewportHeight) {
            const overflow = rect.bottom - viewportHeight;
            submenu.style.maxHeight = (rect.height - overflow - 20) + 'px';
            submenu.style.overflowY = 'auto';
        }
    }

    function fixHeaderOverflow() {
        const header = document.querySelector('.iq-navbar');
        const headerContainer = document.querySelector('.iq-navbar .container-fluid');
        
        if (header && headerContainer) {
            // Ensure header doesn't cut off content
            header.style.overflow = 'visible';
            headerContainer.style.overflow = 'visible';
            
            // Fix z-index stacking
            const headerElements = header.querySelectorAll('.dropdown, .nav-item, .nav-link');
            headerElements.forEach(el => {
                el.style.position = 'relative';
                el.style.zIndex = '1';
            });
        }
    }

    function observeDynamicContent() {
        // Create observer to watch for dynamically added content
        const observer = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
                if (mutation.addedNodes.length) {
                    // Re-run fixes for new content
                    setTimeout(() => {
                        fixDropdownPositioning();
                        fixNotificationDropdown();
                        fixSidebarSubmenus();
                    }, 100);
                }
            });
        });

        // Observe the entire document for changes
        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    }

    // Handle window resize
    let resizeTimeout;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimeout);
        resizeTimeout = setTimeout(() => {
            // Re-position any open dropdowns
            const openMenus = document.querySelectorAll('.dropdown-menu.show, .iq-sub-dropdown.show');
            openMenus.forEach(menu => {
                positionDropdown(menu);
            });
        }, 250);
    });

    // Fix for Bootstrap dropdown events
    document.addEventListener('shown.bs.dropdown', function(event) {
        const menu = event.target.querySelector('.dropdown-menu');
        if (menu) {
            positionDropdown(menu);
        }
    });

    // Ensure proper z-index stacking on page load
    window.addEventListener('load', function() {
        // Set proper z-index for all major components
        const components = {
            '.sidebar-base': 1025,
            '.iq-navbar': 1030,
            '.dropdown-menu': 1055,
            '.iq-sub-dropdown': 1055,
            '.modal': 1060,
            '.modal-backdrop': 1050,
            '.tooltip': 1070,
            '#loading': 9999
        };

        Object.entries(components).forEach(([selector, zIndex]) => {
            const elements = document.querySelectorAll(selector);
            elements.forEach(el => {
                el.style.zIndex = zIndex;
            });
        });
    });

    // Ensure proper body spacing
    function ensureProperSpacing() {
        const contentInner = document.querySelector('.content-inner');
        const mainContent = document.querySelector('.main-content');
        const navbar = document.querySelector('.iq-navbar');
        const isDashboard = document.querySelector('.dashboard-container, .modern-dashboard, .welcome-section');
        
        if (contentInner) {
            // For dashboard, use minimal padding
            if (isDashboard) {
                contentInner.style.paddingTop = '10px'; // Reduced from 15px
            } else {
                // Force minimum padding for other pages - reduced from 60px to 20px
                const currentPadding = parseInt(window.getComputedStyle(contentInner).paddingTop);
                if (currentPadding < 20) {
                    contentInner.style.paddingTop = '20px';
                }
            }
        }
        
        if (mainContent) {
            // Ensure main content has proper margin for fixed navbar
            mainContent.style.marginTop = 'calc(70px + 15vh)'; // 70px navbar + 15% viewport height
            mainContent.style.paddingTop = '0'; // Remove padding since navbar is fixed
        }
        
        if (navbar) {
            // Ensure navbar is fixed at top
            navbar.style.position = 'fixed';
            navbar.style.top = '0';
            navbar.style.left = '0';
            navbar.style.right = '0';
            navbar.style.marginBottom = '0';
            navbar.style.marginTop = '0';
            navbar.style.zIndex = '9999'; // Highest z-index
            navbar.style.transform = 'none'; // Remove any transform
            navbar.style.width = '100%';
        }
        
        // Special handling for dashboard
        const dashboardContainer = document.querySelector('.dashboard-container');
        if (dashboardContainer) {
            dashboardContainer.style.paddingTop = '0';
            dashboardContainer.style.marginTop = '0';
        }
        
        // Remove wrapper padding
        const wrapper = document.querySelector('.wrapper');
        if (wrapper) {
            wrapper.style.paddingTop = '0';
        }
        
        // Ensure first containers have extra spacing (except dashboard)
        if (!isDashboard) {
            const firstContainers = document.querySelectorAll('.main-content .container-fluid:first-of-type, .main-content .container:first-of-type');
            firstContainers.forEach(container => {
                container.style.paddingTop = '10px'; // Reduced from 20px
            });
        }
        
        // Remove body padding
        document.body.style.paddingTop = '0';
        
        // Additional spacing for first child elements (except dashboard)
        if (!isDashboard) {
            const firstChildren = document.querySelectorAll('.content-inner > div:first-child, .content-inner > section:first-child');
            firstChildren.forEach(child => {
                child.style.marginTop = '0'; // Reduced from 15px to 0
            });
        }
    }

})(); 