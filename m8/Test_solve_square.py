import unittest
import solve_square_equation

class TestSolve(unittest.TestCase):
    # If quadratic equation has ONE roots
    def test_discriminant(self):
        self.assertEqual(solve_square_equation.discriminant(1, -2, -3), 16)

    def test_roots_two(self):
        self.assertEqual(solve_square_equation.roots(1, -2, -3, 16), (3, -1))

    def test_roots_one(self):
        self.assertEqual(solve_square_equation.roots(1, 12, 36, 0), (-5, 3))

    def test_roots_none(self):
        self.assertEqual(solve_square_equation.roots(5, 2, 3, -56), (None))

    def test_solv_square_none(self):
        self.assertEqual(solve_square_equation.solv_square(-1, -2, 15), (-5, 3))




if __name__ == '__main__':
    unittest.main()
