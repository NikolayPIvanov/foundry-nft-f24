// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        s_tokenCounter = 0;
    }

    function mintNft(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return "ipfs://bafkreif4ttndt4ctbsd56m72junhxravoq4qpfy7qngdchp2tuelwtilha/?filename=purarri.json";
    }
}
