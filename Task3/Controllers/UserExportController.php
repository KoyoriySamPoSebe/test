<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\View\View;
use App\Services\UserExportService;

class UserExportController extends Controller
{
    public function __construct(
        private UserExportService $exportService
    ) {}

    public function index(): View
    {
        return view('export_users', [
            'totalUsers' => $this->exportService->getAll(),
        ]);
    }

    public function store(Request $request): JsonResponse
    {
        $lastId = $request->integer('lastId', 0);

        [$csv, $newLast] = array_values(
            $this->exportService->getChunk($lastId)
        );

        return response()->json([
            'csv'    => $csv,
            'lastId' => $newLast,
        ]);
    }
}


