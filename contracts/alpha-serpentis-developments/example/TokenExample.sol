// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../ERC677/ERC677.sol";

contract TokenExample is ERC677 {

    constructor(string memory _name, string memory _symbol, uint8 _decimals) ERC677(_name, _symbol) {
        _setupDecimals(_decimals);
    }

    function transferAndCall(address _receiver, uint256 _amount, bytes memory _data) public override returns(bool success) {

    }
}