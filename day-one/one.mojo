from pathlib.path import cwd
from pathlib.path import Path
from testing import assert_true



fn main():
    try:
        # read current path
        let currentPath = cwd()
        let file = currentPath/"input.txt"
        print("Day One")
        # read file
        with open(file, "r") as f:
            let input = f.read()

            var total = 0
            var first_number = String("0")
            var last_number =  String("0")

            for i in range(len(input)):
                let string = input[i]
                if isdigit(ord(string)):
                    if first_number == "0":
                        first_number = string
                    else:
                        last_number = string;

                if string == '\n' or i == len(input) - 1:
                    if last_number == "0":
                        last_number = first_number
                    total += atol(first_number + last_number)
                    first_number = String("0")
                    last_number = String("0")
            print("Result: ", total)
            if (total == 55017):
                print("Correct Answer")
            else:
                print("Wrong Answer")
            assert_true(total == 55017, "correct answers would be 55017")

    except:
        print("Error")