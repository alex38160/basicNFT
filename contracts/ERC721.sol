// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.11;

import "./IERC721.sol";

abstract contract ERC721 is IERC721 {
    // Mapping from token ID to owner address
    mapping(uint256 => address) internal _owners;

    // Mapping owner address to token count
    mapping(address => uint256) internal _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    // Mapping from token ID to its metadatas
    mapping(uint256 => string) internal _tokenUris;

    function balanceOf(address _owner)
        external
        view
        override
        returns (uint256 _balance)
    {
        return _balances[_owner];
    }

    function ownerOf(uint256 _tokenId)
        external
        view
        override
        returns (address _owner)
    {
        return _owners[_tokenId];
    }

    modifier onlyOwnerOf(uint256 _tokenId) {
        require(
            msg.sender == _owners[_tokenId],
            "Only the owner of the token can perform that action"
        );
        _;
    }

    function tokenURI(uint256 _tokenId) external view returns (string memory) {
        require(_owners[_tokenId] != address(0), "This token is not minted");
        return _tokenUris[_tokenId];
    }

    function _approve(address _to, uint256 _tokenId)
        internal
        onlyOwnerOf(_tokenId)
    {
        _tokenApprovals[_tokenId] = _to;
        emit Approval(msg.sender, _to, _tokenId);
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _tokenId
    ) private {
        _approve(_to, _tokenId);
        _balances[_from] -= 1;
        _balances[_to] += 1;
        _owners[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function safeTransferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) public payable override {
        _transfer(_from, _to, _tokenId);
    }

    function transferTo(address _to, uint256 _tokenId) public payable {
        _transfer(msg.sender, _to, _tokenId);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) public payable override {
        _transfer(_from, _to, _tokenId);
    }

    function approve(address to, uint256 tokenId) public override {
        _approve(to, tokenId);
    }
}
