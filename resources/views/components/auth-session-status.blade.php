@props(['status'])

@if ($status)
    <style>
        .alert-success {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 10px;
            padding: 15px 20px;
            margin-bottom: 20px;
            color: #155724;
            font-size: 14px;
            display: flex;
            align-items: center;
            animation: slideInDown 0.5s ease-out;
        }

        .alert-success::before {
            content: '✓';
            background: #28a745;
            color: white;
            width: 24px;
            height: 24px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            font-weight: bold;
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
        {{ $status }}
    </div>
@endif
