def validate_param(input):
    try:
        val = int(input)
        print(val, "fits")
        return val
    except ValueError:
        print("That's not an int!")
        exit()

def discriminant(a, b, c) -> (int):
    d = b**2 - 4*a*c
    print("D = ", d)
    return d

def roots(d, a, b, c):
    if d > 0:
        x1 = (-b + d ** 0.5) / (2 * a)
        x2 = (-b - d ** 0.5) / (2 * a)
        print("x1 = " + str(x1) + " x2 = " + str(x2))
        return x1, x2
    elif d == 0:
        x1 = -b/(2*a)
        print("x1 = " + str(x1))
        return x1
    else:
        print("No roots")
        return

def solv_square(a, b, c) -> roots:
    return roots(discriminant(a, b, c), a, b, c)

def square_print(a, b, c, roots):
    print("a = " + str(a),
          "b = " + str(b),
          "c = " + str(c),
          "Roots: " + str(roots))


if __name__ == '__main__':
    a = input('Enter a: ')
    a = validate_param(a)
    b = input("Enter b: ")
    b = validate_param(b)
    c = input("Enter c: ")
    c = validate_param(c)

    square_print(a, b, c, solv_square(a, b, c))