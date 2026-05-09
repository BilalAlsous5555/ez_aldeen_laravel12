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
                ->restrictOnDelete();

            // sender = teacher or admin
            $table->foreignId('sender_id')
                ->constrained('users')
                ->restrictOnDelete();

            // Optional: link note to a specific halqa context
                    // [NO CHANGE] nullable — الملاحظة قد تكون من الإدارة مباشرة
            // وعند حذف الحلقة تصبح null لكن الملاحظة تبقى
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
