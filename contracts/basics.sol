// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Basics {
    

    // bytes8 public myBytes = "soledity";

    // function getBytesByIndex(uint256 _index) public view returns (bytes1) {
    //     return myBytes[_index];
    // }

    // enum Skills {NOOB, ADVANCED, PRO}

    // Skills public someSKill;

    // function setSkill() public {
    //     someSKill = Skills.ADVANCED;
    // }

    mapping(address => uint256) public userBalances;

    function addBalance(address _user, uint256 _balance) public {
        userBalances[_user] =_balance;
    } 

    mapping(address => string) public nameAddress;

    function addName(address _add, string memory _name) public {
        nameAddress[_add] = _name;
    }

    function getBalance(address _add) public view returns(uint256) {
        return userBalances[_add];
    }

    function deposit() public payable {
        userBalances[msg.sender] += msg.value;
    }
    address public owner;
    constructor() {
        owner = msg.sender;
    }
}