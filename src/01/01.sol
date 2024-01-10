// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2;

contract MyContract1 {
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
