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
        gap: 12px;
        margin-top: 20px;
    }

    .social-btn {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 12px 20px;
        border: 2px solid #e1e5ee;
        border-radius: 10px;
        background: #fff;
        color: #333;
        text-decoration: none;
        font-weight: 500;
        font-size: 14px;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .social-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .social-btn i {
        margin-right: 8px;
        font-size: 18px;
    }

    .social-btn.google {
        border-color: #ea4335;
        color: #ea4335;
    }

    .social-btn.google:hover {
        background: #ea4335;
        color: white;
        border-color: #ea4335;
    }

    .social-btn.facebook {
        border-color: #1877f2;
        color: #1877f2;
    }

    .social-btn.facebook:hover {
        background: #1877f2;
        color: white;
        border-color: #1877f2;
    }

    .social-btn.github {
        border-color: #333;
        color: #333;
    }

    .social-btn.github:hover {
        background: #333;
        color: white;
        border-color: #333;
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
        <span>Google</span>
    </a>
    @endif

    @if(config('services.facebook.client_id'))
    <a href="{{ route('social.login', 'facebook') }}" class="social-btn facebook">
        <i class="fab fa-facebook-f"></i>
        <span>Facebook</span>
    </a>
    @endif

    @if(config('services.github.client_id'))
    <a href="{{ route('social.login', 'github') }}" class="social-btn github">
        <i class="fab fa-github"></i>
        <span>GitHub</span>
    </a>
    @endif
</div>
@endif
