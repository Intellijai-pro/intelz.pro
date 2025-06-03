@props(['errors'])

@if ($errors->any())
    <style>
        .alert-errors {
            background: rgba(255, 0, 0, 0.1);
            border: 1px solid rgba(255, 0, 0, 0.3);
            border-radius: 10px;
            padding: 15px 20px;
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
            animation: errorGlow 2s ease-in-out infinite;
        }

        .alert-errors::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent, #ff0000, transparent);
            animation: scanError 2s linear infinite;
        }

        @keyframes scanError {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        @keyframes errorGlow {
            0%, 100% { box-shadow: 0 0 10px rgba(255, 0, 0, 0.3); }
            50% { box-shadow: 0 0 20px rgba(255, 0, 0, 0.5); }
        }

        .alert-errors ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .alert-errors li {
            color: #ff6b6b;
            font-size: 14px;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            font-family: 'Rajdhani', sans-serif;
            letter-spacing: 0.5px;
        }

        .alert-errors li:last-child {
            margin-bottom: 0;
        }

        .alert-errors li::before {
            content: '⚠';
            margin-right: 10px;
            font-size: 16px;
            color: #ff0000;
            filter: drop-shadow(0 0 3px #ff0000);
            animation: warningPulse 1s ease-in-out infinite;
        }

        @keyframes warningPulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }

        .alert-errors {
            animation: shake 0.5s ease-out, errorGlow 2s ease-in-out infinite;
        }
    </style>
    
    <div {{ $attributes->merge(['class' => 'alert-errors']) }}>
        {{-- <div class="text-danger fw-bold">
            {{ __('Whoops! Something went wrong.') }}
        </div> --}}

        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
