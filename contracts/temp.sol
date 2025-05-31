// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Temp is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}


    uint256[] public data = [1,2,3,4];

    function modData() public {
        uint256[] storage storageRef = data;
        storageRef[0] = 1234;}

    function modData2() public {
        
        data[0] = 333;}

    function getItem(uint256 _index) public returns(uint256){
        require(_index < data.length, "Stop right there");
        return data[_index];
    }


}