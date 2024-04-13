# Basys3 Stopwatch Module

## Overview:
The Basys3 Stopwatch Module is a FPGA-based project developed to create a fully functional stopwatch with additional features. This project utilizes the Basys3 FPGA board and leverages its capabilities to create a stopwatch displayed on a seven-segment LED display.

## Features:
- **Stopwatch Functionality**: The core feature of the project is the stopwatch functionality, which accurately tracks time in minutes and seconds.
- **Adjustment Mode**: The stopwatch includes an adjustment mode, allowing users to increment either the minutes or seconds by two ticks per second for fine-tuning.
- **Reset Button**: A dedicated reset button is provided to reset the stopwatch to zero.
- **Pause Button**: A pause button allows users to pause and resume the stopwatch as needed.
- **Debouncing**: Debouncing techniques are implemented to ensure stable operation of buttons and switches, preventing unintended inputs.
- **Clock Dividers**: Multiple clock dividers are utilized to generate clocks with different frequencies required for various tasks within the module.
- **Seven-Segment Display Control**: The project includes control logic for the seven-segment display, enabling accurate representation of minutes and seconds. Blinking functionality is added for the adjustment mode to indicate the selected portion of the stopwatch.

## Usage:
To use the Basys3 Stopwatch Module, follow these steps:
1. Load the project onto the Basys3 FPGA board.
2. Use the buttons and switches on the board to control the stopwatch:
   - Press the pause button to start and stop the stopwatch.
   - Press the reset button to reset the stopwatch to zero.
   - Use the switches to enter adjustment mode and select the portion of the stopwatch to adjust.
3. Monitor the seven-segment display to view the elapsed time.

## Contribution:
Contributions to the project are welcome! If you encounter any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License:
This project is licensed under the [MIT License](LICENSE).
