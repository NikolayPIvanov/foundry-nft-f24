// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "foundry-devops/DevOpsTools.sol";

contract MintBasicNft is Script {
    string public constant PURARRI_URL =
        "ipfs://bafkreifzadtolb5xea6u2doktnxeovwo4p7vv3ywaryqhe3ghlsbmwqggy/?filename=purarri.json";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);

        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address _mostRecentlyDeployed) public {
        vm.startBroadcast();

        BasicNft(_mostRecentlyDeployed).mintNft(PURARRI_URL);

        vm.stopBroadcast();
    }
}
