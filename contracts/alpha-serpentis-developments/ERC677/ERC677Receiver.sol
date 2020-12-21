// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

abstract contract ERC677Receiver {
    event Transfer(address, address, uint256, bytes);

    function onTokenTransfer(address _from, uint256 _amount, bytes memory _data) public virtual returns(bool success);
}