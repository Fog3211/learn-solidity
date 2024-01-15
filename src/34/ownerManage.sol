// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2;

contract OwnerManage {
    Identity private owner;
    IState private state;

    struct Identity {
        string name;
        address addr;
    }

    enum IState {
        hasOwner,
        noOwner
    }

    event OwnerSet(address indexed oldOwnerAddr, address indexed newOwnerAddr);
    event OwnerRemoved(address indexed oldOwnerAddr);

    modifier isOwner() {
        require(owner.addr == msg.sender);
        _;
    }

    constructor(string memory name) {
        owner.addr = msg.sender;
        owner.name = name;
        state = IState.hasOwner;
    }

    function changeOwner(string calldata name, address addr) public isOwner {
        emit OwnerSet(address(0), addr);
        owner.name = name;
        owner.addr = addr;
        state = IState.hasOwner;
    }

    function removeOwner() public isOwner {
        emit OwnerRemoved(owner.addr);
        delete owner;
        state = IState.noOwner;
    }

    function getowner() public view returns (address, string memory) {
        return (owner.addr, owner.name);
    }

    function getState() public view returns (IState) {
        return state;
    }
}
