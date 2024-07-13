// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionsErrors {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    // Function to deposit ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit value must be greater than zero.");
        balance += msg.value;
    }

    // Function to withdraw ether from the contract
    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only the owner can withdraw funds.");
        require(amount <= balance, "Insufficient balance.");

        balance -= amount;
        payable(owner).transfer(amount);
    }

    // Function to test assert
    function testAssert() public view {
        // Using assert to check for an invariant condition
        assert(balance >= 0);
    }

    // Function to demonstrate revert
    function triggerRevert() public pure {
        revert("This is a forced revert.");
    }

    // Function to reset the contract state
    function resetContract() public {
        require(msg.sender == owner, "Only the owner can reset the contract.");
        balance = 0;
    }
}
