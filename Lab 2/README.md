# CSM152A Team 4 (Justin and Krish) Lab Report 2

## Introduction:

In this project, our main objective was to design and implement a combinational circuit capable of performing 8-bit floating-point conversion of a 12-bit linear 2’s complement number. The conversion process involved breaking down the input data, represented in 12 distinct segments in the D[11:0] wire, into 1 bit for the sign, 3 bits for the exponent portion, and 4 bits for the significand portion. The conversion equation used was (-1)^S * F * 2^E, where S is the sign, F is the significand, and E is the exponent.

## Design:

Our design consists of a single module named `fpcvt`, which takes a 12-bit two’s complement integer (D) as input and outputs a sign bit (S), a 3-bit exponent (E), and a 4-bit significand (F).

### Sign Bit:
We start by storing the most significant bit of D into S to obtain the sign bit. Then, we calculate the absolute value of D and store it in a variable called `abs`.

### Leading Zeros:
Next, we count the number of leading zeros in `abs` to determine the exponent value. We accomplish this by left shifting `abs` until we reach a 1 bit or have left shifted 7 times, storing the number of shifts in an integer variable `i`.

### Significand Rounding:
We extract the 4 most significant bits from the left-shifted `abs` and store them in a variable `tempF`. If rounding is required (determined by the fifth most significant bit of `abs`), we adjust `tempF` accordingly. Additionally, if the value of `tempF` is `1111`, we decrement `i` by 1 and right shift `tempF` once to prevent overflow.

### Overflow Check:
If `i` is 0, indicating a potential overflow, we increment `i` by 1 and set `tempF` to `1111`.

### Exponent and Significand Output:
Finally, we set the value of E = 8 - `i` and F = `tempF`, giving us our exponent and significand.

## Simulation and Test Cases:

To verify the correctness of our floating-point conversion circuit, we conducted various test cases, manually assigning D to each case and comparing the outputs with the expected results.

### Test Cases:

1. Positive Number: Input: 0 (000000000000 in binary)
   - Expected Output: S = 0, E = 0, F = 0

2. Negative Number: Input: -422 (111001011010 in binary)
   - Expected Output: S = 1, E = 5, F = d

3. Smallest Negative Input: Input: -2048 (100000000000 in binary)
   - Expected Output: S = 1, E = 7, F = f

4. Largest Positive Number: Input: 2047 (011111111111 in binary)
   - Expected Output: S = 0, E = 7, F = f

5. Overflow Correction and Rounding to the Next Exponent: Input: 1928 (011110001000 in binary)
   - Expected Output: S = 0, E = 7, F = f

## Issues and Bugs Encountered:

During testing, we encountered a problem with handling the exponent due to an issue with the if statement. We resolved this by moving the condition inside the always block.

## Conclusion:

In conclusion, our project successfully implemented a combinational circuit for converting a 12-bit linear 2’s complement number into an 8-bit floating-point representation. We addressed rounding and overflow scenarios, ensuring accuracy and reliability in our implementation. Through rigorous testing and debugging, we verified the correctness of our circuit design. Overall, this project provided valuable insights into floating-point conversion and digital circuit design.