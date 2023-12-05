from pathlib.path import cwd
from pathlib.path import Path
from testing import assert_true

def get_digit(input: String, key: Int) -> String:
    let letters = StaticTuple[9]("one", "two", "three", "four", "five", "six", "seven", "eight", "nine")
    if isdigit(ord(input[key])):
        return input[key]
    else:
        for y in range(letters.__len__()):
            if input[key:key+len(letters[y])] == letters[y]:
                return String(y + 1)
    return String("")


fn main():
    try:
        let currentPath = cwd()
        let file = currentPath/"input.txt"
        print("Day Two")

        with open(file, "r") as f:
            let input = f.read()
            var total = 0
            var string = String("")
            
            for i in range(len(input)):
                let char = input[i]
                let digit = get_digit(input, i)
                string.__iadd__(digit)
                            
                if (char == '\n' or i == len(input) - 1) and len(string) > 0:
                    let last_index = len(string) - 1
                    total += atol(string[0] + string[last_index])
                    string = String("")

            print("Result: ", total)
            if (total == 53539):
                print("Correct Answer")
            else:
                print("Wrong Answer")
            assert_true(total == 53539, "correct answers would be 55017")


    except:
        print("Error")