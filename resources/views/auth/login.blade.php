<x-auth-layout>
  <x-slot name="title">
    @lang('Login')
  </x-slot>

  <style>
    /* Futuristic AI-Inspired Design */
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700;900&family=Rajdhani:wght@300;400;500;600;700&display=swap');

    body {
      background: #0a0a0a;
      min-height: 100vh;
      font-family: 'Rajdhani', sans-serif;
      overflow-x: hidden;
      position: relative;
    }

    /* Animated Background */
    body::before {
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
    }

    /* Grid Pattern Overlay */
    body::after {
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
    }

    @keyframes backgroundPulse {
      0%, 100% { opacity: 1; }
      50% { opacity: 0.8; }
    }

    @keyframes gridMove {
      0% { transform: translate(0, 0); }
      100% { transform: translate(50px, 50px); }
    }

    /* Floating Particles */
    .particles {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      z-index: 1;
    }

    .particle {
      position: absolute;
      width: 2px;
      height: 2px;
      background: #00ffff;
      box-shadow: 0 0 10px #00ffff;
      animation: float 20s infinite linear;
    }

    @keyframes float {
      0% {
        transform: translateY(100vh) translateX(0);
        opacity: 0;
      }
      10% {
        opacity: 1;
      }
      90% {
        opacity: 1;
      }
      100% {
        transform: translateY(-100vh) translateX(100px);
        opacity: 0;
      }
    }

    .auth-container {
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
      position: relative;
      z-index: 10;
    }

    /* Futuristic Card */
    .auth-card {
      background: rgba(10, 10, 10, 0.9);
      backdrop-filter: blur(20px);
      border: 1px solid rgba(0, 255, 255, 0.3);
      border-radius: 20px;
      padding: 50px 40px;
      max-width: 450px;
      width: 100%;
      position: relative;
      overflow: hidden;
      box-shadow: 
        0 0 50px rgba(0, 255, 255, 0.2),
        inset 0 0 20px rgba(0, 255, 255, 0.05);
      animation: cardGlow 4s ease-in-out infinite alternate;
    }

    @keyframes cardGlow {
      0% {
        box-shadow: 
          0 0 50px rgba(0, 255, 255, 0.2),
          inset 0 0 20px rgba(0, 255, 255, 0.05);
      }
      100% {
        box-shadow: 
          0 0 80px rgba(255, 0, 255, 0.3),
          inset 0 0 30px rgba(255, 0, 255, 0.08);
      }
    }

    /* Animated Corner Accents */
    .auth-card::before,
    .auth-card::after {
      content: '';
      position: absolute;
      width: 100px;
      height: 100px;
      border: 2px solid transparent;
    }

    .auth-card::before {
      top: -2px;
      left: -2px;
      border-top-color: #00ffff;
      border-left-color: #00ffff;
      border-radius: 20px 0 0 0;
      animation: cornerGlow1 3s linear infinite;
    }

    .auth-card::after {
      bottom: -2px;
      right: -2px;
      border-bottom-color: #ff00ff;
      border-right-color: #ff00ff;
      border-radius: 0 0 20px 0;
      animation: cornerGlow2 3s linear infinite;
    }

    @keyframes cornerGlow1 {
      0%, 100% { opacity: 0.3; }
      50% { opacity: 1; }
    }

    @keyframes cornerGlow2 {
      0%, 100% { opacity: 1; }
      50% { opacity: 0.3; }
    }

    /* Logo Container */
    .logo-container {
      text-align: center;
      margin-bottom: 30px;
      position: relative;
    }

    .logo-container img {
      max-height: 70px;
      width: auto;
      filter: brightness(1.2) contrast(1.1);
    }

    /* Futuristic Title */
    .auth-title {
      font-family: 'Orbitron', monospace;
      font-size: 32px;
      font-weight: 900;
      text-align: center;
      margin-bottom: 10px;
      background: linear-gradient(45deg, #00ffff, #ff00ff, #00ffff);
      background-size: 200% 200%;
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      animation: gradientShift 3s ease infinite;
      text-transform: uppercase;
      letter-spacing: 3px;
    }

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .auth-subtitle {
      text-align: center;
      color: #888;
      margin-bottom: 40px;
      font-size: 16px;
      font-weight: 300;
      letter-spacing: 1px;
    }

    /* Futuristic Form Groups */
    .form-group {
      position: relative;
      margin-bottom: 30px;
    }

    .form-label {
      display: block;
      margin-bottom: 10px;
      color: #00ffff;
      font-size: 12px;
      text-transform: uppercase;
      letter-spacing: 2px;
      font-weight: 500;
    }

    .form-control {
      width: 100%;
      padding: 15px 20px 15px 50px;
      background: rgba(0, 255, 255, 0.05);
      border: 1px solid rgba(0, 255, 255, 0.2);
      border-radius: 10px;
      color: #fff;
      font-size: 16px;
      font-family: 'Rajdhani', sans-serif;
      transition: all 0.3s ease;
      position: relative;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, 0.3);
    }

    .form-control:focus {
      outline: none;
      background: rgba(0, 255, 255, 0.08);
      border-color: #00ffff;
      box-shadow: 
        0 0 20px rgba(0, 255, 255, 0.3),
        inset 0 0 10px rgba(0, 255, 255, 0.1);
    }

    /* Glowing Icons */
    .form-icon {
      position: absolute;
      left: 20px;
      top: 50%;
      transform: translateY(-50%);
      color: #00ffff;
      transition: all 0.3s ease;
      filter: drop-shadow(0 0 5px currentColor);
    }

    .form-control:focus ~ .form-icon {
      filter: drop-shadow(0 0 10px currentColor);
      transform: translateY(-50%) scale(1.1);
    }

    /* Cyberpunk Checkbox */
    .cyber-checkbox {
      display: flex;
      align-items: center;
      cursor: pointer;
      user-select: none;
    }

    .cyber-checkbox input[type="checkbox"] {
      display: none;
    }

    .cyber-checkbox .checkbox-custom {
      width: 20px;
      height: 20px;
      border: 2px solid rgba(0, 255, 255, 0.5);
      border-radius: 4px;
      margin-right: 10px;
      position: relative;
      transition: all 0.3s ease;
    }

    .cyber-checkbox input[type="checkbox"]:checked ~ .checkbox-custom {
      background: rgba(0, 255, 255, 0.2);
      border-color: #00ffff;
      box-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
    }

    .cyber-checkbox input[type="checkbox"]:checked ~ .checkbox-custom::after {
      content: '✓';
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      color: #00ffff;
      font-weight: bold;
    }

    .cyber-checkbox span {
      color: #888;
      font-size: 14px;
    }

    /* Futuristic Button */
    .btn-login {
      width: 100%;
      padding: 16px;
      background: linear-gradient(45deg, #00ffff, #ff00ff);
      color: #000;
      border: none;
      border-radius: 10px;
      font-size: 16px;
      font-weight: 700;
      font-family: 'Orbitron', monospace;
      text-transform: uppercase;
      letter-spacing: 2px;
      cursor: pointer;
      position: relative;
      overflow: hidden;
      transition: all 0.3s ease;
    }

    .btn-login::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
      transition: left 0.5s ease;
    }

    .btn-login:hover::before {
      left: 100%;
    }

    .btn-login:hover {
      transform: translateY(-2px);
      box-shadow: 
        0 10px 30px rgba(0, 255, 255, 0.5),
        0 0 50px rgba(255, 0, 255, 0.3);
    }

    .btn-login:active {
      transform: translateY(0);
    }

    /* Loading State */
    .btn-login.loading {
      pointer-events: none;
      opacity: 0.8;
    }

    .btn-login.loading .btn-text {
      opacity: 0.5;
    }

    /* Forgot Password Link */
    .forgot-link {
      color: #ff00ff;
      text-decoration: none;
      font-size: 14px;
      transition: all 0.3s ease;
      position: relative;
    }

    .forgot-link:hover {
      color: #00ffff;
      text-shadow: 0 0 10px currentColor;
    }

    /* Social Divider */
    .social-divider {
      text-align: center;
      margin: 40px 0 30px;
      position: relative;
    }

    .social-divider span {
      background: rgba(10, 10, 10, 0.9);
      padding: 0 20px;
      color: #666;
      font-size: 12px;
      text-transform: uppercase;
      letter-spacing: 2px;
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
      background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 0.3), transparent);
    }

    /* Register Link */
    .register-link {
      text-align: center;
      margin-top: 30px;
      color: #888;
      font-size: 14px;
    }

    .register-link a {
      color: #00ffff;
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .register-link a:hover {
      color: #ff00ff;
      text-shadow: 0 0 10px currentColor;
    }

    /* Scanning Line Animation */
    .scan-line {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 2px;
      background: linear-gradient(90deg, transparent, #00ffff, transparent);
      animation: scan 3s linear infinite;
      pointer-events: none;
    }

    @keyframes scan {
      0% { top: 0; }
      100% { top: 100%; }
    }

    /* Responsive */
    @media (max-width: 480px) {
      .auth-card {
        padding: 40px 25px;
      }
      
      .auth-title {
        font-size: 24px;
      }
    }

    /* Circuit Pattern Decoration */
    .circuit-pattern {
      position: absolute;
      width: 100%;
      height: 100%;
      pointer-events: none;
      opacity: 0.05;
    }

    .circuit-line {
      position: absolute;
      background: #00ffff;
      animation: circuitGlow 4s ease-in-out infinite;
    }

    @keyframes circuitGlow {
      0%, 100% { opacity: 0.05; }
      50% { opacity: 0.2; }
    }
  </style>

  <!-- Particles -->
  <div class="particles" id="particles"></div>

  <div class="auth-container">
    <div class="auth-card">
      <!-- Scanning Line Effect -->
      <div class="scan-line"></div>

      <!-- Circuit Pattern -->
      <div class="circuit-pattern">
        <div class="circuit-line" style="width: 100px; height: 1px; top: 20%; left: -50px;"></div>
        <div class="circuit-line" style="width: 1px; height: 80px; top: 20%; left: 50px;"></div>
        <div class="circuit-line" style="width: 150px; height: 1px; bottom: 30%; right: -50px;"></div>
        <div class="circuit-line" style="width: 1px; height: 100px; bottom: 30%; right: 100px;"></div>
      </div>

      <!-- Logo -->
      <div class="logo-container">
        <a href="/">
          <x-application-logo />
        </a>
      </div>

      <!-- Title -->
      <h1 class="auth-title">Neural Access</h1>
      <p class="auth-subtitle">Initialize authentication sequence</p>

      <!-- Session Status -->
      <x-auth-session-status class="mb-3" :status="session('status')" />

      <!-- Validation Errors -->
      <x-auth-validation-errors class="mb-3" :errors="$errors" />

      <form method="POST" action="{{ $url ?? route('login') }}" id="loginForm">
        @csrf

        <!-- Email Address -->
        <div class="form-group">
          <label for="email" class="form-label">User Identifier</label>
          <input 
            id="email" 
            type="email" 
            name="email" 
            class="form-control" 
            value="{{ old('email') }}" 
            placeholder="Enter your email interface"
            required 
            autofocus
          >
          <i class="fas fa-at form-icon"></i>
        </div>

        <!-- Password -->
        <div class="form-group">
          <label for="password" class="form-label">Access Code</label>
          <input 
            id="password" 
            type="password" 
            name="password" 
            class="form-control" 
            placeholder="Enter secure passcode"
            required 
            autocomplete="current-password"
          >
          <i class="fas fa-fingerprint form-icon"></i>
        </div>

        <!-- Remember Me & Forgot Password -->
        <div class="remember-forgot" style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
          <label class="cyber-checkbox">
            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}>
            <div class="checkbox-custom"></div>
            <span>Maintain session</span>
          </label>
          
          @if (Route::has('password.request'))
          <a href="{{ route('password.request') }}" class="forgot-link">
            Reset access code
          </a>
          @endif
        </div>

        <!-- Login Button -->
        <button type="submit" class="btn-login" id="loginBtn">
          <span class="btn-text">AUTHENTICATE</span>
        </button>
      </form>

      <!-- Social Login -->
      @if(config('services.google.client_id') || config('services.facebook.client_id'))
      <div class="social-divider">
        <span>Alternative Access</span>
      </div>
      <x-auth-social-login />
      @endif

      <!-- Register Link -->
      @if (Route::has('register'))
      <div class="register-link">
        New to the system? <a href="{{ route('register') }}">Create neural link</a>
      </div>
      @endif
    </div>
  </div>

  <script>
    // Generate floating particles
    const particlesContainer = document.getElementById('particles');
    const particleCount = 50;

    for (let i = 0; i < particleCount; i++) {
      const particle = document.createElement('div');
      particle.className = 'particle';
      particle.style.left = Math.random() * 100 + '%';
      particle.style.animationDelay = Math.random() * 20 + 's';
      particle.style.animationDuration = (15 + Math.random() * 10) + 's';
      particlesContainer.appendChild(particle);
    }

    // Form submission
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      const btn = document.getElementById('loginBtn');
      btn.classList.add('loading');
      btn.querySelector('.btn-text').innerHTML = 'AUTHENTICATING...';
    });

    // Password visibility with futuristic effect
    const passwordInput = document.getElementById('password');
    const passwordIcon = passwordInput.nextElementSibling;
    
    const eyeIcon = document.createElement('i');
    eyeIcon.className = 'fas fa-eye form-icon';
    eyeIcon.style.right = '20px';
    eyeIcon.style.left = 'auto';
    eyeIcon.style.cursor = 'pointer';
    eyeIcon.style.color = '#ff00ff';
    passwordInput.parentElement.appendChild(eyeIcon);
    
    eyeIcon.addEventListener('click', function() {
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        eyeIcon.className = 'fas fa-eye-slash form-icon';
        eyeIcon.style.filter = 'drop-shadow(0 0 10px currentColor)';
      } else {
        passwordInput.type = 'password';
        eyeIcon.className = 'fas fa-eye form-icon';
      }
      eyeIcon.style.right = '20px';
      eyeIcon.style.left = 'auto';
      eyeIcon.style.cursor = 'pointer';
      eyeIcon.style.color = '#ff00ff';
    });

    // Add typing effect to inputs
    const inputs = document.querySelectorAll('.form-control');
    inputs.forEach(input => {
      input.addEventListener('input', function() {
        if (this.value.length > 0) {
          this.style.boxShadow = '0 0 20px rgba(0, 255, 255, 0.4), inset 0 0 10px rgba(0, 255, 255, 0.2)';
        } else {
          this.style.boxShadow = '';
        }
      });
    });
  </script>

</x-auth-layout>
