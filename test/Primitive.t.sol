// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Primitives} from "../src/Primitive.sol";

contract PrimitivesTest is Test {
    Primitives public primitives;

    function setUp() public {
        primitives = new Primitives();
    }

    function test_DefaultBoo() public {
        assertEq(primitives.defaultBoo(), false);
    }

    function test_DefaultAddr(uint256 x) public {
        assertEq(
            primitives.defaultAddr(),
            0x0000000000000000000000000000000000000000
        );
    }
}
