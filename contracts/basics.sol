// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Basics {
    bool public isGood = false;

    function amIPoor() public returns(bool) {
        if(msg.sender.balance > 10 ether){
            isGood = true;
        }else {
            isGood = false;
        }

        return isGood;
    }
}