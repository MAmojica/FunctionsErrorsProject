// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Holocoin {

    // Public variables
    string public name = "HOLOCOIN";
    string public abbrv = "HLO";
    uint public supply = 0;

    // Mapping variable
    mapping(address => uint) public balances;

    // Mint function
    function mint(address _address, uint _value) public {
        require(_value > 0, "Value must be greater than 0"); // Using require() to check the value

        uint oldSupply = supply;
        supply += _value;
        balances[_address] += _value;
        
        // Using assert to ensure the supply was correctly updated
        assert(supply == oldSupply + _value);
    }

    // Burn function
    function burn(address _address, uint _value) public {
        require(balances[_address] >= _value, "Not enough balance to burn"); // Using require() to check balance
        
        uint oldSupply = supply;
        supply -= _value;
        balances[_address] -= _value;
        
        // Using assert to ensure the supply was correctly updated
        assert(supply == oldSupply - _value);
    }

    // Function that uses revert()
    function transfer(address _to, uint _value) public {
        // Check if sender has enough balance
        if (balances[msg.sender] < _value) {
            revert("Insufficient balance for transfer"); // Using revert() to handle insufficient balance
        }

        // Perform transfer
        balances[msg.sender] -= _value;
        balances[_to] += _value;

        // Using assert to check that sender's balance did not underflow
        assert(balances[msg.sender] + _value >= balances[msg.sender]);
    }
}
