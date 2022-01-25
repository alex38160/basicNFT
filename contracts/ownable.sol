// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.11;

contract ownable {
    address public owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function Ownable() public {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}