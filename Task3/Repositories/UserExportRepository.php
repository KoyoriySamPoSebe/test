<?php

declare(strict_types=1);

namespace App\Repositories;

use App\Interfaces\UserExportRepositoryInterface;
use App\Models\User;
use Illuminate\Support\Collection;

class UserExportRepository implements UserExportRepositoryInterface
{
    public function getChunk(int $lastId, int $limit): Collection
    {
        return User::select('last_name','first_name','phone','email')
            ->where('id', '>', $lastId)
            ->orderBy('id')
            ->limit($limit)
            ->get();
    }

    public function countUsers(): int
    {
        return User::count();
    }
}
