<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('first_name');
            $table->string('last_name');
            $table->string('email')->unique()->nullable();
            $table->string('mobile')->nullable()->nullable();
            $table->string('login_type')->nullable(); // Remove
            $table->string('gender')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password')->nullable();
            $table->string('avatar')->nullable();
            $table->tinyInteger('is_banned')->default(0)->unsigned();
            $table->tinyInteger('is_subscribe')->default(0)->unsigned(); // Move this field to alter migration
            $table->tinyInteger('status')->default(1)->unsigned();
            $table->timestamp('last_notification_seen')->nullable();
            $table->longText('address')->nullable();
            $table->string('user_type')->nullable();
            $table->rememberToken();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
