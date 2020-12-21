// SPDX-License-Identifier: MIT
// ERC677 proposed @ https://github.com/ethereum/EIPs/issues/677
pragma solidity ^0.7.0;

import "../../openzeppelin/token/ERC20/ERC20.sol";
import "./ERC677Receiver.sol";

contract ERC677 is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}

    function transferAndCall(address _receiver, uint256 _amount, bytes memory _data) public returns(bool success) {
        transfer(_receiver, _amount); // Call ERC20 transfer() method, returns a bool
        ERC677Receiver receiverContract;

        receiverContract = ERC677Receiver(_receiver);
        receiverContract.onTokenTransfer(_msgSender(), _amount, _data); // Call receiver contract; does not guarantee a return if receiver does not have onTokenTransfer()
        return true;
    }
}