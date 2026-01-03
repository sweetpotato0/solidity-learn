// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.26;

import {Test} from "forge-std/Test.sol";
import {EtherUnits} from "../src/EtherUnits.sol";

contract EtherUnitsTest is Test {
    EtherUnits public etherUnits;

    function setUp() public {
        etherUnits = new EtherUnits();
    }

    function test_OneWeiIsOne() public {
        assertEq(etherUnits.oneWeiIsOne(), true);
    }

    function test_OneGweiIs1e9() public {
        assertEq(etherUnits.oneGweiIs1e9(), true);
    }

    function test_OneEtherIs1e18() public {
        assertEq(etherUnits.oneEtherIs1e18(), true);
    }
}
