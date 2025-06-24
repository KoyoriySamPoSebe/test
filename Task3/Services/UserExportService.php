<?php

namespace App\Services;

use App\Interfaces\UserExportRepositoryInterface;

class UserExportService
{
    private const CHUNK_SIZE = 10000;

    public function __construct(
        private UserExportRepositoryInterface $repo
    ) {}

    public function getAll(): int
    {
        return $this->repo->countUsers();
    }

    public function getChunk(int $lastId): array
    {
        $users = $this->repo->getChunk($lastId, self::CHUNK_SIZE);

        $lines = $users
            ->map(fn($u) => sprintf(
                '"%s","%s","%s","%s"',
                str_replace('"', '""', $u->last_name),
                str_replace('"', '""', $u->first_name),
                str_replace('"', '""', $u->phone),
                str_replace('"', '""', $u->email)
            ))
            ->toArray();

        if ($lastId === 0) {
            array_unshift($lines, '"Фамилия","Имя","Телефон","E-mail"');
            $lines[0] = "\xEF\xBB\xBF" . $lines[0];
        }

        $csv      = implode("\n", $lines) . "\n";
        $newLast  = $users->isEmpty() ? null : (int) $users->last()->id;

        return [
            'csv'    => $csv,
            'lastId' => $newLast,
        ];
    }
}

