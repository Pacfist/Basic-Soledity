// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{

    uint256 public minUSD = 5;
    AggregatorV3Interface internal priceFeed;
    constructor() {
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }
    function fund() public payable{
        require(msg.value >= minUSD, "Not enough eth!");
        
    }
    function getPrice() public view returns (uint256) {
    (, int256 price, , ,) = priceFeed.latestRoundData();
    return uint256(price * 1e10); // Convert from 8 decimals to 18 decimals
}
}