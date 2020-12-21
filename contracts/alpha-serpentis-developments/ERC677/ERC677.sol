// SPDX-License-Identifier: MIT
// ERC677 proposed @ https://github.com/ethereum/EIPs/issues/677
pragma solidity ^0.7.0;

import "../../openzeppelin/token/ERC20/ERC20.sol";

abstract contract ERC677 is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    function transferAndCall(address _receiver, uint256 _amount, bytes memory _data) public virtual returns(bool success);
}