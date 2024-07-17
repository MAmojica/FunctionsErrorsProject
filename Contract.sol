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

    // New functionality 1: Halve the value
    function halveValue() public {
        require(value > 1, "Value must be greater than 1 to halve");
        value /= 2;
    }

    // New functionality 2: Increment the value by a given amount
    function incrementValue(uint256 increment) public {
        require(increment > 0, "Increment must be greater than 0");
        value += increment;
        assert(value >= increment); // Ensure no overflow
    }

    // New functionality 3: Decrement the value by a given amount
    function decrementValue(uint256 decrement) public {
        require(decrement > 0, "Decrement must be greater than 0");
        require(value >= decrement, "Decrement exceeds current value");
        value -= decrement;
    }
}
