// SPDX-License-Identifier: MIT
// UNTESTED CODE, DO NOT USE IN PRODUCTION!

pragma solidity ^0.7.0;

import "../ERC677/ERC677Receiver.sol";

/**
 * @dev Example of a smart contract receiving an ERC677-compatible token
 */
contract ReceiverExample is ERC677Receiver {

    address payable private payTo;
    uint private feePercentage;
    
    constructor(address payable _payTo, uint _feePercentage) {
    
    }

    function onTokenTransfer(address _from, uint256 _amount, bytes memory _data) public override returns(bool success) {

    }

}