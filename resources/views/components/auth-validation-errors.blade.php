@props(['errors'])

@if ($errors->any())
    <style>
        .alert-errors {
            background: #fee;
            border: 1px solid #fcc;
            border-radius: 10px;
            padding: 15px 20px;
            margin-bottom: 20px;
            animation: shake 0.5s ease-out;
        }

        .alert-errors ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .alert-errors li {
            color: #dc3545;
            font-size: 14px;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .alert-errors li:last-child {
            margin-bottom: 0;
        }

        .alert-errors li::before {
            content: '⚠';
            margin-right: 8px;
            font-size: 16px;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
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
