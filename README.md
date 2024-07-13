# FunctionsErrors README

## Overview

This Solidity smart contract, `FunctionsErrors`, demonstrates the usage of `require()`, `assert()`, and `revert()` statements to manage conditions, enforce invariants, and handle errors in Ethereum smart contracts.

## Contract Functionality

### Contract Deployment

The contract initializes with the following:
- `owner`: The address that deploys the contract becomes the owner.
- `balance`: Initial balance is set to 0.

### Functions

### **1. deposit()**
   - **Description**: Allows users to deposit Ether into the contract.
   - **Usage**: Call this function with a positive value of Ether to add funds to the contract balance.
   - **Requirements**: Requires the deposited value to be greater than zero.

### **2. withdraw(uint amount)**
   - **Description**: Allows the contract owner to withdraw Ether from the contract balance.
   - **Usage**: Only the contract owner can call this function to withdraw a specified amount of Ether.
   - **Requirements**: Requires the caller to be the contract owner and ensures that the contract has sufficient balance for withdrawal.

### **3. testAssert()**
   - **Description**: Tests the `assert()` statement.
   - **Usage**: View function that checks an invariant condition (balance should always be non-negative) using `assert()`.

### **4. triggerRevert()**
   - **Description**: Demonstrates the `revert()` statement.
   - **Usage**: Pure function that intentionally triggers a revert with a custom error message.

### **5. resetContract()**
   - **Description**: Allows the contract owner to reset the contract state.
   - **Usage**: Only the contract owner can call this function to reset the contract balance to zero.

### Error Handling

- **require()**: Used throughout the contract to enforce pre-conditions (e.g., valid input values, ownership).
- **assert()**: Used to check for invariants (e.g., ensuring the balance is non-negative).
- **revert()**: Used for intentional error triggering with custom error messages.

### Usage

1. Deploy the contract on a test network or local blockchain.
2. Interact with the contract using wallet applications or through scripts.
3. Use `deposit()` to add funds, `withdraw()` to retrieve funds, `testAssert()` to check invariants, and `triggerRevert()` to observe revert behavior.
4. Only the contract owner can reset the contract state using `resetContract()`.

### Security Considerations

- Ensure that only trusted addresses interact with critical functions like `withdraw()` and `resetContract()`.
- Test the contract thoroughly on test networks before deploying to the mainnet.
- Consider adding additional security features such as access control mechanisms depending on the specific use case.

