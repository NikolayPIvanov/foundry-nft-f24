// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNft is Script {
    function run() external returns (BasicNft basicNft) {
        vm.startBroadcast();

        basicNft = new BasicNft("Purrari", "PUR");

        vm.stopBroadcast();
    }
}