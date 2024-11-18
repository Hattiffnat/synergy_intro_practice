from typing import Iterable


def solution(arr: Iterable[float | int]) -> float | int:
    return sum(x for x in sorted(arr)[1:-1] if x < 0)


if __name__ == "__main__":
    assert solution([1, -2, 3, -6, 4]) == -2
    assert solution([1, -2, 3, -6, 4, -100]) == -8