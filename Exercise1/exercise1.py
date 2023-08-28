import sys
import numpy as np

def perform_array_manipulation(array, factor):
    manipulated_array = array * factor
    return manipulated_array

def main():
    normal_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    rows, cols = 3, 3
    array_2d = np.array(normal_array).reshape(rows, cols)

    if len(sys.argv) != 2:
        print("Usage: python script.py <array_factor>")
        sys.exit(1)

    try:
        array_factor = float(sys.argv[1])
    except ValueError:
        print("Array factor must be a valid number")
        sys.exit(1)

    manipulated_array = perform_array_manipulation(array_2d, array_factor)

    print("Normal Array:")
    print(normal_array)
    print("2D Array:")
    print(array_2d)
    print("Manipulated 2D Array:")
    print(manipulated_array)

if __name__ == "__main__":
    main()