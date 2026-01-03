// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    Counter public counter;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        // 2. 将私钥传入 startBroadcast
        vm.startBroadcast(deployerPrivateKey);
        counter = new Counter();
        counter.setNumber(10);
        counter.increment();
        vm.stopBroadcast();
    }
}
