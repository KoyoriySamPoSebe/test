<?php

function bubbleSort(array &$arr): void
{
    $n = count($arr);
    $swapped = true;

    for ($i = 0; $i < $n - 1 && $swapped; $i++) {
        $swapped = false;
        for ($j = 0; $j < $n - $i - 1; $j++) {
            if ($arr[$j] > $arr[$j + 1]) {
                $temp = $arr[$j];
                $arr[$j] = $arr[$j + 1];
                $arr[$j + 1] = $temp;
                $swapped = true;
            }
        }
    }
}

$arr = [1, 2, 546, 8, 9, 10, 11, 12, 13, 777, 547, 13, 14, 15];
bubbleSort($arr);
print_r($arr);

// Алгоритм реализован с оптимизациями: флаг swapped для досрочного выхода и
// сокращение диапазона итерации, чтобы ускорить сортировку.
// Такой подход минимизирует количество операций и не использует лишнюю память,
// что особенно важно при работе с большим массивом (200k+ элементов).
// Но в целом такой подход это себе в ногу стрелять, есть же sort
