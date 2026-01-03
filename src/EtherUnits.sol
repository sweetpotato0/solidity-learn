// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract EtherUnits {
    function oneWeiIsOne() public pure returns (bool) {
        uint256 oneWei = 1 wei;
        // 1 wei is equal to 1
        bool isOneWei = (oneWei == 1);
        return isOneWei;
    }

    function oneGweiIs1e9() public pure returns (bool) {
        uint256 oneGwei = 1 gwei;
        // 1 gwei is equal to 10^9 wei
        bool isOneGwei = (oneGwei == 1e9);
        return isOneGwei;
    }

    function oneEtherIs1e18() public pure returns (bool) {
        uint256 oneEther = 1 ether;
        // 1 ether is equal to 10^18 wei
        bool isOneEther = (oneEther == 1e18);
        return isOneEther;
    }
}
