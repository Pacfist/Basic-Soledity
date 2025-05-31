// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MathewToken is ERC721, Ownable {
    uint256 private _nextTokenId;
    uint256 private _priceInWei;
    uint256 private _maxSupply;

    constructor(address initialOwner, uint256 _price, uint256 _supply)
        ERC721("Mathew Token", "MT")
        Ownable(initialOwner)
    {
        _priceInWei = _price;
        _maxSupply = _supply;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://bd3531da5cf5857e7cfaa92426877b022e612cf8/";

    }

    function safeMint(address to) public onlyOwner returns (uint256) {
        require(_nextTokenId < _maxSupply, "A lot");
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        return tokenId;
    }

    function buy() public payable {
        require(_nextTokenId < _maxSupply, "A lot");
        
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
    }

    function withdraw() public onlyOwner{
        uint256 balance = address(this).balance;
        require(balance > 0, "nothing");
        payable(owner()).transfer(balance);
    }
}
 

