<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('notes', function (Blueprint $table) {
            $table->id();
            //recever
            $table->foreignId('student_id')
                ->constrained('users')
                ->cascadeOnDelete();

            // sender = teacher or admin
            $table->foreignId('sender_id')
                ->constrained('users')
                ->cascadeOnDelete();

            // Optional: link note to a specific halqa context
            $table->foreignId('halakat_id')
                ->nullable()
                ->constrained('halakat')
                ->nullOnDelete();

            $table->text('content');
            $table->timestamps();

            $table->index(['student_id', 'created_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('notes');
    }
};
