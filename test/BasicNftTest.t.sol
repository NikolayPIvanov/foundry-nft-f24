// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public nft;

    address public user = makeAddr("user");
    string public constant PURRARI_URI =
        "ipfs://bafybeihznsjkrrwz6grf4qzkwpc5rdwmlkptg5r33sab5yfh6ar2yhsfze/?filename=purrari.json";

    function setUp() public {
        deployer = new DeployBasicNft();

        nft = deployer.run();
    }

    function test_NameIsCorrect() public view {
        string memory expectedName = "Purrari";
        string memory actualName = nft.name();

        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(user);

        nft.mintNft(PURRARI_URI);

        assert(nft.balanceOf(user) == 1);
        assert(keccak256(abi.encodePacked(PURRARI_URI)) == keccak256(abi.encodePacked(nft.tokenURI(0))));
    }
}
