// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E
*/

// 关键规则：从“最基类”到“最派生类”
// 你必须按照**从最基础（Base）到最具体（Derived）**的顺序排列父合约。如果顺序写反了，或者顺序逻辑冲突，Solidity 编译器会报错。
// 口诀：先写爷爷，再写爸爸。
// 示例：
// 假设继承关系是：Toyota 继承自 Car，Car 继承自 Vehicle。

contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

// Contracts inherit other contracts by using the keyword 'is'.
contract B is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in a depth-first manner.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() returns "B"
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}

// Inheritance must be ordered from "most base-like" to "most derived".
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}
