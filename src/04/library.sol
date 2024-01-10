// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2;

library MyLibrary {
    function increment(uint256 amount) public pure returns (uint256) {
        return amount += 1;
    }

    function decrement(uint256 amount) public pure returns (uint256) {
        return amount -= 1;
    }

    function incrementByValue(uint256 amount, uint256 value)
        public
        pure
        returns (uint256)
    {
        return amount += value;
    }

    function decrementByValue(uint256 amount, uint256 value)
        public
        pure
        returns (uint256)
    {
        return amount -= value;
    }
}
