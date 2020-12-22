// SPDX-License-Identifier: MIT
// UNTESTED CODE, DO NOT USE IN PRODUCTION!

pragma solidity ^0.7.0;

import "../../openzeppelin/math/SafeMath.sol";
import "../../openzeppelin/token/ERC20/ERC20.sol";
import "../ERC677/ERC677.sol";
import "../ERC677/ERC677Receiver.sol";

/**
 * @dev Example of a smart contract receiving an ERC677-compatible token
 */
contract ReceiverExample is ERC677Receiver {

    using SafeMath for uint256;

    address private payTo;
    uint256 private feePercentage;
    
    event ERC677Received(
        address _from, 
        address _token, 
        uint256 _amount
    );
    
    constructor(address _payTo, uint256 _feePercentage) {
        require(_payTo != address(0));
        require(_feePercentage <= 100);
        
        payTo = _payTo;
        feePercentage = _feePercentage;
    }

    function onTokenTransfer(
        address _from, 
        uint256 _amount, 
        bytes memory _data
    ) 
        public 
        override 
        returns(bool success) 
    {
        ERC677 tokenReceived = ERC677(msg.sender);
        // Split the amount
        tokenReceived.transferAndCall(
            payTo, 
            _amount.mul(feePercentage).div(100), 
            ""
        );
        
        emit ERC677Received(_from, msg.sender, _amount);
        return true;
    }
    function letReceiverSendTo(
        address _token, 
        address _to
    ) 
        public 
    {
        require(_to != address(0));
        ERC677 token = ERC677(_token);
        try token.transferAndCall(
            _to, 
            token.balanceOf(address(this)), 
            ""
            ) {
            return; // successful
        } catch {
            ERC20 tokenFallback; // assume ERC677-incompatible; use ERC20
            tokenFallback.transfer(
                _to, 
                token.balanceOf(address(this))
            );
        }
    }

}