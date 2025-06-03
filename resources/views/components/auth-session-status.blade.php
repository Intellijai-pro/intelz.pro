@props(['status'])

@if ($status)
    <style>
        .alert-success {
            background: rgba(0, 255, 0, 0.1);
            border: 1px solid rgba(0, 255, 0, 0.3);
            border-radius: 10px;
            padding: 15px 20px;
            margin-bottom: 20px;
            color: #00ff00;
            font-size: 14px;
            font-family: 'Rajdhani', sans-serif;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
            animation: successGlow 2s ease-in-out infinite, slideInDown 0.5s ease-out;
        }

        .alert-success::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, #00ff00, transparent);
            animation: scanSuccess 2s linear infinite;
        }

        @keyframes scanSuccess {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        @keyframes successGlow {
            0%, 100% { box-shadow: 0 0 10px rgba(0, 255, 0, 0.3); }
            50% { box-shadow: 0 0 20px rgba(0, 255, 0, 0.5); }
        }

        .alert-success::after {
            content: '✓ VERIFIED';
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 10px;
            font-weight: 700;
            color: #00ff00;
            opacity: 0.5;
            letter-spacing: 2px;
        }

        .success-icon {
            background: rgba(0, 255, 0, 0.2);
            border: 1px solid #00ff00;
            color: #00ff00;
            width: 24px;
            height: 24px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            font-weight: bold;
            filter: drop-shadow(0 0 5px #00ff00);
            animation: iconPulse 2s ease-in-out infinite;
        }

        @keyframes iconPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
    
    <div {{ $attributes->merge(['class' => 'alert-success']) }}>
        <div class="success-icon">✓</div>
        {{ $status }}
    </div>
@endif
