// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;
    address public owner;
    constructor() public{
        owner = msg.sender;
    }
    function fund() public payable {
        // uint256 minUSD = 7000;
        // require(getConversionRate(msg.value) >= minUSD, "Spen more!");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    function version() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); 
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer)/ 1e8;
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        return ethAmount * ethPrice * 1000000000;
    }

    function getAdderss() public view returns(address){
        return msg.sender;
    }
    modifier  onlyOwner{
        require(owner == payable(msg.sender));
        _;
    }
    function withdraw() payable onlyOwner public{
        //require(owner == payable(msg.sender));
        payable(msg.sender).transfer(address(this).balance);

        for (uint i=0; i<funders.length; i++) 
        {
            addressToAmountFunded[funders[i]] =0;
        }
        funders = new address[](0);

    }

    function transfer(address _address) payable public{
        payable(_address).transfer(address(this).balance);
    }

    function getAddressThis() public view returns(uint256){
        return address(this).balance;
        
    }

    
} 

