<?php

declare(strict_types=1);

namespace App\Interfaces;

use Illuminate\Support\Collection;

interface UserExportRepositoryInterface
{
    public function getChunk(int $lastId, int $limit): Collection;

    public function countUsers(): int;
}
