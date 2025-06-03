<x-auth-layout>
  <x-slot name="title">
    @lang('Login')
  </x-slot>

  <style>
    /* Modern Login Styles */
    body {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      font-family: 'Inter', sans-serif;
    }

    .auth-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .auth-card {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      border-radius: 20px;
      box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
      padding: 40px;
      max-width: 420px;
      width: 100%;
      transform: translateY(0);
      transition: all 0.3s ease;
    }

    .auth-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 25px 60px rgba(0, 0, 0, 0.2);
    }

    .logo-container {
      text-align: center;
      margin-bottom: 30px;
    }

    .logo-container img {
      max-height: 60px;
      width: auto;
    }

    .auth-title {
      text-align: center;
      font-size: 28px;
      font-weight: 700;
      color: #333;
      margin-bottom: 10px;
    }

    .auth-subtitle {
      text-align: center;
      color: #666;
      margin-bottom: 30px;
      font-size: 16px;
    }

    .form-group {
      position: relative;
      margin-bottom: 25px;
    }

    .form-control {
      width: 100%;
      padding: 12px 15px 12px 45px;
      border: 2px solid #e1e5ee;
      border-radius: 10px;
      font-size: 16px;
      transition: all 0.3s ease;
      background-color: #f8f9fa;
    }

    .form-control:focus {
      outline: none;
      border-color: #667eea;
      background-color: #fff;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    .form-icon {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #999;
      transition: color 0.3s ease;
    }

    .form-control:focus ~ .form-icon {
      color: #667eea;
    }

    .form-label {
      display: block;
      margin-bottom: 8px;
      color: #555;
      font-weight: 500;
      font-size: 14px;
    }

    .remember-forgot {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
    }

    .custom-checkbox {
      display: flex;
      align-items: center;
      cursor: pointer;
    }

    .custom-checkbox input[type="checkbox"] {
      width: 18px;
      height: 18px;
      margin-right: 8px;
      cursor: pointer;
    }

    .forgot-link {
      color: #667eea;
      text-decoration: none;
      font-size: 14px;
      transition: color 0.3s ease;
    }

    .forgot-link:hover {
      color: #764ba2;
      text-decoration: underline;
    }

    .btn-login {
      width: 100%;
      padding: 14px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 10px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .btn-login:hover {
      transform: translateY(-2px);
      box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
    }

    .btn-login:active {
      transform: translateY(0);
    }

    .social-divider {
      text-align: center;
      margin: 30px 0 20px;
      position: relative;
    }

    .social-divider span {
      background: rgba(255, 255, 255, 0.95);
      padding: 0 15px;
      color: #999;
      font-size: 14px;
      position: relative;
      z-index: 1;
    }

    .social-divider::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 0;
      right: 0;
      height: 1px;
      background: #e1e5ee;
    }

    .register-link {
      text-align: center;
      margin-top: 30px;
      color: #666;
      font-size: 14px;
    }

    .register-link a {
      color: #667eea;
      text-decoration: none;
      font-weight: 600;
      transition: color 0.3s ease;
    }

    .register-link a:hover {
      color: #764ba2;
      text-decoration: underline;
    }

    /* Animation */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .auth-card {
      animation: fadeInUp 0.6s ease-out;
    }

    /* Loading state */
    .btn-login.loading {
      pointer-events: none;
      opacity: 0.8;
    }

    .btn-login.loading::after {
      content: '';
      position: absolute;
      width: 20px;
      height: 20px;
      top: 50%;
      left: 50%;
      margin-left: -10px;
      margin-top: -10px;
      border: 2px solid #ffffff;
      border-radius: 50%;
      border-top-color: transparent;
      animation: spinner 0.8s linear infinite;
    }

    @keyframes spinner {
      to { transform: rotate(360deg); }
    }

    /* Responsive */
    @media (max-width: 480px) {
      .auth-card {
        padding: 30px 20px;
      }
      
      .auth-title {
        font-size: 24px;
      }
    }
  </style>

  <div class="auth-container">
    <div class="auth-card">
      <!-- Logo -->
      <div class="logo-container">
        <a href="/">
          <x-application-logo />
        </a>
      </div>

      <!-- Title -->
      <h1 class="auth-title">Welcome Back!</h1>
      <p class="auth-subtitle">Please sign in to continue</p>

      <!-- Session Status -->
      <x-auth-session-status class="mb-3" :status="session('status')" />

      <!-- Validation Errors -->
      <x-auth-validation-errors class="mb-3" :errors="$errors" />

      <form method="POST" action="{{ $url ?? route('login') }}" id="loginForm">
        @csrf

        <!-- Email Address -->
        <div class="form-group">
          <label for="email" class="form-label">Email Address</label>
          <input 
            id="email" 
            type="email" 
            name="email" 
            class="form-control" 
            value="{{ old('email') }}" 
            placeholder="Enter your email"
            required 
            autofocus
          >
          <i class="fas fa-envelope form-icon"></i>
        </div>

        <!-- Password -->
        <div class="form-group">
          <label for="password" class="form-label">Password</label>
          <input 
            id="password" 
            type="password" 
            name="password" 
            class="form-control" 
            placeholder="Enter your password"
            required 
            autocomplete="current-password"
          >
          <i class="fas fa-lock form-icon"></i>
        </div>

        <!-- Remember Me & Forgot Password -->
        <div class="remember-forgot">
          <label class="custom-checkbox">
            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
            <span>Remember me</span>
          </label>
          
          @if (Route::has('password.request'))
          <a href="{{ route('password.request') }}" class="forgot-link">
            Forgot password?
          </a>
          @endif
        </div>

        <!-- Login Button -->
        <button type="submit" class="btn-login" id="loginBtn">
          <span class="btn-text">Sign In</span>
        </button>
      </form>

      <!-- Social Login -->
      @if(config('services.google.client_id') || config('services.facebook.client_id'))
      <div class="social-divider">
        <span>OR CONTINUE WITH</span>
      </div>
      <x-auth-social-login />
      @endif

      <!-- Register Link -->
      @if (Route::has('register'))
      <div class="register-link">
        Don't have an account? <a href="{{ route('register') }}">Sign up</a>
      </div>
      @endif
    </div>
  </div>

  <script>
    // Add loading state to form submission
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      const btn = document.getElementById('loginBtn');
      btn.classList.add('loading');
      btn.querySelector('.btn-text').textContent = 'Signing in...';
    });

    // Password visibility toggle (optional enhancement)
    const passwordInput = document.getElementById('password');
    const passwordIcon = passwordInput.nextElementSibling;
    
    // Add eye icon for password visibility toggle
    const eyeIcon = document.createElement('i');
    eyeIcon.className = 'fas fa-eye form-icon';
    eyeIcon.style.right = '15px';
    eyeIcon.style.left = 'auto';
    eyeIcon.style.cursor = 'pointer';
    passwordInput.parentElement.appendChild(eyeIcon);
    
    eyeIcon.addEventListener('click', function() {
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        eyeIcon.className = 'fas fa-eye-slash form-icon';
      } else {
        passwordInput.type = 'password';
        eyeIcon.className = 'fas fa-eye form-icon';
      }
      eyeIcon.style.right = '15px';
      eyeIcon.style.left = 'auto';
      eyeIcon.style.cursor = 'pointer';
    });
  </script>

</x-auth-layout>
