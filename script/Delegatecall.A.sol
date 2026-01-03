// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {A} from "../src/Delegatecall.A.sol";

contract Delegatecall is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // 2. 将私钥传入 startBroadcast
        vm.startBroadcast(deployerPrivateKey);
        // 部署合约
        A a = new A();
        a.setVarsDelegateCall(
            address(0x5FbDB2315678afecb367f032d93F642f64180aa3), // 之前部署得到的 B 合约地址
            42
        );
        a.setVarsCall(
            address(0x5FbDB2315678afecb367f032d93F642f64180aa3), // 之前部署得到的 B 合约地址
            42
        );
        vm.stopBroadcast();
    }
}
