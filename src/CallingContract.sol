// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Contract can call other contracts in 2 ways.
// * The easiest way is to just call it, like A.foo(x, y, z).
// * Another way to call other contracts is to use the low-level call.
// This method is not recommended.

contract Callee {
    uint256 public x;
    uint256 public value;

    function setX(uint256 _x) public returns (uint256) {
        x = _x;
        return x;
    }

    function setXandSendEther(
        uint256 _x
    ) public payable returns (uint256, uint256) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller {
    function setX(Callee _callee, uint256 _x) public {
        uint256 x = _callee.setX(_x);
    }

    function setXFromAddress(address _addr, uint256 _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    function setXandSendEther(Callee _callee, uint256 _x) public payable {
        (uint256 x, uint256 value) = _callee.setXandSendEther{value: msg.value}(
            _x
        );
    }
}

// 1. 定义接口（或者引入对方的源代码）
interface ICounter {
    function increment(uint256 amount) external returns (uint256);
}

contract MyContract {
    // 传入目标合约地址
    function callOtherContract(address _counterAddress) external {
        // 2. 实例化接口并直接调用
        ICounter counter = ICounter(_counterAddress);

        // 像调本地函数一样调用
        uint256 newCount = counter.increment(10);
    }
}

contract MyContract2 {
    function callOtherContractLowLevel(address _addr) external {
        // 1. 手动打包数据：函数签名 + 参数
        bytes memory payload = abi.encodeWithSignature(
            "increment(uint256)",
            10
        );

        // 2. 发起底层调用
        // 返回两个值：是否成功 (bool)，返回的数据 (bytes)
        (bool success, bytes memory data) = _addr.call(payload);

        // 3. ⚠️ 必须手动处理错误
        require(success, "Call failed");

        // 4. (可选) 如果需要返回值，必须手动解码
        // uint256 newCount = abi.decode(data, (uint256));
    }
}
