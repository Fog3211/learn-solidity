// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2;

interface Regulator {
    function checkValue(uint256 amount) external returns (bool);

    function loan() external returns (bool);
}

contract Bank is Regulator {
    uint256 private value;
    address private owner;

    modifier ownerFun() {
        require(owner == msg.sender);
        _;
    }

    constructor(uint256 amount) {
        value = amount;
        owner = msg.sender;
    }

    function deposit(uint256 amount) public ownerFun {
        value += amount;
    }

    function withdraw(uint256 amount) public ownerFun {
        if (checkValue(amount)) {
            value -= amount;
        }
    }

    function balance() public view returns (uint256) {
        return value;
    }

    function checkValue(uint256 amount) public view returns (bool) {
        return value >= amount;
    }

    function loan() public view returns (bool) {
        return value > 0;
    }
}

contract MyContract1 is Bank(100) {
    string private name;
    uint256 private age;
    bool private sex;

    function setName(string memory newName) public {
        name = newName;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function setAge(uint256 newAge) public {
        age = newAge;
    }

    function getAge() public view returns (uint256) {
        return age;
    }

    function setSex(bool newSex) public {
        sex = newSex;
    }

    function getSex() public view returns (bool) {
        return sex;
    }
}

contract TestThrows {
    function testAssert() public pure {
        assert(1 == 2);
    }

    function testRequire() public pure {
        assert(2 == 1);
    }

    function testRevert() public pure {
        revert();
    }

    function testThrow() public pure {
        throw;
    }
}