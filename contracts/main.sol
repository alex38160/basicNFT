// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

import "./ERC721.sol";
import "./ownable.sol";

contract MyNFT is ERC721, ownable {
    uint private mintingPrice = 0.001 ether;
    uint private tokenAvailable = 0;
    function mint() public payable {
        require(msg.value ==mintingPrice,"Must pay for minting the token");
        tokenAvailable++;
        _owners[tokenAvailable] = msg.sender;
        _balances[msg.sender] += 1;
    }

    function withdraw() external {
        require(msg.sender == owner);
        payable(msg.sender).transfer(address(this).balance);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}