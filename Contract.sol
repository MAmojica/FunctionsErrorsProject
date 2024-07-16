// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Contract {
    uint256 public value;

    function setValue(uint256 _value) public {
        require(_value > 0, "Value must be greater than 0"); // Check that the value is greater than 0
        value = _value;
    }

    function doubleValue() public {
        uint256 newValue = value * 2;
        assert(newValue > value); // Check that the new value is greater than the old value
        value = newValue;
    }

    function tryToSetValueToZero() public {
        if (value == 0) {
            revert("Value is already zero"); // Revert with a message if value is already zero
        }
        value = 0;
    }
}
