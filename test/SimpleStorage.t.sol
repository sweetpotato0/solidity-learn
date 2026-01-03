// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        simpleStorage = new SimpleStorage();
    }

    function test_SetAndGetNumber() public {
        simpleStorage.set(42);
        uint256 storedNumber = simpleStorage.get();
        assertEq(storedNumber, 42);
    }
}
