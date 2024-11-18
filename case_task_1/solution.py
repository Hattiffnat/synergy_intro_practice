from typing import Iterable
import unittest


def sum_neg_between_first_and_last(arr: Iterable[float | int]) -> float | int:
    return sum(x for x in sorted(arr)[1:-1] if x < 0)


def main():
    print(
        "Сумма отрицательных элементов, расположенных между максимальным и минимальным:",
        sum_neg_between_first_and_last(
            map(float, input("Введите числа через пробел >> ").split())
        ),
    )


if __name__ == "__main__":
    main()


class TestSolution(unittest.TestCase):
    def test_sum_neg(self):
        assert sum_neg_between_first_and_last([1, -2, 3, -6, 4]) == -2
        assert sum_neg_between_first_and_last([1, -2, 3, -6, 4, -100]) == -8