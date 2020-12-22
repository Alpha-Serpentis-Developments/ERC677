// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../ERC677/ERC677.sol";

contract TokenExample is ERC677 {

    constructor(address _mintTo, uint256 _amount, uint8 _decimals) ERC677("ERC677", "677") {
        _mint(address(_mintTo), _amount);
        _setupDecimals(_decimals);
    }
    
    function mint(address _to, uint256 _amount) public {
        _mint(_to, _amount);
    }

}