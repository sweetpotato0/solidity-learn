// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {B} from "../src/Delegatecall.B.sol";

contract DeployDelegatecallBasic is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // 2. 将私钥传入 startBroadcast
        vm.startBroadcast(deployerPrivateKey);
        // 部署合约
        B b = new B();
        b.setVars(10);
        vm.stopBroadcast();
    }
}
