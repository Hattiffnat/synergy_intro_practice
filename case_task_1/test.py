import unittest
from case_task_1.solution import sum_neg_between_first_and_last


class TestSolution(unittest.TestCase):
    def test_sum_neg(self):
        assert sum_neg_between_first_and_last([1, -2, 3, -6, 4]) == -2
        assert sum_neg_between_first_and_last([1, -2, 3, -6, 4, -100]) == -8
