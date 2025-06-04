/**
 * Navbar Search Center JavaScript
 * Ensures search bar stays centered in navbar
 */

(function() {
    'use strict';

    document.addEventListener('DOMContentLoaded', function() {
        centerSearchBar();
        
        // Re-center on window resize
        let resizeTimeout;
        window.addEventListener('resize', function() {
            clearTimeout(resizeTimeout);
            resizeTimeout = setTimeout(centerSearchBar, 250);
        });
    });

    function centerSearchBar() {
        const searchContainer = document.querySelector('.modern-search-container');
        const navbar = document.querySelector('.iq-navbar');
        
        if (!searchContainer || !navbar) return;
        
        // Remove any inline styles that might conflict
        const inlineStyles = searchContainer.getAttribute('style');
        if (inlineStyles && inlineStyles.includes('max-width: 500px')) {
            searchContainer.style.removeProperty('max-width');
        }
        
        // Ensure proper positioning
        searchContainer.style.position = 'absolute';
        searchContainer.style.left = '50%';
        searchContainer.style.top = '50%';
        searchContainer.style.transform = 'translate(-50%, -50%)';
        searchContainer.style.zIndex = '10';
        
        // Remove conflicting classes
        searchContainer.classList.remove('mx-3');
        searchContainer.classList.remove('flex-grow-1');
        
        // Ensure parent has relative positioning
        const navbarInner = navbar.querySelector('.container-fluid, .navbar-inner');
        if (navbarInner) {
            navbarInner.style.position = 'relative';
            navbarInner.style.height = '100%';
        }
    }

    // Also run after a slight delay to catch any late-loading elements
    window.addEventListener('load', function() {
        setTimeout(centerSearchBar, 100);
    });

})(); 