import unittest
from case_task_1.solution import sum_neg_between_first_and_last


class TestSolution(unittest.TestCase):
    def test_sum_neg(self):
        self.assertEqual(sum_neg_between_first_and_last([1, -2, 3, -6, 4]), -2)
        self.assertEqual( sum_neg_between_first_and_last([1, -2, 3, -6, 4, -100]), -8)
        self.assertEqual(sum_neg_between_first_and_last([]), 0)
        self.assertEqual(sum_neg_between_first_and_last([135, 13, 22, 355, 989]), 0)
        self.assertEqual(sum_neg_between_first_and_last([-135, -13, -22, -355, -989]), -512)
