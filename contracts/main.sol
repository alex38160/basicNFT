// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

import "./ERC721.sol";
import "./ownable.sol";

contract MyNFT is ERC721, ownable {
    uint256 private mintingPrice = 0.001 ether;
    uint256 private tokenAvailable = 0;

    function mint(string memory uri) public payable {
        require(msg.value == mintingPrice, "Must pay for minting the token");
        tokenAvailable++;
        _owners[tokenAvailable] = msg.sender;
        _balances[msg.sender] += 1;
        _tokenUris[tokenAvailable] = uri;
    }

    function withdraw() external {
        require(msg.sender == owner);
        payable(msg.sender).transfer(address(this).balance);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}