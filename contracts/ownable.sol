// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.11;

contract ownable {
    address public owner;
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() {
        _transferOwnership(msg.sender);
    }

    function transferOwnership(address newOwner) public {
        require(
            owner == msg.sender,
            "Only the owner of the contract can transfer the ownership"
        );
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
