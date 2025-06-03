{{-- @if(env('FACEBOOK_ACTIVE') || env('GITHUB_ACTIVE') || env('GOOGLE_ACTIVE'))
<div class="mb-4">
    <div class="text-center mt-2 mb-4">
        Sign in with social profiles
    </div>

    <div class="pb-4 text-center">
        @if(env('FACEBOOK_ACTIVE'))
        <x-button-a href="{{route('social.login', 'facebook')}}" class="btn-outline-secondary">
            <span class="">Facebook</span>
        </x-button-a>
        @endif

        @if(env('GITHUB_ACTIVE'))
        <x-button-a href="{{route('social.login', 'github')}}" class="btn-outline-secondary">
            <span class="">Github</span>
        </x-button-a>
        @endif

        @if(env('GOOGLE_ACTIVE'))
        <x-button-a href="{{route('social.login', 'google')}}" class="btn-outline-secondary">
            <span class="">Google</span>
        </x-button-a>
        @endif
    </div>

    <hr>
</div>
@endif --}}

@if(config('services.facebook.client_id') || config('services.github.client_id') || config('services.google.client_id'))
<style>
    .social-login-container {
        display: flex;
        gap: 15px;
        margin-top: 20px;
    }

    .social-btn {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 12px 20px;
        border: 1px solid rgba(0, 255, 255, 0.3);
        border-radius: 10px;
        background: rgba(0, 255, 255, 0.05);
        color: #00ffff;
        text-decoration: none;
        font-weight: 600;
        font-size: 14px;
        font-family: 'Rajdhani', sans-serif;
        text-transform: uppercase;
        letter-spacing: 1px;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .social-btn::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 0.3), transparent);
        transition: left 0.5s ease;
    }

    .social-btn:hover::before {
        left: 100%;
    }

    .social-btn:hover {
        transform: translateY(-2px);
        background: rgba(0, 255, 255, 0.1);
        border-color: #00ffff;
        box-shadow: 
            0 0 20px rgba(0, 255, 255, 0.5),
            inset 0 0 10px rgba(0, 255, 255, 0.2);
    }

    .social-btn i {
        margin-right: 8px;
        font-size: 18px;
        filter: drop-shadow(0 0 3px currentColor);
    }

    .social-btn.google {
        color: #ea4335;
        border-color: rgba(234, 67, 53, 0.5);
        background: rgba(234, 67, 53, 0.1);
    }

    .social-btn.google:hover {
        border-color: #ea4335;
        background: rgba(234, 67, 53, 0.2);
        box-shadow: 
            0 0 20px rgba(234, 67, 53, 0.5),
            inset 0 0 10px rgba(234, 67, 53, 0.2);
    }

    .social-btn.facebook {
        color: #1877f2;
        border-color: rgba(24, 119, 242, 0.5);
        background: rgba(24, 119, 242, 0.1);
    }

    .social-btn.facebook:hover {
        border-color: #1877f2;
        background: rgba(24, 119, 242, 0.2);
        box-shadow: 
            0 0 20px rgba(24, 119, 242, 0.5),
            inset 0 0 10px rgba(24, 119, 242, 0.2);
    }

    .social-btn.github {
        color: #ffffff;
        border-color: rgba(255, 255, 255, 0.3);
        background: rgba(255, 255, 255, 0.05);
    }

    .social-btn.github:hover {
        border-color: #ffffff;
        background: rgba(255, 255, 255, 0.1);
        box-shadow: 
            0 0 20px rgba(255, 255, 255, 0.5),
            inset 0 0 10px rgba(255, 255, 255, 0.2);
    }

    /* Holographic effect on hover */
    .social-btn:hover i {
        animation: iconPulse 1s ease-in-out infinite;
    }

    @keyframes iconPulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.1); }
    }

    /* Icon only on mobile */
    @media (max-width: 480px) {
        .social-btn span {
            display: none;
        }
        
        .social-btn i {
            margin-right: 0;
        }
    }
</style>

<div class="social-login-container">
    @if(config('services.google.client_id'))
    <a href="{{ route('social.login', 'google') }}" class="social-btn google">
        <i class="fab fa-google"></i>
        <span>GOOGLE</span>
    </a>
    @endif

    @if(config('services.facebook.client_id'))
    <a href="{{ route('social.login', 'facebook') }}" class="social-btn facebook">
        <i class="fab fa-facebook-f"></i>
        <span>META</span>
    </a>
    @endif

    @if(config('services.github.client_id'))
    <a href="{{ route('social.login', 'github') }}" class="social-btn github">
        <i class="fab fa-github"></i>
        <span>GITHUB</span>
    </a>
    @endif
</div>
@endif
