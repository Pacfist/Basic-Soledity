// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract Car{
    uint256 public vinNuv;
    constructor(uint256 _vinNuv){
        vinNuv = _vinNuv;
    }

    bool public isMoving;

    function drive() public virtual{
        isMoving = true;
    } 

    function stop() public{
        isMoving = false;
    }

    function status() public view returns(string memory){
        return isMoving ? "EDEM" : "STOIM";
    }
}

contract Turbo {
    function boost() public pure returns(string memory){
        return("VZHUUUUUUU");
    }
}

contract BMWM7 is Car, Turbo {

    constructor() Car(123){
        
    }

    function pizdec_ey() public{
        isMoving = false;
    }

    function drive() public override {
        super.drive();
        revert("Pizda dvizhku");
    }
}