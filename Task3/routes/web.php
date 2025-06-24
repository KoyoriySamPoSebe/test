<?php

use App\Http\Controllers\UserExportController;
use Illuminate\Support\Facades\Route;

Route::get('/export/users',  [UserExportController::class, 'index'])
    ->name('export.users.index');

Route::post('/export/users', [UserExportController::class, 'store'])
    ->name('export.users.store');

