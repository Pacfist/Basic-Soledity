// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract Elections{
    string[] public electors;

    uint256 public maxVotes;

    uint256 public electionTime;

    mapping(address => bool) public isVoted;
    mapping(uint256 => uint256) public numberOfVotes;

    address public owner;

    bool public isVoteGoes;

    constructor(string[] memory _electors, uint256 _maxVotes, uint256 _electionTime){
        maxVotes = _maxVotes;
        electors = _electors;
        electionTime = _electionTime;
        owner = msg.sender;
        isVoteGoes = true;
    }

    function vote(uint256 _number) public {
        require(isVoted[msg.sender] == false, "You can't vote again");
        require(_number < electors.length, "Does not exist. ");
        require(maxVotes > 0, "Max votes a lot");
        require(msg.sender != owner, "Owner can vote");
        require(isVoteGoes == true, "Election stoped.");
        isVoted[msg.sender] = true;
        numberOfVotes[_number] +=1;
        maxVotes -=1;
    }

    function stopVoting() public{
        require(msg.sender == owner, "Not owner");
        isVoteGoes = false;
    }
}