//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "openzeppelin/contracts/token/ERC721/ERC721.sol";
import "openzeppelin/contracts/utils/Counters.sol";
import "openzeppelin/contracts/access/Ownable.sol";
import "openzeppelin/contracts/token/ERC721/extentions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage , ownable{
    using Counters for Counters.Counter;
    Counters.counter private _tokenIDs;
    constructor() ERC721("code Eater" , "CER" ){}
    function mintNFT(address recipient, string memory tokenURI) public onlyOwner returns(uint){
    _tokenIDs.increment();

    uint256 newItemId= _tokenIDs.current();
    _mint(recipient, newItemId);
    _setTokenURI(newItemId, tokenURI);
    return newItemId;
    }
}
