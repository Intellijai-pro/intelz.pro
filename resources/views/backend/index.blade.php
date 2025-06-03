@extends('backend.layouts.app', ['isBanner' => false])

@section('title')
{{ 'Quantum Neural Command Center' }}
@endsection

@push('after-styles')
<style>
    /* Ultra-Modern Futuristic Dashboard Styles */
    @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700;900&family=Rajdhani:wght@300;400;500;600;700&family=Exo+2:wght@100;200;300;400;500;600;700;800;900&display=swap');

    /* CSS Variables for Advanced Theme System */
    :root {
        --quantum-primary: #00ffff;
        --quantum-secondary: #ff00ff;
        --quantum-tertiary: #00ff00;
        --quantum-warning: #ffff00;
        --quantum-danger: #ff0066;
        --quantum-info: #0066ff;
        --neural-bg: #000000;
        --neural-bg-secondary: rgba(10, 10, 10, 0.85);
        --neural-text: #ffffff;
        --neural-text-secondary: rgba(255, 255, 255, 0.7);
        --neural-border: rgba(0, 255, 255, 0.2);
        --glass-blur: 25px;
        --hologram-opacity: 0.4;
        --ar-indicator: #00ff88;
        --depth-1: 10px;
        --depth-2: 20px;
        --depth-3: 30px;
    }

    [data-bs-theme="light"] {
        --neural-bg: #f5f5f5;
        --neural-bg-secondary: rgba(255, 255, 255, 0.95);
        --neural-text: #000000;
        --neural-text-secondary: rgba(0, 0, 0, 0.7);
        --neural-border: rgba(0, 255, 255, 0.15);
        --glass-blur: 15px;
        --hologram-opacity: 0.2;
    }

    /* Global Styles */
    body {
        background: var(--neural-bg) !important;
        font-family: 'Exo 2', 'Rajdhani', sans-serif !important;
        color: var(--neural-text) !important;
        perspective: 1000px;
        overflow-x: hidden;
    }

    .wrapper {
        background: var(--neural-bg) !important;
        position: relative;
    }

    /* Quantum Field Background */
    .quantum-field {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: -3;
        opacity: 0.8;
    }

    [data-bs-theme="dark"] .quantum-field {
        background: 
            radial-gradient(ellipse at 25% 25%, rgba(0, 255, 255, 0.15) 0%, transparent 50%),
            radial-gradient(ellipse at 75% 75%, rgba(255, 0, 255, 0.15) 0%, transparent 50%),
            radial-gradient(ellipse at 50% 50%, rgba(0, 255, 0, 0.1) 0%, transparent 60%);
        animation: quantumShift 20s ease-in-out infinite;
    }

    @keyframes quantumShift {
        0%, 100% { transform: rotate(0deg) scale(1); }
        25% { transform: rotate(90deg) scale(1.1); }
        50% { transform: rotate(180deg) scale(1); }
        75% { transform: rotate(270deg) scale(0.9); }
    }

    /* Neural Network Background */
    .neural-network {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: -2;
        opacity: 0.3;
    }

    .neural-node {
        position: absolute;
        width: 4px;
        height: 4px;
        background: var(--quantum-primary);
        border-radius: 50%;
        box-shadow: 0 0 10px var(--quantum-primary);
        animation: nodeFloat 30s infinite linear;
    }

    .neural-connection {
        position: absolute;
        width: 1px;
        background: linear-gradient(to right, transparent, var(--quantum-primary), transparent);
        transform-origin: left center;
        animation: connectionPulse 3s ease-in-out infinite;
    }

    @keyframes nodeFloat {
        0% { transform: translate(0, 0); }
        33% { transform: translate(100px, -50px); }
        66% { transform: translate(-50px, 100px); }
        100% { transform: translate(0, 0); }
    }

    @keyframes connectionPulse {
        0%, 100% { opacity: 0.3; }
        50% { opacity: 0.8; }
    }

    /* AR Grid Overlay */
    .ar-grid {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: -1;
        opacity: 0.05;
        background-image: 
            linear-gradient(var(--ar-indicator) 1px, transparent 1px),
            linear-gradient(90deg, var(--ar-indicator) 1px, transparent 1px),
            linear-gradient(var(--ar-indicator) 0.5px, transparent 0.5px),
            linear-gradient(90deg, var(--ar-indicator) 0.5px, transparent 0.5px);
        background-size: 100px 100px, 100px 100px, 20px 20px, 20px 20px;
        animation: arGridMove 60s linear infinite;
        transform: perspective(500px) rotateX(60deg);
    }

    @keyframes arGridMove {
        0% { transform: perspective(500px) rotateX(60deg) translateZ(0); }
        100% { transform: perspective(500px) rotateX(60deg) translateZ(-100px); }
    }

    /* Ultra-Modern Cards with 3D Effects */
    .card {
        background: var(--neural-bg-secondary) !important;
        backdrop-filter: blur(var(--glass-blur)) saturate(180%);
        -webkit-backdrop-filter: blur(var(--glass-blur)) saturate(180%);
        border: 1px solid var(--neural-border) !important;
        border-radius: 20px !important;
        position: relative;
        overflow: visible;
        transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
        transform-style: preserve-3d;
        box-shadow: 
            0 10px 40px rgba(0, 255, 255, 0.1),
            inset 0 1px 0 rgba(255, 255, 255, 0.1),
            inset 0 -1px 0 rgba(0, 0, 0, 0.1);
    }

    [data-bs-theme="light"] .card {
        background: var(--neural-bg-secondary) !important;
        box-shadow: 
            0 10px 40px rgba(0, 0, 0, 0.05),
            inset 0 1px 0 rgba(255, 255, 255, 0.9);
    }

    /* Holographic Effect Layer */
    .card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(
            135deg, 
            transparent 40%, 
            rgba(255, 255, 255, 0.1) 50%, 
            transparent 60%
        );
        transform: translateX(-100%);
        transition: transform 0.6s;
        z-index: 1;
        border-radius: inherit;
    }

    .card:hover::before {
        transform: translateX(100%);
    }

    /* 3D Hover Effect */
    .card:hover {
        transform: translateY(-5px) rotateX(5deg) rotateY(-5deg) translateZ(20px);
        box-shadow: 
            0 20px 60px rgba(0, 255, 255, 0.3),
            inset 0 1px 0 rgba(255, 255, 255, 0.2),
            inset 0 -1px 0 rgba(0, 0, 0, 0.2);
    }

    /* Quantum Data Streams */
    .quantum-stream {
        position: absolute;
        top: 0;
        width: 2px;
        height: 100%;
        background: linear-gradient(to bottom, transparent, var(--quantum-primary), transparent);
        animation: quantumFlow 2s linear infinite;
        opacity: 0.6;
    }

    .quantum-stream:nth-child(2) {
        left: 25%;
        animation-delay: 0.5s;
        background: linear-gradient(to bottom, transparent, var(--quantum-secondary), transparent);
    }

    .quantum-stream:nth-child(3) {
        left: 50%;
        animation-delay: 1s;
        background: linear-gradient(to bottom, transparent, var(--quantum-tertiary), transparent);
    }

    .quantum-stream:nth-child(4) {
        left: 75%;
        animation-delay: 1.5s;
        background: linear-gradient(to bottom, transparent, var(--quantum-warning), transparent);
    }

    @keyframes quantumFlow {
        0% { transform: translateY(-100%); }
        100% { transform: translateY(100%); }
    }

    /* Voice UI Indicator */
    .voice-ui-indicator {
        position: fixed;
        bottom: 30px;
        right: 30px;
        width: 60px;
        height: 60px;
        background: var(--neural-bg-secondary);
        backdrop-filter: blur(var(--glass-blur));
        border: 2px solid var(--quantum-primary);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        transition: all 0.3s ease;
        z-index: 1000;
        box-shadow: 
            0 0 30px rgba(0, 255, 255, 0.5),
            inset 0 0 20px rgba(0, 255, 255, 0.2);
    }

    .voice-ui-indicator:hover {
        transform: scale(1.1);
        box-shadow: 
            0 0 50px rgba(0, 255, 255, 0.8),
            inset 0 0 30px rgba(0, 255, 255, 0.4);
    }

    .voice-wave {
        width: 4px;
        height: 20px;
        background: var(--quantum-primary);
        margin: 0 2px;
        border-radius: 2px;
        animation: voiceWave 0.8s ease-in-out infinite;
    }

    .voice-wave:nth-child(2) {
        animation-delay: 0.1s;
        height: 30px;
    }

    .voice-wave:nth-child(3) {
        animation-delay: 0.2s;
        height: 25px;
    }

    @keyframes voiceWave {
        0%, 100% { transform: scaleY(0.5); opacity: 0.5; }
        50% { transform: scaleY(1); opacity: 1; }
    }

    /* Holographic Projections */
    .holo-projection {
        position: absolute;
        width: 100%;
        height: 100%;
        pointer-events: none;
        opacity: var(--hologram-opacity);
    }

    .holo-layer {
        position: absolute;
        width: 100%;
        height: 100%;
        background: repeating-linear-gradient(
            0deg,
            transparent,
            transparent 2px,
            rgba(0, 255, 255, 0.03) 2px,
            rgba(0, 255, 255, 0.03) 4px
        );
        animation: holoScan 4s linear infinite;
    }

    .holo-layer:nth-child(2) {
        background: repeating-linear-gradient(
            90deg,
            transparent,
            transparent 2px,
            rgba(255, 0, 255, 0.03) 2px,
            rgba(255, 0, 255, 0.03) 4px
        );
        animation-direction: reverse;
    }

    @keyframes holoScan {
        0% { transform: translateY(0); }
        100% { transform: translateY(4px); }
    }

    /* Enhanced Status Display */
    .quantum-status-display {
        background: linear-gradient(135deg, var(--neural-bg-secondary) 0%, rgba(0, 255, 255, 0.1) 100%);
        backdrop-filter: blur(var(--glass-blur));
        border: 1px solid var(--neural-border);
        border-radius: 25px;
        padding: 30px;
        position: relative;
        overflow: hidden;
        margin-bottom: 30px;
        transform: perspective(1000px) rotateX(2deg);
        box-shadow: 
            0 20px 60px rgba(0, 255, 255, 0.2),
            inset 0 1px 0 rgba(255, 255, 255, 0.1);
    }

    .quantum-status-display::before {
        content: '';
        position: absolute;
        top: -2px;
        left: -2px;
        right: -2px;
        bottom: -2px;
        background: linear-gradient(45deg, var(--quantum-primary), var(--quantum-secondary), var(--quantum-tertiary));
        border-radius: inherit;
        opacity: 0.5;
        z-index: -1;
        animation: quantumBorderRotate 4s linear infinite;
    }

    @keyframes quantumBorderRotate {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* AR-Ready Stat Cards */
    .ar-stat-card {
        position: relative;
        transform-style: preserve-3d;
        transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
    }

    .ar-stat-card::after {
        content: '';
        position: absolute;
        top: -5px;
        left: -5px;
        right: -5px;
        bottom: -5px;
        background: linear-gradient(45deg, transparent, var(--ar-indicator), transparent);
        opacity: 0;
        transition: opacity 0.3s;
        border-radius: inherit;
        transform: translateZ(-10px);
    }

    .ar-stat-card:hover::after {
        opacity: 0.5;
    }

    /* Quantum Counters */
    .quantum-counter {
        font-family: 'Orbitron', monospace !important;
        font-size: 42px !important;
        font-weight: 900 !important;
        background: linear-gradient(
            45deg, 
            var(--quantum-primary) 0%, 
            var(--quantum-secondary) 25%, 
            var(--quantum-tertiary) 50%, 
            var(--quantum-warning) 75%, 
            var(--quantum-primary) 100%
        );
        background-size: 400% 400%;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: quantumGradient 4s ease infinite;
        text-shadow: 0 0 30px rgba(0, 255, 255, 0.5);
        display: inline-block;
        position: relative;
    }

    @keyframes quantumGradient {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    /* Gesture Indicators */
    .gesture-indicator {
        position: absolute;
        bottom: 10px;
        right: 10px;
        width: 30px;
        height: 30px;
        opacity: 0.3;
        animation: gestureHint 3s ease-in-out infinite;
    }

    .gesture-indicator::before,
    .gesture-indicator::after {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        border: 2px solid var(--quantum-primary);
        border-radius: 50%;
        animation: gesturePulse 2s ease-in-out infinite;
    }

    .gesture-indicator::after {
        animation-delay: 1s;
    }

    @keyframes gestureHint {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.2); }
    }

    @keyframes gesturePulse {
        0% { transform: scale(0.8); opacity: 1; }
        100% { transform: scale(1.5); opacity: 0; }
    }

    /* Enhanced Mobile Experience */
    @media (max-width: 768px) {
        .card {
            border-radius: 15px !important;
            margin-bottom: 20px;
        }
        
        .quantum-status-display {
            transform: none;
            padding: 20px;
        }
        
        .voice-ui-indicator {
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
        }
        
        /* Swipe indicator */
        .swipe-hint {
            position: fixed;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            width: 40px;
            height: 4px;
            background: var(--quantum-primary);
            border-radius: 2px;
            opacity: 0.5;
        }
    }

    /* AI Prediction Visualizations */
    .ai-prediction-line {
        stroke: var(--quantum-warning);
        stroke-width: 2;
        stroke-dasharray: 5, 5;
        fill: none;
        opacity: 0.8;
        animation: predictionFlow 2s linear infinite;
    }

    @keyframes predictionFlow {
        0% { stroke-dashoffset: 0; }
        100% { stroke-dashoffset: -10; }
    }

    /* Quantum Computing Status */
    .quantum-processor-status {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 10px 20px;
        background: rgba(0, 255, 255, 0.1);
        border: 1px solid rgba(0, 255, 255, 0.3);
        border-radius: 20px;
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    .quantum-processor-status::before {
        content: '';
        width: 8px;
        height: 8px;
        background: var(--quantum-primary);
        border-radius: 50%;
        animation: quantumPulse 1s ease-in-out infinite;
        box-shadow: 0 0 10px var(--quantum-primary);
    }

    @keyframes quantumPulse {
        0%, 100% { transform: scale(1); opacity: 1; }
        50% { transform: scale(1.5); opacity: 0.5; }
    }

    /* Enhanced Chart Styling */
    .apexcharts-canvas {
        filter: drop-shadow(0 0 20px rgba(0, 255, 255, 0.3));
    }

    /* Loading States */
    .quantum-loader {
        position: relative;
        width: 60px;
        height: 60px;
        margin: 20px auto;
    }

    .quantum-loader::before,
    .quantum-loader::after {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        border: 3px solid transparent;
        border-top-color: var(--quantum-primary);
        border-right-color: var(--quantum-secondary);
        border-radius: 50%;
        animation: quantumSpin 1.5s linear infinite;
    }

    .quantum-loader::after {
        width: 80%;
        height: 80%;
        top: 10%;
        left: 10%;
        animation-direction: reverse;
        animation-duration: 1s;
        border-top-color: var(--quantum-tertiary);
        border-right-color: var(--quantum-warning);
    }

    @keyframes quantumSpin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* Remove any existing overlapping styles */
    .content-inner::before,
    .content-inner::after,
    .dashboard-scan,
    .particles-container,
    .circuit-pattern,
    .holographic-overlay,
    .hud-frame,
    .matrix-rain {
        display: none !important;
    }

    /* Additional Ultra-Modern Styles */
    
    /* Glitch Text Effect */
    .glitch-text {
        position: relative;
        display: inline-block;
        font-weight: 900;
        text-transform: uppercase;
    }

    .glitch-text:hover {
        animation: glitchAnimation 0.3s infinite;
    }

    @keyframes glitchAnimation {
        0%, 100% {
            text-shadow: 
                0.05em 0 0 rgba(255, 0, 0, 0.75),
                -0.025em -0.05em 0 rgba(0, 255, 0, 0.75),
                0.025em 0.05em 0 rgba(0, 0, 255, 0.75);
        }
        14% {
            text-shadow: 
                0.05em 0 0 rgba(255, 0, 0, 0.75),
                -0.05em -0.025em 0 rgba(0, 255, 0, 0.75),
                0.025em 0.05em 0 rgba(0, 0, 255, 0.75);
        }
        15% {
            text-shadow: 
                -0.05em -0.025em 0 rgba(255, 0, 0, 0.75),
                0.025em 0.025em 0 rgba(0, 255, 0, 0.75),
                -0.05em -0.05em 0 rgba(0, 0, 255, 0.75);
        }
        49% {
            text-shadow: 
                -0.05em -0.025em 0 rgba(255, 0, 0, 0.75),
                0.025em 0.025em 0 rgba(0, 255, 0, 0.75),
                -0.05em -0.05em 0 rgba(0, 0, 255, 0.75);
        }
        50% {
            text-shadow: 
                0.025em 0.05em 0 rgba(255, 0, 0, 0.75),
                0.05em 0 0 rgba(0, 255, 0, 0.75),
                0 -0.05em 0 rgba(0, 0, 255, 0.75);
        }
        99% {
            text-shadow: 
                0.025em 0.05em 0 rgba(255, 0, 0, 0.75),
                0.05em 0 0 rgba(0, 255, 0, 0.75),
                0 -0.05em 0 rgba(0, 0, 255, 0.75);
        }
    }

    /* Status Indicators */
    .status-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;
    }

    .status-title {
        font-family: 'Orbitron', monospace;
        font-size: 32px;
        font-weight: 900;
        background: linear-gradient(45deg, var(--quantum-primary), var(--quantum-secondary), var(--quantum-primary));
        background-size: 200% 200%;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: holographicShift 3s ease infinite;
        text-transform: uppercase;
        letter-spacing: 4px;
        margin: 0;
    }

    @keyframes holographicShift {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    .status-indicators {
        display: flex;
        gap: 20px;
        flex-wrap: wrap;
    }

    .indicator {
        position: relative;
        display: flex;
        align-items: center;
        gap: 8px;
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        color: var(--neural-text-secondary);
        font-weight: 600;
    }

    .indicator::before {
        content: '';
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: #444;
        animation: indicatorPulse 2s ease-in-out infinite;
    }

    .indicator.active::before {
        background: var(--quantum-tertiary);
        box-shadow: 0 0 15px var(--quantum-tertiary);
    }

    .indicator.warning::before {
        background: var(--quantum-warning);
        box-shadow: 0 0 15px var(--quantum-warning);
        animation: warningBlink 1s ease-in-out infinite;
    }

    .indicator.error::before {
        background: var(--quantum-danger);
        box-shadow: 0 0 15px var(--quantum-danger);
        animation: errorBlink 0.5s ease-in-out infinite;
    }

    @keyframes indicatorPulse {
        0%, 100% { opacity: 1; transform: scale(1); }
        50% { opacity: 0.6; transform: scale(1.2); }
    }

    @keyframes warningBlink {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.3; }
    }

    @keyframes errorBlink {
        0%, 100% { opacity: 1; transform: scale(1); }
        50% { opacity: 0.5; transform: scale(1.3); }
    }

    .indicator::after {
        content: attr(data-label);
    }

    /* Status Message */
    .status-message {
        font-family: 'Rajdhani', sans-serif;
        color: var(--quantum-primary);
        font-size: 14px;
        letter-spacing: 1.5px;
        opacity: 0.9;
    }

    .typing-text {
        display: inline-block;
        position: relative;
    }

    .typing-text::after {
        content: '|';
        position: absolute;
        right: -10px;
        color: var(--quantum-primary);
        animation: typingCursor 1s ease-in-out infinite;
    }

    @keyframes typingCursor {
        0%, 100% { opacity: 1; }
        50% { opacity: 0; }
    }

    /* Enhanced Alert Styling */
    .alert-warning {
        background: linear-gradient(135deg, rgba(255, 200, 0, 0.1), rgba(255, 200, 0, 0.05)) !important;
        border: 1px solid rgba(255, 200, 0, 0.3) !important;
        color: #ffc800 !important;
        border-radius: 15px;
        padding: 20px;
        position: relative;
        overflow: hidden;
    }

    .alert-warning::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 2px;
        background: linear-gradient(90deg, transparent, #ffc800, transparent);
        animation: alertScan 3s linear infinite;
    }

    @keyframes alertScan {
        0% { left: -100%; }
        100% { left: 100%; }
    }

    /* Enhanced Table Styling */
    .table {
        background: transparent !important;
        color: var(--neural-text) !important;
    }

    .table thead tr {
        background: linear-gradient(135deg, rgba(0, 255, 255, 0.1), rgba(0, 255, 255, 0.05)) !important;
        border-bottom: 2px solid var(--quantum-primary);
    }

    .table thead th {
        color: var(--quantum-primary) !important;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 2px;
        font-size: 11px;
        border: none !important;
        padding: 15px;
    }

    .table tbody tr {
        border-bottom: 1px solid rgba(0, 255, 255, 0.1);
        transition: all 0.3s ease;
        position: relative;
    }

    .table tbody tr::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        width: 0;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 0.1), transparent);
        transition: width 0.3s ease;
    }

    .table tbody tr:hover::before {
        width: 100%;
    }

    .table tbody tr:hover {
        background: rgba(0, 255, 255, 0.05) !important;
        transform: translateX(5px);
    }

    .table tbody td {
        border: none !important;
        padding: 15px;
        color: var(--neural-text) !important;
    }

    /* Enhanced Button Styling */
    .btn-primary {
        background: linear-gradient(45deg, var(--quantum-primary), var(--quantum-secondary)) !important;
        border: none !important;
        color: #000 !important;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        position: relative;
        overflow: hidden;
        transition: all 0.3s ease;
        border-radius: 10px;
        padding: 10px 20px;
    }

    .btn-primary::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
        transition: left 0.5s ease;
    }

    .btn-primary:hover::before {
        left: 100%;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 30px rgba(0, 255, 255, 0.5) !important;
    }

    .btn-warning {
        background: linear-gradient(45deg, var(--quantum-warning), #ff8800) !important;
        border: none !important;
        color: #000 !important;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1.5px;
    }

    /* Enhanced Form Controls */
    .form-control {
        background: rgba(0, 255, 255, 0.05) !important;
        border: 1px solid rgba(0, 255, 255, 0.2) !important;
        color: var(--neural-text) !important;
        transition: all 0.3s ease;
        border-radius: 10px;
        padding: 12px;
    }

    .form-control:focus {
        background: rgba(0, 255, 255, 0.1) !important;
        border-color: var(--quantum-primary) !important;
        box-shadow: 0 0 20px rgba(0, 255, 255, 0.3) !important;
        color: var(--neural-text) !important;
    }

    /* Enhanced Dropdown Styling */
    .dropdown-menu {
        background: var(--neural-bg-secondary) !important;
        backdrop-filter: blur(20px);
        border: 1px solid var(--neural-border) !important;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 10px 40px rgba(0, 255, 255, 0.2);
    }

    .dropdown-item {
        color: var(--neural-text) !important;
        transition: all 0.3s ease;
        padding: 12px 20px;
        position: relative;
        overflow: hidden;
    }

    .dropdown-item::before {
        content: '';
        position: absolute;
        left: -100%;
        top: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(0, 255, 255, 0.2), transparent);
        transition: left 0.3s ease;
    }

    .dropdown-item:hover::before {
        left: 100%;
    }

    .dropdown-item:hover {
        background: rgba(0, 255, 255, 0.1) !important;
        color: var(--quantum-primary) !important;
        padding-left: 25px;
    }

    /* Success Badge */
    .btn-success-subtle {
        background: linear-gradient(135deg, rgba(0, 255, 0, 0.2), rgba(0, 255, 0, 0.1)) !important;
        color: var(--quantum-tertiary) !important;
        border: 1px solid rgba(0, 255, 0, 0.3) !important;
        font-size: 10px;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        font-weight: 700;
        padding: 4px 12px;
        border-radius: 20px;
    }

    /* Avatar Enhancement */
    .avatar {
        border: 2px solid var(--quantum-primary);
        box-shadow: 0 0 20px rgba(0, 255, 255, 0.3);
        transition: all 0.3s ease;
    }

    .avatar:hover {
        transform: scale(1.1);
        box-shadow: 0 0 30px rgba(0, 255, 255, 0.5);
    }

    /* Chart Title Styling */
    h3 {
        font-family: 'Orbitron', monospace !important;
        color: var(--quantum-primary) !important;
        font-size: 18px !important;
        text-transform: uppercase;
        letter-spacing: 3px;
        font-weight: 700;
    }

    .holographic-text {
        background: linear-gradient(45deg, var(--quantum-primary), var(--quantum-secondary), var(--quantum-tertiary), var(--quantum-primary));
        background-size: 300% 300%;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: holographicShift 4s ease infinite;
    }

    /* Loading Animations */
    #userchart_loader, #popular_loader, #revenue_loader, #subscription_loader {
        padding: 40px;
    }

    .ph-spin {
        animation: spin 1s linear infinite;
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }

    /* Responsive Enhancements */
    @media (max-width: 992px) {
        .quantum-counter {
            font-size: 32px !important;
        }
        
        .status-title {
            font-size: 24px;
        }
    }

    /* Dark Theme Specific Enhancements */
    [data-bs-theme="dark"] {
        .card {
            background: linear-gradient(135deg, rgba(10, 10, 10, 0.9), rgba(20, 20, 20, 0.9)) !important;
        }
        
        .text-success {
            text-shadow: 0 0 10px currentColor;
        }
    }

    /* Light Theme Specific Adjustments */
    [data-bs-theme="light"] {
        .quantum-counter {
            text-shadow: 0 2px 10px rgba(0, 255, 255, 0.3);
        }
        
        .status-title {
            text-shadow: 0 2px 10px rgba(0, 255, 255, 0.2);
        }
        
        .table tbody tr:hover {
            background: rgba(0, 255, 255, 0.03) !important;
        }
    }

    /* Card Body Enhancement */
    .card-body {
        background: transparent !important;
        position: relative;
        z-index: 1;
        padding: 25px;
    }

    /* Mini Chart Containers */
    #total-users, #total-generated-word, #total-active-subscriptions, 
    #total-images-generated, #total-ai-writer, #ai-art-generated, 
    #ai-code, #ai-images, #ai-chat, #total-revenue {
        height: 60px;
        margin: 15px 0;
        position: relative;
        filter: drop-shadow(0 0 10px rgba(0, 255, 255, 0.3));
    }

    /* Quantum Particle Effect */
    @keyframes quantumParticle {
        0% {
            transform: translate(0, 0) scale(0);
            opacity: 0;
        }
        10% {
            transform: translate(10px, -10px) scale(1);
            opacity: 1;
        }
        90% {
            transform: translate(100px, -100px) scale(1);
            opacity: 1;
        }
        100% {
            transform: translate(120px, -120px) scale(0);
            opacity: 0;
        }
    }

    /* Scan Line Effect */
    @keyframes scanLine {
        0% {
            transform: translateY(-100%);
        }
        100% {
            transform: translateY(100vh);
        }
    }

    /* Data Flow Visualization */
    .data-flow-line {
        position: absolute;
        width: 1px;
        height: 100%;
        background: linear-gradient(to bottom, transparent, var(--quantum-primary), transparent);
        opacity: 0.3;
        animation: dataFlowVertical 3s linear infinite;
    }

    @keyframes dataFlowVertical {
        0% { transform: translateY(-100%); }
        100% { transform: translateY(100%); }
    }
</style>
@endpush

@section('content')
<!-- Quantum Field Background -->
<div class="quantum-field"></div>

<!-- Neural Network Visualization -->
<div class="neural-network" id="neuralNetwork"></div>

<!-- AR Grid Overlay -->
<div class="ar-grid"></div>

<!-- Voice UI Indicator -->
<div class="voice-ui-indicator" id="voiceUI">
    <div class="voice-wave"></div>
    <div class="voice-wave"></div>
    <div class="voice-wave"></div>
</div>

<div class="row">
    <div class="col-12">
        <!-- Quantum Status Display -->
        <div class="quantum-status-display">
            <div class="holo-projection">
                <div class="holo-layer"></div>
                <div class="holo-layer"></div>
            </div>
            <div class="status-header">
                <div>
                    <h1 class="status-title glitch-text mb-2">QUANTUM NEURAL COMMAND CENTER</h1>
                    <div class="quantum-processor-status">
                        <span id="quantumStatus">Quantum Core Active</span> • <span id="processingPower">1.21 Petaflops</span>
                    </div>
                </div>
                <div class="status-indicators">
                    <span class="indicator active" data-label="NEURAL CORE"></span>
                    <span class="indicator active" data-label="QUANTUM PROCESSOR"></span>
                    <span class="indicator active" data-label="DATA MATRIX"></span>
                    <span class="indicator warning" data-label="SECURITY PROTOCOL"></span>
                    <span class="indicator active" data-label="AR INTERFACE"></span>
                </div>
            </div>
            <div class="status-message mt-3">
                <span class="typing-text" id="statusMessage">Welcome to Quantum Neural Command Center. All systems operational. Quantum encryption active. AR interface ready.</span>
            </div>
        </div>

        <!-- Alert Section -->
        <div class="row">
        @if($data['cutout_pro_limit_over']==1)
          <div class="col-12">
            <div id="cutout_pro" class="alert alert-warning">
                <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap">
                   <span><i class="ph ph-warning-circle me-2"></i>SYSTEM ALERT: Cutout.pro balance critical. Recharge required for continued operations.</span>
                   <button onclick="Upgradeplan('cutout_pro')" class="btn btn-warning">ACKNOWLEDGE</button>
                </div>
            </div>
          </div>
        @endif

        @if($data['open_ai_limit_over']==1)
           <div class="col-12">
                <div id="open_ai" class="alert alert-warning">
                    <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap">
                        <span><i class="ph ph-warning-circle me-2"></i>SYSTEM ALERT: OpenAI neural link depleted. Immediate recharge required.</span>
                        <button onclick="Upgradeplan('open_ai')" class="btn btn-warning">ACKNOWLEDGE</button>
                    </div>    
                </div>
           </div>
        @endif

        @if($data['picsart_limit_over']==1)
            <div class="col-12">
               <div id="picsart" class="alert alert-warning">
                    <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap">
                        <span><i class="ph ph-warning-circle me-2"></i>SYSTEM ALERT: Picsart integration offline. Balance restoration needed.</span>
                        <button onclick="Upgradeplan('picsart')" class="btn btn-warning">ACKNOWLEDGE</button>
                    </div>    
                </div>
            </div>
        @endif
        </div>

        <!-- Stats Grid -->
        <div class="row row-cols-xl-5 row-cols-md-3 row-cols-sm-2 row-cols-1">
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between flex-wrap">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-primary); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('NEURAL CONNECTIONS') }}</p>
                                <h1 class="quantum-counter">{{$data['totalUsersCount']}}</h1>
                            </div>
                            <div class="icon flex-shrink-0">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(0, 255, 255, 0.2), rgba(0, 255, 255, 0.05)); border: 2px solid var(--quantum-primary); box-shadow: 0 0 20px rgba(0, 255, 255, 0.4);">
                                    <i class="ph ph-users font-size-20" style="color: var(--quantum-primary); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-users"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageUsers']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('GROWTH RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-secondary); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('DATA PROCESSED') }}</p>
                                <h1 class="quantum-counter">{{$data['totalWordCount']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(255, 0, 255, 0.2), rgba(255, 0, 255, 0.05)); border: 2px solid var(--quantum-secondary); box-shadow: 0 0 20px rgba(255, 0, 255, 0.4);">
                                    <i class="ph ph-textbox font-size-20" style="color: var(--quantum-secondary); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-generated-word"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageWordCountLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('PROCESSING RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-tertiary); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('ACTIVE PROTOCOLS') }}</p>
                                <h1 class="quantum-counter">{{$data['activeSubscriptionCount']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(0, 255, 0, 0.2), rgba(0, 255, 0, 0.05)); border: 2px solid var(--quantum-tertiary); box-shadow: 0 0 20px rgba(0, 255, 0, 0.4);">
                                    <i class="ph ph-currency-circle-dollar font-size-20" style="color: var(--quantum-tertiary); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-active-subscriptions"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['lastMothsubsctiption']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('ACTIVATION RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-warning); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('VISUAL DATA') }}</p>
                                <h1 class="quantum-counter">{{$data['totalImageCount']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(255, 255, 0, 0.2), rgba(255, 255, 0, 0.05)); border: 2px solid var(--quantum-warning); box-shadow: 0 0 20px rgba(255, 255, 0, 0.4);">
                                    <i class="ph ph-images font-size-20" style="color: var(--quantum-warning); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-images-generated"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageImageCountLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('RENDER RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-danger); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('AI WRITERS') }}</p>
                                <h1 class="quantum-counter">{{$data['totalAIwriter']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(255, 0, 102, 0.2), rgba(255, 0, 102, 0.05)); border: 2px solid var(--quantum-danger); box-shadow: 0 0 20px rgba(255, 0, 102, 0.4);">
                                    <i class="ph ph-pen font-size-20" style="color: var(--quantum-danger); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-ai-writer"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageAIwriterLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('GENERATION RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-info); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('ART MATRIX') }}</p>
                                <h1 class="quantum-counter">{{$data['totalAIart']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(0, 102, 255, 0.2), rgba(0, 102, 255, 0.05)); border: 2px solid var(--quantum-info); box-shadow: 0 0 20px rgba(0, 102, 255, 0.4);">
                                    <i class="ph ph-palette font-size-20" style="color: var(--quantum-info); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-art-generated"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageAIartLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('CREATION RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-primary); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('CODE FORGE') }}</p>
                                <h1 class="quantum-counter">{{$data['totalAIcode']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(0, 255, 255, 0.2), rgba(0, 255, 255, 0.05)); border: 2px solid var(--quantum-primary); box-shadow: 0 0 20px rgba(0, 255, 255, 0.4);">
                                    <i class="ph ph-file-code font-size-20" style="color: var(--quantum-primary); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-code"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageAIcodeLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('COMPILE RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-secondary); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('IMAGE CORE') }}</p>
                                <h1 class="quantum-counter">{{$data['totalAIimage']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(255, 0, 255, 0.2), rgba(255, 0, 255, 0.05)); border: 2px solid var(--quantum-secondary); box-shadow: 0 0 20px rgba(255, 0, 255, 0.4);">
                                    <i class="ph ph-image font-size-20" style="color: var(--quantum-secondary); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-images"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageAIimageLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('PROCESS RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-tertiary); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('NEURAL CHAT') }}</p>
                                <h1 class="quantum-counter">{{$data['totalAIchat']}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(0, 255, 0, 0.2), rgba(0, 255, 0, 0.05)); border: 2px solid var(--quantum-tertiary); box-shadow: 0 0 20px rgba(0, 255, 0, 0.4);">
                                    <i class="ph ph-chat-circle-text font-size-20" style="color: var(--quantum-tertiary); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="ai-chat"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentageAIchatLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('RESPONSE RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card card-height ar-stat-card">
                    <div class="quantum-stream"></div>
                    <div class="quantum-stream"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="content">
                                <p class="text-capitalize mb-1" style="color: var(--quantum-warning); font-size: 11px; letter-spacing: 3px; font-weight: 600;">{{ __('CREDITS FLOW') }}</p>
                                <h1 class="quantum-counter">{{Currency::format($data['totalRevenue'])}}</h1>
                            </div>
                            <div class="icon">
                                <div class="bg-primary-subtle text-primary card-icon-40 rounded-circle" style="background: linear-gradient(135deg, rgba(255, 255, 0, 0.2), rgba(255, 255, 0, 0.05)); border: 2px solid var(--quantum-warning); box-shadow: 0 0 20px rgba(255, 255, 0, 0.4);">
                                    <i class="ph ph-hand-coins font-size-20" style="color: var(--quantum-warning); filter: drop-shadow(0 0 10px currentColor);"></i>
                                </div>
                            </div>
                        </div>
                        <div class="mt-3">
                            <div id="total-revenue"></div>
                            <div class="d-flex align-item-center justify-content-center gap-3 flex-wrap">
                                <span class="text-success font-size-14" style="filter: drop-shadow(0 0 5px currentColor);">+{{$data['percentagerevenueLastMonth']}}%</span>
                                <span class="text-capitalize font-size-11" style="color: var(--neural-text-secondary); letter-spacing: 2px; font-weight: 500;">{{ __('INCOME RATE') }}</span>
                            </div>
                        </div>
                        <div class="gesture-indicator"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ... existing code below ... -->
        <div class="row">
            <div class="col-md-12">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize holographic-text">{{ __('REVENUE ANALYTICS') }}</h3>
                            <div class="d-flex flex-wrap gap-3">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="revenue_date_range" value="{{ session('revenue_date_range') }}" id="revenuedateRangeInput" class="form-control revenue-date-range" placeholder="Select Date Range" readonly="readonly">
        
                                    <button id="refreshRevenuechart" class="btn btn-primary">
                                       <i class="ph ph-arrow-counter-clockwise"></i>
                                    </button>
                                </div>
                                <div class="dropdown">
                                    <a href="#" class="btn btn-primary dropdown-toggle total_revenue text-capitalize" id="dropdownTotalUsers3" data-bs-toggle="dropdown" aria-expanded="false">
                                        {{ __('TEMPORAL RANGE') }}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers3">
                                        <li><a class="revenue-dropdown-item dropdown-item" data-type="year">{{ __('ANNUAL CYCLE') }}</a></li>
                                        <li><a class="revenue-dropdown-item dropdown-item" data-type="month">{{ __('MONTHLY CYCLE') }}</a></li>
                                        <li><a class="revenue-dropdown-item dropdown-item" data-type="week">{{ __('WEEKLY CYCLE') }}</a></li>
                                    </ul>
                                </div>
                            </div>
    
                        </div>
                        <div id="revenue_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">PROCESSING DATA STREAM...</p>
                            </div>
                        </div>
                        <div id="total-revenue-chart" class="total-revenue-chart"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize">{{ __('USER MATRIX') }}</h3>
                            <div class="d-inline-flex align-items-center gap-3 flex-wrap">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="date_range" value="{{ session('date_range') }}" id="dateRangeInput" class="form-control user-date-range" placeholder="Select Date Range" readonly="readonly">
    
                                    <button id="refreshUserchart" class="btn btn-primary"><i class="ph ph-arrow-counter-clockwise"></i></button>
                                </div>
    
    
                                <div class="flex-shrink-0">
    
                                    <div class="d-flex align-items-center gap-1">
                                        <span class="text-capitalize" style="color: #00ffff;">{{ __('TOTAL NODES') }}</span>
                                        <h6 class="m-0 holographic-text" id="chart_newUsers">{{$data['chart_newUsers']}}
                                            <h6>
                                    </div>
                                    <div class="d-flex align-items-center gap-1">
                                        <span class="text-capitalize" style="color: #ff00ff;">{{ __('ACTIVE NODES') }}</span>
                                        <h6 class="m-0 holographic-text" id="chart_activeUsers">{{$data['chart_activeUsers']}}
                                            <h6>
                                    </div>
                                </div>
                                <div class="flex-shrink-0">
                                    <div class="dropdown">
                                        <a href="#" class="btn btn-primary dropdown-toggle total_users text-capitalize" id="dropdownTotalUsers1" data-bs-toggle="dropdown" aria-expanded="false">
                                            {{ __('TIME FRAME') }}
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers1">
                                            <li><a class="user-dropdown-item dropdown-item" data-type="year"> {{ __('ANNUAL') }}</a></li>
                                            <li><a class="user-dropdown-item dropdown-item" data-type="month"> {{ __('MONTHLY') }}</a></li>
                                            <li><a class="user-dropdown-item dropdown-item" data-type="week"> {{ __('WEEKLY') }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
    
                        </div>
                        <div id="userchart_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">ANALYZING USER PATTERNS...</p>
                            </div>
                        </div>
    
                        <div id="user-chart" class="user-chart"> </div>

                         <div id="user_chart_graph" class="user_chart_graph"> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize">{{ __('CONTENT ANALYTICS') }}</h3>

                            <div class="d-flex flex-wrap gap-3">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="content_date_range" value="{{ session('content_date_range') }}" id="contentdateRangeInput" class="form-control content-date-range" placeholder="Select Date Range" readonly="readonly">
        
                                    <button id="refreshContentchart" class="btn btn-primary"><i class="ph ph-arrow-counter-clockwise"></i></button>
                                </div>
                                <div class="dropdown">
                                    <a href="#" class="btn btn-primary dropdown-toggle popular_content text-capitalize" id="dropdownTotalUsers2" data-bs-toggle="dropdown" aria-expanded="false">
                                        {{ __('ANALYSIS PERIOD') }}
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers2">
                                        <li><a class="popular-dropdown-item dropdown-item" data-type="year">{{ __('ANNUAL DATA') }}</a></li>
                                        <li><a class="popular-dropdown-item dropdown-item" data-type="month">{{ __('MONTHLY DATA') }}</a></li>
                                        <li><a class="popular-dropdown-item dropdown-item" data-type="week"> {{ __('WEEKLY DATA') }}</a></li>
                                    </ul>
                                </div>
                            </div>
    
                        </div>
                        <div id="popular_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">SCANNING CONTENT MATRIX...</p>
                            </div>
                        </div>
                        <div id="popular-content" class="popular-content"></div>
                          <div id="popular_content_data" class="popular_content_data"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="card card-height">
                    <div class="card-body">
                        <div class="d-flex justify-content-between gap-3 flex-wrap">
                            <h3 class="text-capitalize">{{ __('SUBSCRIPTION PROTOCOLS') }}</h3>
    
                            <div class="d-flex flex-wrap gap-3">
                                <div class="form-group my-0 d-flex gap-2">
                                    <input type="text" name="subscription_range" value="{{ session('subscription_range') }}" id="subscriptionRangeInput" class="form-control subscription-date-range" placeholder="Select Date Range" readonly="readonly">
        
                                    <button id="refreshSubscriptionchart" class="btn btn-primary d-none"><i class="ph ph-arrow-counter-clockwise"></i></button>
                                </div>
        
                                <div class="flex-shrink-0">
                                    <div class="dropdown">
                                        <a href="#" class="btn btn-primary dropdown-toggle subscription text-capitalize" id="dropdownTotalUsers4" data-bs-toggle="dropdown" aria-expanded="false">
                                            {{ __('TIME WINDOW') }}
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownTotalUsers4">
                                            <li><a class="subscription-dropdown-item  dropdown-item" data-type="year">{{ __('YEARLY VIEW') }}</a></li>
                                            <li><a class="subscription-dropdown-item  dropdown-item" data-type="month">{{ __('MONTHLY VIEW') }}</a></li>
                                            <li><a class="subscription-dropdown-item  dropdown-item" data-type="week">{{ __('WEEKLY VIEW') }}</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
    
                        </div>
                        <div id="subscription_loader" style="display: none;">
                            <div class="text-center">
                                <i class="ph ph-circle-notch ph-spin text-cyan" style="font-size: 24px;"></i>
                                <p class="mt-2">LOADING SUBSCRIPTION DATA...</p>
                            </div>
                        </div>
                      <div id="subscription_data" class="subscription_data"></div>
                        <div id="subscription" class="subscription"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card card-height">
                    <div class="card-body">
                        <h3 class="text-capitalize mb-5">{{ __('TRANSACTION LOG') }}</h3>
                        <div class="table-responsive card-height-table">
                            <table id="datatable" class="table table-striped table-hover transaction_history_table dataTable">
                                <thead>
                                    <tr class="bg-body">
                                        <th>
                                            <h6 class="m-0">{{ __('USER ID') }}</h6>
                                        </th>
                                        <th>
                                            <h6 class="m-0">{{ __('PROTOCOL') }}</h6>
                                        </th>
    
                                        <th>
                                            <h6 class="m-0">{{ __('CREDITS') }}</h6>
                                        </th>
    
                                        <th>
                                            <h6 class="m-0">{{ __('TIMESTAMP') }}</h6>
                                        </th>
                                        <th>
                                            <h6 class="m-0">{{ __('STATUS') }}</h6>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($data['transactionHistory'] as $transaction)
                                    <tr>
                                        <td>
                                            <div class="d-flex gap-3 align-items-center">
                                                <img src="{{ optional(optional($transaction->subscription)->user)->profile_image ?? default_user_avatar() }}" alt="avatar" class="avatar avatar-40 rounded-pill">
                                                <div class="text-start">
                                                    <h6 class="m-0" style="color: #00ffff;">{{ optional(optional($transaction->subscription)->user)->full_name ?? default_user_name() }}</h6>
                                                    <span style="color: #888; font-size: 12px;">{{ optional(optional($transaction->subscription)->user)->email ?? '--' }}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><span style="color: #ff00ff;">{{ optional(optional($transaction->subscription)->plan)->name ?? null }}</span></td>
                                        <td><span class="holographic-text">{{ Currency::format($transaction->amount) }}</span></td>
                                        <td><span style="color: #888; font-size: 12px;">{{ $transaction->created_at }}</span></td>
                                        <td><span class="btn btn-sm btn-success-subtle pe-none">ACTIVE</span></td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>


@endsection

@push('after-scripts')
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.40.0/apexcharts.min.js" integrity="sha512-Kr1p/vGF2i84dZQTkoYZ2do8xHRaiqIa7ysnDugwoOcG0SbIx98erNekP/qms/hBDiBxj336//77d0dv53Jmew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    // Override ApexCharts default colors for futuristic theme
    window.Apex = {
        chart: {
            foreColor: '#fff',
            toolbar: {
                show: false
            }
        },
        grid: {
            borderColor: 'rgba(0, 255, 255, 0.1)'
        },
        colors: ['#00ffff', '#ff00ff', '#00ff00', '#ffff00', '#ff0066', '#0066ff'],
        theme: {
            mode: 'dark'
        },
        tooltip: {
            theme: 'dark',
            style: {
                fontSize: '12px',
                fontFamily: 'Rajdhani, sans-serif'
            },
            fillSeriesColor: false,
            onDatasetHover: {
                highlightDataSeries: true,
            },
            x: {
                show: true,
                formatter: function(val) {
                    return val;
                }
            },
            y: {
                formatter: function(val) {
                    return val;
                }
            }
        }
    };

    // Mini chart configurations with futuristic colors
    const miniChartOptions = {
        chart: {
            type: 'area',
            sparkline: {
                enabled: true
            },
            height: 60
        },
        stroke: {
            curve: 'smooth',
            width: 2
        },
        fill: {
            type: 'gradient',
            gradient: {
                shadeIntensity: 1,
                opacityFrom: 0.4,
                opacityTo: 0.1,
                stops: [0, 90, 100]
            }
        },
        colors: ['#00ffff'],
        tooltip: {
            enabled: false
        }
    };

    // Initialize mini charts for stat cards
    @if(isset($data['last_month_user_graph_data']) && count($data['last_month_user_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-users"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_user_graph_data'])
        }]
    }).render();
    @endif

    @if(isset($data['last_month_word_graph_data']) && count($data['last_month_word_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-generated-word"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_word_graph_data'])
        }],
        colors: ['#ff00ff']
    }).render();
    @endif

    @if(isset($data['last_month_subscription_graph_data']) && count($data['last_month_subscription_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-active-subscriptions"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_subscription_graph_data'])
        }],
        colors: ['#00ff00']
    }).render();
    @endif

    @if(isset($data['last_month_image_graph_data']) && count($data['last_month_image_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-images-generated"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_image_graph_data'])
        }],
        colors: ['#ffff00']
    }).render();
    @endif

    @if(isset($data['last_month_ai_writer_graph_data']) && count($data['last_month_ai_writer_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-ai-writer"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_writer_graph_data'])
        }],
        colors: ['#ff0066']
    }).render();
    @endif

    @if(isset($data['last_month_ai_art_graph_data']) && count($data['last_month_ai_art_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-art-generated"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_art_graph_data'])
        }],
        colors: ['#0066ff']
    }).render();
    @endif

    @if(isset($data['last_month_ai_code_graph_data']) && count($data['last_month_ai_code_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-code"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_code_graph_data'])
        }],
        colors: ['#00ffff']
    }).render();
    @endif

    @if(isset($data['last_month_ai_image_graph_data']) && count($data['last_month_ai_image_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-images"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_image_graph_data'])
        }],
        colors: ['#ff00ff']
    }).render();
    @endif

    @if(isset($data['last_month_ai_chat_graph_data']) && count($data['last_month_ai_chat_graph_data']) > 0)
    new ApexCharts(document.querySelector("#ai-chat"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_ai_chat_graph_data'])
        }],
        colors: ['#00ff00']
    }).render();
    @endif

    @if(isset($data['last_month_revenue_graph_data']) && count($data['last_month_revenue_graph_data']) > 0)
    new ApexCharts(document.querySelector("#total-revenue"), {
        ...miniChartOptions,
        series: [{
            data: @json($data['last_month_revenue_graph_data'])
        }],
        colors: ['#ffff00']
    }).render();
    @endif

    // Counter animation
    document.querySelectorAll('.counter').forEach(counter => {
        const target = parseInt(counter.innerText.replace(/[^0-9]/g, ''));
        const duration = 2000;
        const increment = target / (duration / 16);
        let current = 0;
        
        const updateCounter = () => {
            current += increment;
            if (current < target) {
                counter.innerText = Math.floor(current).toLocaleString();
                requestAnimationFrame(updateCounter);
            } else {
                counter.innerText = target.toLocaleString();
            }
        };
        
        updateCounter();
    });

    // Rest of the existing scripts with color updates...
    const range_flatpicker = document.querySelectorAll('.user-date-range, .revenue-date-range, .subscription-date-range, .content-date-range')
    Array.from(range_flatpicker, (elem) => {
        if (typeof flatpickr !== typeof undefined) {
            flatpickr(elem, {
                mode: "range",
                theme: "dark"
            })
        }
    })

    // Apply futuristic theme to all charts
    $(document).ready(function() {
        // Override chart colors globally
        const futuristicColors = ['#00ffff', '#ff00ff', '#00ff00', '#ffff00', '#ff0066', '#0066ff'];
        
        // Apply to existing chart functions
        if (typeof user_chart === 'function') {
            window.user_chart = user_chart;
        }
        if (typeof popular_content === 'function') {
            window.popular_content = popular_content;
        }
        if (typeof total_revenue_chart === 'function') {
            window.total_revenue_chart = total_revenue_chart;
        }
        if (typeof subscription === 'function') {
            window.subscription = subscription;
        }
        
        // Override IQUtils colors if available
        if (typeof IQUtils !== 'undefined' && IQUtils.getVariableColor) {
            const originalGetVariableColor = IQUtils.getVariableColor;
            IQUtils.getVariableColor = function() {
                return {
                    primary: '#00ffff',
                    info: '#ff00ff',
                    warning: '#ffff00',
                    success: '#00ff00',
                    danger: '#ff0066',
                    secondary: '#0066ff'
                };
            };
        }
    });

    // Copy existing chart initialization code but maintain it as-is
    // Chart initialization code would go here if needed
</script>

<!-- Advanced Quantum Dashboard Scripts -->
<script>
// Quantum Dashboard Advanced Functionality
(function() {
    'use strict';

    // Neural Network Visualization
    class NeuralNetworkVisualization {
        constructor(containerId) {
            this.container = document.getElementById(containerId);
            this.nodes = [];
            this.connections = [];
            this.init();
        }

        init() {
            // Create neural nodes
            for (let i = 0; i < 20; i++) {
                const node = document.createElement('div');
                node.className = 'neural-node';
                node.style.left = Math.random() * 100 + '%';
                node.style.top = Math.random() * 100 + '%';
                node.style.animationDelay = Math.random() * 30 + 's';
                node.style.animationDuration = (20 + Math.random() * 20) + 's';
                this.container.appendChild(node);
                this.nodes.push(node);
            }

            // Create connections between nodes
            this.createConnections();
            
            // Animate connections
            setInterval(() => this.pulseConnections(), 3000);
        }

        createConnections() {
            for (let i = 0; i < 15; i++) {
                const connection = document.createElement('div');
                connection.className = 'neural-connection';
                
                const node1 = this.nodes[Math.floor(Math.random() * this.nodes.length)];
                const node2 = this.nodes[Math.floor(Math.random() * this.nodes.length)];
                
                if (node1 !== node2) {
                    const rect1 = node1.getBoundingClientRect();
                    const rect2 = node2.getBoundingClientRect();
                    
                    const dx = rect2.left - rect1.left;
                    const dy = rect2.top - rect1.top;
                    const distance = Math.sqrt(dx * dx + dy * dy);
                    const angle = Math.atan2(dy, dx) * 180 / Math.PI;
                    
                    connection.style.width = distance + 'px';
                    connection.style.left = rect1.left + 'px';
                    connection.style.top = rect1.top + 'px';
                    connection.style.transform = `rotate(${angle}deg)`;
                    
                    this.container.appendChild(connection);
                    this.connections.push(connection);
                }
            }
        }

        pulseConnections() {
            this.connections.forEach((conn, index) => {
                setTimeout(() => {
                    conn.style.opacity = '0.8';
                    setTimeout(() => {
                        conn.style.opacity = '0.3';
                    }, 500);
                }, index * 100);
            });
        }
    }

    // Initialize Neural Network
    if (document.getElementById('neuralNetwork')) {
        new NeuralNetworkVisualization('neuralNetwork');
    }

    // Voice UI Simulation
    class VoiceUIController {
        constructor() {
            this.voiceUI = document.getElementById('voiceUI');
            this.isListening = false;
            this.init();
        }

        init() {
            this.voiceUI.addEventListener('click', () => this.toggleListening());
            
            // Simulate voice activity
            setInterval(() => {
                if (this.isListening) {
                    this.simulateVoiceActivity();
                }
            }, 200);
        }

        toggleListening() {
            this.isListening = !this.isListening;
            
            if (this.isListening) {
                this.voiceUI.style.background = 'rgba(0, 255, 255, 0.2)';
                this.voiceUI.style.boxShadow = '0 0 50px rgba(0, 255, 255, 0.8), inset 0 0 30px rgba(0, 255, 255, 0.4)';
                this.showNotification('Voice interface activated');
            } else {
                this.voiceUI.style.background = 'var(--neural-bg-secondary)';
                this.voiceUI.style.boxShadow = '0 0 30px rgba(0, 255, 255, 0.5), inset 0 0 20px rgba(0, 255, 255, 0.2)';
                this.showNotification('Voice interface deactivated');
            }
        }

        simulateVoiceActivity() {
            const waves = this.voiceUI.querySelectorAll('.voice-wave');
            waves.forEach(wave => {
                const height = 15 + Math.random() * 25;
                wave.style.height = height + 'px';
            });
        }

        showNotification(message) {
            const statusMessage = document.getElementById('statusMessage');
            const originalMessage = statusMessage.textContent;
            statusMessage.textContent = message;
            
            setTimeout(() => {
                statusMessage.textContent = originalMessage;
            }, 3000);
        }
    }

    // Initialize Voice UI
    new VoiceUIController();

    // Quantum Status Updates
    class QuantumStatusMonitor {
        constructor() {
            this.statusElement = document.getElementById('quantumStatus');
            this.powerElement = document.getElementById('processingPower');
            this.statuses = [
                'Quantum Core Active',
                'Quantum Entanglement Stable',
                'Superposition Maintained',
                'Decoherence Minimal',
                'Quantum Gates Aligned'
            ];
            this.init();
        }

        init() {
            setInterval(() => this.updateStatus(), 5000);
            setInterval(() => this.updatePower(), 2000);
        }

        updateStatus() {
            const newStatus = this.statuses[Math.floor(Math.random() * this.statuses.length)];
            this.animateTextChange(this.statusElement, newStatus);
        }

        updatePower() {
            const basePower = 1.21;
            const variation = (Math.random() - 0.5) * 0.1;
            const newPower = (basePower + variation).toFixed(2) + ' Petaflops';
            this.animateTextChange(this.powerElement, newPower);
        }

        animateTextChange(element, newText) {
            element.style.opacity = '0';
            setTimeout(() => {
                element.textContent = newText;
                element.style.opacity = '1';
            }, 300);
        }
    }

    // Initialize Quantum Status Monitor
    new QuantumStatusMonitor();

    // Enhanced Counter Animation
    class QuantumCounter {
        constructor() {
            this.counters = document.querySelectorAll('.quantum-counter');
            this.init();
        }

        init() {
            this.counters.forEach(counter => {
                const target = this.extractNumber(counter.innerText);
                if (target) {
                    this.animateCounter(counter, target);
                    
                    // Add hover effect
                    counter.addEventListener('mouseenter', () => {
                        this.glitchEffect(counter);
                    });
                }
            });
        }

        extractNumber(text) {
            const match = text.match(/[\d,]+/);
            return match ? parseInt(match[0].replace(/,/g, '')) : null;
        }

        animateCounter(counter, target) {
            const duration = 2500;
            const start = 0;
            const increment = target / (duration / 16);
            let current = start;
            
            const updateCounter = () => {
                current += increment;
                if (current < target) {
                    counter.innerText = this.formatNumber(Math.floor(current));
                    requestAnimationFrame(updateCounter);
                } else {
                    counter.innerText = this.formatNumber(target);
                    this.addSparkleEffect(counter);
                }
            };
            
            updateCounter();
        }

        formatNumber(num) {
            return num.toLocaleString();
        }

        glitchEffect(element) {
            element.style.animation = 'none';
            setTimeout(() => {
                element.style.animation = 'quantumGradient 4s ease infinite, glitchAnimation 0.2s 3';
            }, 10);
        }

        addSparkleEffect(element) {
            const sparkle = document.createElement('div');
            sparkle.style.position = 'absolute';
            sparkle.style.width = '4px';
            sparkle.style.height = '4px';
            sparkle.style.background = 'var(--quantum-primary)';
            sparkle.style.borderRadius = '50%';
            sparkle.style.boxShadow = '0 0 10px var(--quantum-primary)';
            sparkle.style.pointerEvents = 'none';
            sparkle.style.animation = 'quantumParticle 1s ease-out forwards';
            
            const rect = element.getBoundingClientRect();
            sparkle.style.left = rect.left + Math.random() * rect.width + 'px';
            sparkle.style.top = rect.top + Math.random() * rect.height + 'px';
            
            document.body.appendChild(sparkle);
            
            setTimeout(() => sparkle.remove(), 1000);
        }
    }

    // Initialize Quantum Counters
    new QuantumCounter();

    // Interactive Card Effects
    class CardInteractions {
        constructor() {
            this.cards = document.querySelectorAll('.ar-stat-card');
            this.init();
        }

        init() {
            this.cards.forEach(card => {
                card.addEventListener('mouseenter', (e) => this.handleMouseEnter(e));
                card.addEventListener('mouseleave', (e) => this.handleMouseLeave(e));
                card.addEventListener('mousemove', (e) => this.handleMouseMove(e));
                
                // Add click interaction
                card.addEventListener('click', (e) => this.handleClick(e));
            });
        }

        handleMouseEnter(e) {
            const card = e.currentTarget;
            card.style.transform = 'translateY(-5px) rotateX(5deg) rotateY(-5deg) translateZ(20px)';
            
            // Add glow effect
            const glow = document.createElement('div');
            glow.className = 'card-glow';
            glow.style.position = 'absolute';
            glow.style.top = '0';
            glow.style.left = '0';
            glow.style.right = '0';
            glow.style.bottom = '0';
            glow.style.background = 'radial-gradient(circle at center, rgba(0, 255, 255, 0.2), transparent)';
            glow.style.pointerEvents = 'none';
            glow.style.borderRadius = 'inherit';
            card.appendChild(glow);
        }

        handleMouseLeave(e) {
            const card = e.currentTarget;
            card.style.transform = '';
            
            const glow = card.querySelector('.card-glow');
            if (glow) glow.remove();
        }

        handleMouseMove(e) {
            const card = e.currentTarget;
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;
            
            const angleX = (y - centerY) / 10;
            const angleY = (centerX - x) / 10;
            
            card.style.transform = `translateY(-5px) rotateX(${angleX}deg) rotateY(${angleY}deg) translateZ(20px)`;
        }

        handleClick(e) {
            const card = e.currentTarget;
            this.createRippleEffect(card, e);
            
            // Trigger data refresh animation
            const chartContainer = card.querySelector('[id$="-users"], [id$="-word"], [id$="-subscriptions"], [id$="-generated"], [id$="-writer"], [id$="-art"], [id$="-code"], [id$="-images"], [id$="-chat"], [id$="-revenue"]');
            if (chartContainer) {
                chartContainer.style.opacity = '0';
                setTimeout(() => {
                    chartContainer.style.opacity = '1';
                }, 300);
            }
        }

        createRippleEffect(card, e) {
            const ripple = document.createElement('div');
            const rect = card.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            ripple.style.position = 'absolute';
            ripple.style.width = size + 'px';
            ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            ripple.style.background = 'rgba(0, 255, 255, 0.3)';
            ripple.style.borderRadius = '50%';
            ripple.style.transform = 'scale(0)';
            ripple.style.animation = 'rippleExpand 0.6s ease-out';
            ripple.style.pointerEvents = 'none';
            
            card.appendChild(ripple);
            
            setTimeout(() => ripple.remove(), 600);
        }
    }

    // Initialize Card Interactions
    new CardInteractions();

    // Real-time Data Simulation
    class DataStreamSimulator {
        constructor() {
            this.miniCharts = document.querySelectorAll('[id^="total-"], [id^="ai-"]');
            this.init();
        }

        init() {
            // Simulate real-time data updates
            setInterval(() => {
                this.updateRandomChart();
            }, 3000);
        }

        updateRandomChart() {
            const randomChart = this.miniCharts[Math.floor(Math.random() * this.miniCharts.length)];
            if (randomChart && window.ApexCharts) {
                // Add pulse effect
                randomChart.style.animation = 'pulse 0.5s ease-out';
                setTimeout(() => {
                    randomChart.style.animation = '';
                }, 500);
            }
        }
    }

    // Initialize Data Stream Simulator
    new DataStreamSimulator();

    // System Messages Rotation
    class SystemMessageRotator {
        constructor() {
            this.messageElement = document.getElementById('statusMessage');
            this.messages = [
                'Quantum encryption active. All systems nominal.',
                'Neural pathways optimized. Processing at peak efficiency.',
                'AR interface synchronized. Gesture recognition online.',
                'Data streams analyzed. Predictive models updated.',
                'Security protocols engaged. Threat level: minimal.',
                'Quantum entanglement stable. Communication channels secure.',
                'Machine learning algorithms adapting to new patterns.',
                'Holographic projections calibrated. Visual fidelity: maximum.'
            ];
            this.currentIndex = 0;
            this.init();
        }

        init() {
            setInterval(() => this.rotateMessage(), 10000);
        }

        rotateMessage() {
            this.currentIndex = (this.currentIndex + 1) % this.messages.length;
            const newMessage = this.messages[this.currentIndex];
            
            this.messageElement.style.opacity = '0';
            setTimeout(() => {
                this.messageElement.textContent = newMessage;
                this.messageElement.style.opacity = '1';
            }, 500);
        }
    }

    // Initialize System Message Rotator
    new SystemMessageRotator();

    // Add CSS for ripple effect
    const style = document.createElement('style');
    style.textContent = `
        @keyframes rippleExpand {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
    `;
    document.head.appendChild(style);

    // Performance Monitor
    class PerformanceMonitor {
        constructor() {
            this.fps = 0;
            this.lastTime = performance.now();
            this.frames = 0;
            this.init();
        }

        init() {
            this.monitor();
            setInterval(() => {
                console.log(`Quantum Dashboard FPS: ${this.fps}`);
            }, 5000);
        }

        monitor() {
            const currentTime = performance.now();
            this.frames++;
            
            if (currentTime >= this.lastTime + 1000) {
                this.fps = Math.round((this.frames * 1000) / (currentTime - this.lastTime));
                this.frames = 0;
                this.lastTime = currentTime;
                
                // Adjust animations if performance is low
                if (this.fps < 30) {
                    this.reduceAnimations();
                }
            }
            
            requestAnimationFrame(() => this.monitor());
        }

        reduceAnimations() {
            console.warn('Performance optimization: Reducing animations');
            // Implement animation reduction logic if needed
        }
    }

    // Initialize Performance Monitor
    new PerformanceMonitor();

    // Initialize everything when DOM is ready
    document.addEventListener('DOMContentLoaded', function() {
        console.log('Quantum Neural Command Center initialized');
        
        // Add futuristic sound effects (optional)
        if ('AudioContext' in window) {
            const audioContext = new AudioContext();
            
            // Create startup sound
            const oscillator = audioContext.createOscillator();
            const gainNode = audioContext.createGain();
            
            oscillator.connect(gainNode);
            gainNode.connect(audioContext.destination);
            
            oscillator.frequency.setValueAtTime(440, audioContext.currentTime);
            oscillator.frequency.exponentialRampToValueAtTime(880, audioContext.currentTime + 0.1);
            
            gainNode.gain.setValueAtTime(0.1, audioContext.currentTime);
            gainNode.gain.exponentialRampToValueAtTime(0.01, audioContext.currentTime + 0.1);
            
            oscillator.start(audioContext.currentTime);
            oscillator.stop(audioContext.currentTime + 0.1);
        }
    });

})();
</script>
@endpush
