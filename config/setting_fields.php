<?php

return [
    'app' => [
        'title' => 'General',
        'desc' => 'All the general settings for application.',
        'icon' => 'fas fa-cube',

        'elements' => [
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'app_name', // unique name for field
                'label' => 'App Name', // you know what label it is
                'rules' => 'required|min:2|max:50', // validation rule of laravel
                'class' => '', // any class for input
                'value' => config('app.name'), // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'footer_text', // unique name for field
                'label' => 'Footer Text', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Built with ♥ from <a href="https://intellijai.net" target="_blank">Intellij Group of Companies Limited</a>', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'helpline_number', // unique name for field
                'label' => 'Helpline Number', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '1234567890', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'copyright_text', // unique name for field
                'label' => 'Copyright Text', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Copyright © 2024', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'ui_text', // unique name for field
                'label' => 'UI Text', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Software Developed By <a href="https://intellijai.online/" target="_blank">Jayson Agyemang</a>', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'inquriy_email', // unique name for field
                'label' => 'Inquiry Email', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'admin@intellij.net', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'site_description', // unique name for field
                'label' => 'Site Description', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Dummy Text ', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'google_analytics', // unique name for field
                'label' => 'Google Analytics', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
            ],
            [
                'type' => 'file', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'logo', // unique name for field
                'label' => 'Logo', // you know what label it is
                'rules' => 'nullable|image|mimes:jpg,png,gif', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'img/logo/logo.png', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
            [
                'type' => 'file', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'mini_logo', // unique name for field
                'label' => 'Mini Logo', // you know what label it is
                'rules' => 'nullable|image|mimes:jpg,png,gif', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'img/logo/mini_logo.png', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
            [
                'type' => 'file', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'dark_logo', // unique name for field
                'label' => 'Dark Logo', // you know what label it is
                'rules' => 'nullable|image|mimes:jpg,png,gif', // validation rule of laravel
                'class' => '', // any class for input
                'imageClass' => 'bg-dark',
                'value' => 'img/logo/dark_logo.png', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
            [
                'type' => 'file', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'dark_mini_logo', // unique name for field
                'label' => 'Dark Mini Logo', // you know what label it is
                'rules' => 'nullable|image|mimes:jpg,png,gif', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'img/logo/dark_mini_logo.png', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
            [
                'type' => 'file', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'favicon', // unique name for field
                'label' => 'Favicon', // you know what label it is
                'rules' => 'nullable|image|mimes:jpg,png,gif,ico', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'img/logo/favicon/favicon.png', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
        ],
    ],
    // 'social' => [
    //     'title' => 'Social Profiles',
    //     'desc' => 'Link of all the social profiles.',
    //     'icon' => 'fas fa-users',

    //     'elements' => [
    //         [
    //             'type' => 'text', // input fields type
    //             'data' => 'string', // data type, string, int, boolean
    //             'name' => 'facebook_url', // unique name for field
    //             'label' => 'Facebook Page URL', // you know what label it is
    //             'rules' => 'required|max:191', // validation rule of laravel
    //             'class' => '', // any class for input
    //             'value' => '#', // default value if you want
    //         ],
    //         [
    //             'type' => 'text', // input fields type
    //             'data' => 'string', // data type, string, int, boolean
    //             'name' => 'twitter_url', // unique name for field
    //             'label' => 'Twitter Profile URL', // you know what label it is
    //             'rules' => 'required|nullable|max:191', // validation rule of laravel
    //             'class' => '', // any class for input
    //             'value' => '#', // default value if you want
    //         ],
    //         [
    //             'type' => 'text', // input fields type
    //             'data' => 'string', // data type, string, int, boolean
    //             'name' => 'instagram_url', // unique name for field
    //             'label' => 'Instagram Account URL', // you know what label it is
    //             'rules' => 'required|nullable|max:191', // validation rule of laravel
    //             'class' => '', // any class for input
    //             'value' => '#', // default value if you want
    //         ],
    //         [
    //             'type' => 'text', // input fields type
    //             'data' => 'string', // data type, string, int, boolean
    //             'name' => 'linkedin_url', // unique name for field
    //             'label' => 'LinkedIn URL', // you know what label it is
    //             'rules' => 'required|nullable|max:191', // validation rule of laravel
    //             'class' => '', // any class for input
    //             'value' => '#', // default value if you want
    //         ],
    //         [
    //             'type' => 'text', // input fields type
    //             'data' => 'string', // data type, string, int, boolean
    //             'name' => 'youtube_url', // unique name for field
    //             'label' => 'Youtube Channel URL', // you know what label it is
    //             'rules' => 'required|nullable|max:191', // validation rule of laravel
    //             'class' => '', // any class for input
    //             'value' => '#', // default value if you want
    //         ],
    //     ],

    // ],
    'misc' => [
        'title' => 'Misc ',
        'desc' => 'Application Data',
        'icon' => 'fas fa-globe-asia',

        'elements' => [
          
          [
            'type' => 'text', // input fields type
            'data' => 'misc', // data type, string, int, boolean
            'name' => 'default_language', // unique name for field
            'label' => 'Language', // you know what label it is
            'rules' => 'required', // validation rule of laravel
            'class' => '', // any class for input
            'value' => 'en', // default value if you want
          ],

          [
              'type' => 'text', // input fields type
              'data' => 'misc', // data type, string, int, boolean
              'name' => 'default_time_zone', // unique name for field
              'label' => 'Time Zone', // you know what label it is
              'rules' => 'required', // validation rule of laravel
              'class' => '', // any class for input
              'value' => 'UTC', // default value if you want
          ],

          [
              'type' => 'text', // input fields type
              'data' => 'misc', // data type, string, int, boolean
              'name' => 'data_table_limit', // unique name for field
              'label' => 'Datatable Limit', // you know what label it is
              'rules' => 'required', // validation rule of laravel
              'class' => '', // any class for input
              'value' => '10', // default value if you want
          ],

        
        ],
    ],
    'analytics' => [
        'title' => 'Analytics',
        'desc' => 'Application Analytics',
        'icon' => 'fas fa-chart-line',

        'elements' => [
            [
                'type' => 'text', // input fields type
                'data' => 'text', // data type, string, int, boolean
                'name' => 'google_analytics', // unique name for field
                'label' => 'Google Analytics (gtag)', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
        ],

    ],
    'integration' => [
        'title' => 'Integration',
        'desc' => 'Integration',
        'icon' => 'fas fa-chart-line',

        'elements' => [
            [
                'type' => 'checkbox', // input fields type
                'data' => 'integaration', // data type, string, int, boolean
                'name' => 'is_google_login', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'integaration', // data type, string, int, boolean
                'name' => 'is_facebook_login', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
           
          
           
            [
                'type' => 'checkbox', // input fields type
                'data' => 'integaration', // data type, string, int, boolean
                'name' => 'is_application_link', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'is_google_login', // data type, string, int, boolean
                'name' => 'google_secretkey', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'is_google_login', // data type, string, int, boolean
                'name' => 'google_publickey', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'is_facebook_login', // data type, string, int, boolean
                'name' => 'facebook_secretkey', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'is_facebook_login', // data type, string, int, boolean
                'name' => 'facebook_publickey', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
           
            [
                'type' => 'text', // input fields type
                'data' => 'is_application_link', // data type, string, int, boolean
                'name' => 'customer_app_play_store', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'is_application_link', // data type, string, int, boolean
                'name' => 'customer_app_app_store', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
          
            [
                'type' => 'checkbox', // input fields type
                'data' => 'integaration', // data type, string, int, boolean
                'name' => 'isForceUpdateforAndroid', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'isForceUpdateforAndroid', // data type, string, int, boolean
                'name' => 'android_minimum_force_update_code', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'isForceUpdateforAndroid', // data type, string, int, boolean
                'name' => 'android_latest_version_update_code', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'integaration', // data type, string, int, boolean
                'name' => 'isForceUpdateforIos', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'isForceUpdateforIos', // data type, string, int, boolean
                'name' => 'iso_minimum_force_update_code', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'isForceUpdateforIos', // data type, string, int, boolean
                'name' => 'iso_latest_version_update_code', // unique name for field
                'label' => 'integration', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

        ],

    ],
    'custom_css' => [
        'title' => 'Custom Code',
        'desc' => 'Custom code area',
        'icon' => 'fa-solid fa-file-code',

        'elements' => [
            [
                'type' => 'textarea', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'custom_css_block', // unique name for field
                'label' => 'Custom Css Code', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
            [
                'type' => 'textarea', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'custom_js_block', // unique name for field
                'label' => 'Custom Js Code', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],

        ],

    ],
    'customization' => [
        'title' => 'Customization',
        'desc' => 'Setting on admin panel',
        'icon' => 'fa-solid fa-file-code',
        'elements' => [
            [
                'type' => 'hidden', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'customization_json', // unique name for field
                'label' => 'Customization', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '{}', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
            [
                'type' => 'hidden', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'root_colors', // unique name for field
                'label' => 'root_colors', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '{}', // default value if you want
                'help' => '', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
        ],
    ],
    'mobile' => [
        'title' => 'Mobile',
        'desc' => 'Application Mobile',
        'icon' => 'fas fa-chart-line',

        'elements' => [
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'primary', // unique name for field
                'label' => 'Primary', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'general', // data type, string, int, boolean
                'name' => 'secondary', // unique name for field
                'label' => 'Secondary', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
        ],

    ],


    'mail' => [
        'title' => 'Mail Setting',
        'desc' => 'Mail settings',
        'icon' => 'fas fa-envelope',

        'elements' => [
            [
                'type' => 'email', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'email', // unique name for field
                'label' => 'Email', // you know what label it is
                'rules' => 'required|email', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'info@example.com', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'mail_driver', // unique name for field
                'label' => 'Mail Driver', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'smtp', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'mail_host', // unique name for field
                'label' => 'Mail Host', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'smtp.gmail.com', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'mail_port', // unique name for field
                'label' => 'Mail Port', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '587', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'mail_encryption', // unique name for field
                'label' => 'Mail Encryption', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'tls', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'mail_username', // unique name for field
                'label' => 'Mail Username', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'youremail@gmail.com', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'mail_password', // unique name for field
                'label' => 'Mail Password', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Password', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'mail_from', // unique name for field
                'label' => 'Mail From', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'youremail@gmail.com', // default value if you wantPassword
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'mail_config', // data type, string, int, boolean
                'name' => 'from_name', // unique name for field
                'label' => 'From Name', // you know what label it is
                'rules' => 'required', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Vizion ai', // default value if you wantPassword
            ],
        ],

    ],
    'payment' => [
        'title' => 'Payment',
        'desc' => 'Payment',
        'icon' => 'fas fa-chart-line',

        'elements' => [
            [
                'type' => 'checkbox', // input fields type
                'data' => 'razorpayPayment', // data type, string, int, boolean
                'name' => 'razor_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'razor_payment_method', // data type, string, int, boolean
                'name' => 'razorpay_secretkey', // unique name for field
                'label' => 'razorpayPayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'razor_payment_method', // data type, string, int, boolean
                'name' => 'razorpay_publickey', // unique name for field
                'label' => 'razorpayPayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'stripePayment', // data type, string, int, boolean
                'name' => 'str_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'str_payment_method', // data type, string, int, boolean
                'name' => 'stripe_secretkey', // unique name for field
                'label' => 'stripePayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'str_payment_method', // data type, string, int, boolean
                'name' => 'stripe_publickey', // unique name for field
                'label' => 'stripePayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],


            [
                'type' => 'checkbox', // input fields type
                'data' => 'paystackPayment', // data type, string, int, boolean
                'name' => 'paystack_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'paystack_payment_method', // data type, string, int, boolean
                'name' => 'paystack_secretkey', // unique name for field
                'label' => 'paystackPayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'paystack_payment_method', // data type, string, int, boolean
                'name' => 'paystack_publickey', // unique name for field
                'label' => 'paystackPayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'paypalPayment', // data type, string, int, boolean
                'name' => 'paypal_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'paypal_payment_method', // data type, string, int, boolean
                'name' => 'paypal_secretkey', // unique name for field
                'label' => 'paypalPayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'paypal_payment_method', // data type, string, int, boolean
                'name' => 'paypal_clientid', // unique name for field
                'label' => 'paypalPayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'airtelPayment', // data type, string, int, boolean
                'name' => 'airtel_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'airtel_payment_method', // data type, string, int, boolean
                'name' => 'airtel_secretkey', // unique name for field
                'label' => 'airtel_money', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'airtel_payment_method', // data type, string, int, boolean
                'name' => 'airtel_clientid', // unique name for field
                'label' => 'airtel_money', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'flutterwavePayment', // data type, string, int, boolean
                'name' => 'flutterwave_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'flutterwave_payment_method', // data type, string, int, boolean
                'name' => 'flutterwave_secretkey', // unique name for field
                'label' => 'flutterwavePayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'flutterwave_payment_method', // data type, string, int, boolean
                'name' => 'flutterwave_publickey', // unique name for field
                'label' => 'flutterwavePayment', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'phonepayPayment', // data type, string, int, boolean
                'name' => 'phonepay_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'phonepay_payment_method', // data type, string, int, boolean
                'name' => 'phonepay_app_id', // unique name for field
                'label' => 'App ID', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'phonepay_payment_method', // data type, string, int, boolean
                'name' => 'phonepay_merchant_id', // unique name for field
                'label' => 'Merchant Id', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'phonepay_payment_method', // data type, string, int, boolean
                'name' => 'phonepay_salt_key', // unique name for field
                'label' => 'Salt Key', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'number', // input fields type
                'data' => 'phonepay_payment_method', // data type, string, int, boolean
                'name' => 'phonepay_salt_index', // unique name for field
                'label' => 'Salt Index', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'midtransPayment', // data type, string, int, boolean
                'name' => 'midtrans_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'midtrans_payment_method', // data type, string, int, boolean
                'name' => 'midtrans_clientid', // unique name for field
                'label' => 'midtrans', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'cinetpayPayment', // data type, string, int, boolean
                'name' => 'cinet_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'cinet_payment_method', // data type, string, int, boolean
                'name' => 'cinet_siteid', // unique name for field
                'label' => 'Site ID', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'cinet_payment_method', // data type, string, int, boolean
                'name' => 'cinet_apikey', // unique name for field
                'label' => 'Api Key', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'cinet_payment_method', // data type, string, int, boolean
                'name' => 'cinet_secretkey', // unique name for field
                'label' => 'Secret Key', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'sadadpayPayment', // data type, string, int, boolean
                'name' => 'sadad_payment_method', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want

            ],
            [
                'type' => 'text', // input fields type
                'data' => 'sadad_payment_method', // data type, string, int, boolean
                'name' => 'sadad_id', // unique name for field
                'label' => 'Sadad ID', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'sadad_payment_method', // data type, string, int, boolean
                'name' => 'sadad_key', // unique name for field
                'label' => 'Sadad Key', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'sadad_payment_method', // data type, string, int, boolean
                'name' => 'sadad_domain', // unique name for field
                'label' => 'Sadad Domain', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
         
        ],
    ],

  

    'other_settings' => [
        'title' => 'Other Settings',
        'desc' => 'Other Settings',
        'icon' => 'fas fa-chart-line',

        'elements' => [
            [
                'type' => 'checkbox', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'is_event', // unique name for field
                'label' => 'Enable Events', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ], 
            [
                'type' => 'checkbox', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'is_blog', // unique name for field
                'label' => 'Enable Blogs', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ], 
            [
                'type' => 'checkbox', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'is_user_push_notification', // unique name for field
                'label' => 'Enable User Push Notification', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ], 
            [
                'type' => 'checkbox', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'is_provider_push_notification', // unique name for field
                'label' => 'Enable Provider Push Notification', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ], 
            [
                'type' => 'checkbox', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'enable_chat_gpt', // unique name for field
                'label' => 'Enable ChatGPT', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'test_without_key', // unique name for field
                'label' => 'Test Without Key', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'chatgpt_key', // unique name for field
                'label' => 'Key', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Paste the only the Measurement Id of Google Analytics stream.', // default value if you want
            ],
            [
                'type' => 'radio', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'notification', // unique name for field
                'label' => 'Notification', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'text', // input fields type
                'data' => 'notification', // data type, string, int, boolean
                'name' => 'firebase_key', // unique name for field
                'label' => 'Firebase Key', // you know what label it is
                'rules' => 'required|min:2', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'enableAds', // data type, string, int, boolean
                'name' => 'enable_ads', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ads', // data type, string, int, boolean
                'name' => 'interstitial_ad_id', // unique name for field
                'label' => 'enableAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ads', // data type, string, int, boolean
                'name' => 'native_ad_id', // unique name for field
                'label' => 'enableAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ads', // data type, string, int, boolean
                'name' => 'banner_ad_id', // unique name for field
                'label' => 'enableAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ads', // data type, string, int, boolean
                'name' => 'open_ad_id', // unique name for field
                'label' => 'enableAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ads', // data type, string, int, boolean
                'name' => 'rewarded_ad_id', // unique name for field
                'label' => 'enableAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ads', // data type, string, int, boolean
                'name' => 'rewardinterstitial_ad_id', // unique name for field
                'label' => 'enableAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'enableIosAds', // data type, string, int, boolean
                'name' => 'enable_ios_ads', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ios_ads', // data type, string, int, boolean
                'name' => 'ios_interstitial_ad_id', // unique name for field
                'label' => 'enableIosAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ios_ads', // data type, string, int, boolean
                'name' => 'ios_native_ad_id', // unique name for field
                'label' => 'enableIosAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ios_ads', // data type, string, int, boolean
                'name' => 'ios_banner_ad_id', // unique name for field
                'label' => 'enableIosAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ios_ads', // data type, string, int, boolean
                'name' => 'ios_open_ad_id', // unique name for field
                'label' => 'enableIosAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ios_ads', // data type, string, int, boolean
                'name' => 'ios_rewarded_ad_id', // unique name for field
                'label' => 'enableIosAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_ios_ads', // data type, string, int, boolean
                'name' => 'ios_rewardinterstitial_ad_id', // unique name for field
                'label' => 'enableIosAds', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'enablePicsArt', // data type, string, int, boolean
                'name' => 'enable_picsart', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_picsart', // data type, string, int, boolean
                'name' => 'picsart_key', // unique name for field
                'label' => 'enablePicsArt', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'enableCutoutPro', // data type, string, int, boolean
                'name' => 'enable_cutoutpro', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_cutoutpro', // data type, string, int, boolean
                'name' => 'cutoutpro_key', // unique name for field
                'label' => 'enableCutoutPro', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],

            [
                'type' => 'checkbox', // input fields type
                'data' => 'enableGemini', // data type, string, int, boolean
                'name' => 'enable_gemini', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
            ],
            [
                'type' => 'text', // input fields type
                'data' => 'enable_gemini', // data type, string, int, boolean
                'name' => 'gemini_key', // unique name for field
                'label' => 'enableGemini', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            [
                'type' => 'checkbox', // input fields type
                'data' => 'other_settings', // data type, string, int, boolean
                'name' => 'in_app_purchase', // unique name for field
                'label' => 'Is Type', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '0', // default value if you want
            ],

            [
                'type' => 'text', // input fields type
                'data' => 'daily_limit', // data type, string, int, boolean
                'name' => 'daily_limit', // unique name for field
                'label' => 'Daily Limit', // you know what label it is
                'rules' => 'required|max:191', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '5', // default value if you want
                'help' => 'Paste the only the Measurement Id of Google Analytics stream.', // Help text for the input field.
            ],
            
        ],

    ],

];
