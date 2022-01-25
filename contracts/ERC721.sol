// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.11;

import "./IERC721.sol";

contract ERC721 is IERC721 {

    // Mapping from token ID to owner address
    mapping(uint256 => address) internal _owners;

    // Mapping owner address to token count
    mapping(address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    function balanceOf(address _owner) external override view returns (uint256 _balance){
        return _balances[_owner];
    }

    function ownerOf(uint256 _tokenId) external override view returns (address _owner){
        return _owners[_tokenId];
    }

    modifier onlyOwnerOf(uint _tokenId){
        require(msg.sender==_owners[_tokenId],"Only the owner of the token can perform that action");
        _;
    }

    function _transfer(address _from, address _to, uint256 _tokenId) private onlyOwnerOf(_tokenId) {
        _balances[_from] -= 1;
        _balances[_to] += 1;
        _owners[_tokenId] = _to;
        emit Transfer(_from,_to,_tokenId);
    }

    function transfer(address _to, uint256 _tokenId) external override {
        _transfer(msg.sender,_to,_tokenId);
    }

    function approve(address _to, uint256 _tokenId) external override onlyOwnerOf(_tokenId){
        _tokenApprovals[_tokenId] = _to;
        emit Approval(msg.sender,_to,_tokenId);
    }

    function takeOwnership(uint256 _tokenId) external override{
        require(_tokenApprovals[_tokenId] == msg.sender, "Need to be approved first");
        _balances[_owners[_tokenId]] -= 1;
        _balances[msg.sender] += 1;
        _owners[_tokenId] = msg.sender;
    }
}