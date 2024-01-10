// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2;
import "src/04/library.sol";

contract TestLibrary {
    using MyLibrary for uint256;

    function testIncrement(uint256 value) public pure returns (uint256) {
        return value.increment();
    }

    function testDecrement(uint256 value) public pure returns (uint256) {
        return value.decrement();
    }

    function testIncrementByValue(uint256 value, uint256 _value)
        public
        pure
        returns (uint256)
    {
        return MyLibrary.incrementByValue(value, _value);
    }

    function testDecrementByValue(uint256 value, uint256 _value)
        public
        pure
        returns (uint256)
    {
        return MyLibrary.decrementByValue(value, _value);
    }
}
