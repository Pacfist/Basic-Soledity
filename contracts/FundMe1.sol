// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minUSD = 0.1 * (10 ** 18);

    AggregatorV3Interface internal priceFeed;

    mapping(address => uint256) public fundersAndMoney;
    constructor() {
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }
    function fund() public payable{
        //require(getConversionRate(msg.value) >= minUSD, "Not enough eth!");
        fundersAndMoney[msg.sender] += msg.value;
        
    }
    function getPrice() public view returns (uint256) {
        (, int256 price, , ,) = priceFeed.latestRoundData();
        return uint256(price * 1e10); // Convert from 8 decimals to 18 decimals
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethInUSD = (ethPrice * ethAmount) / 1e18;
        return ethInUSD;
    }
}