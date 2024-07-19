# FunctionsErrors README

## Description

This Solidity program is a simple program that demonstrates creating a token while implementing the require(), assert(), and revert() statements.

The contract has six functions:

- `setValue(uint256 _value)`: Sets the value if it meets the required condition.
- `doubleValue()`: Doubles the current value.
- `tryToSetValueToZero()`: Attempts to set the value to zero, but reverts if the value is already zero.
- `halveValue()`: Halves the current value if it is greater than 1.
- `incrementValue(uint256 increment)`: Increments the current value by a given amount if the increment is greater than zero.
- `decrementValue(uint256 decrement)`: Decrements the current value by a given amount if the decrement is valid and does not exceed the current value.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [https://remix.ethereum.org/](https://remix.ethereum.org/).

1. **Create a New File**:
   - Click on the "+" icon in the left-hand sidebar.
   - Save the file with a `.sol` extension (e.g., `FunctionsErrors.sol`).
   - Copy and paste the code from the `FunctionsErrors.sol` file into the new file.

2. **Compile the Code**:
   - Click on the "Solidity Compiler" tab in the left-hand sidebar.
   - Make sure the "Compiler" option is set to "0.8.4" (or another compatible version).
   - Click on the "Compile FunctionsErrors.sol" button.

3. **Deploy the Contract**:
   - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
   - Select the contract from the dropdown menu.
   - Click on the "Deploy" button.

4. **Interact with the Contract**:
   - Once the contract is deployed, you can interact with it by calling the various functions.
   - Use the input fields to enter the necessary values for each function.
   - Click on the corresponding button (e.g., `transact`) to execute the function and observe the output in the console.

### Functions and Their Usage

- **setValue(uint256 _value)**:
  - Sets the contract's value to `_value`.
  - Requires `_value` to be greater than 0.

- **doubleValue()**:
  - Doubles the current value stored in the contract.
  - Asserts that the new value is greater than the old value to ensure no overflow.

- **tryToSetValueToZero()**:
  - Attempts to set the value to zero.
  - Reverts the transaction if the value is already zero.

- **halveValue()**:
  - Halves the current value.
  - Requires the current value to be greater than 1 to ensure halving is meaningful.

- **incrementValue(uint256 increment)**:
  - Increments the current value by the specified `increment`.
  - Requires `increment` to be greater than 0.
  - Asserts that the new value is correctly incremented and no overflow occurs.

- **decrementValue(uint256 decrement)**:
  - Decrements the current value by the specified `decrement`.
  - Requires `decrement` to be greater than 0.
  - Requires the current value to be at least as large as `decrement` to avoid underflow.

## Example Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Contract {
    uint256 public value;

    // Set value with a condition
    function setValue(uint256 _value) public {
        require(_value > 0, "Value must be greater than 0");
        value = _value;
    }

    // Double the current value
    function doubleValue() public {
        uint256 newValue = value * 2;
        assert(newValue > value); // Ensure there's no overflow
        value = newValue;
    }

    // Attempt to set the value to zero
    function tryToSetValueToZero() public {
        if (value == 0) {
            revert("Value is already zero");
        }
        value = 0;
    }

    // Halve the value
    function halveValue() public {
        require(value > 1, "Value must be greater than 1 to halve");
        value /= 2;
    }

    // Increment the value by a given amount
    function incrementValue(uint256 increment) public {
        require(increment > 0, "Increment must be greater than 0");
        value += increment;
        assert(value >= increment); // Ensure no overflow
    }

    // Decrement the value by a given amount
    function decrementValue(uint256 decrement) public {
        require(decrement > 0, "Decrement must be greater than 0");
        require(value >= decrement, "Decrement exceeds current value");
        value -= decrement;
    }
}
```

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

Feel free to reach out if you have any questions or need further assistance. Happy coding!
