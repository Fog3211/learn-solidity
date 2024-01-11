// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2;

contract Transaction {
    event SenderLogger(address);
    event ValueLogger(uint256);

    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }

    modifier validValue() {
        assert(msg.value >= 1 ether);
        _;
    }

    receive() external payable isOwner validValue {
        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);
    }

    fallback() external payable {
        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);
    }
}
