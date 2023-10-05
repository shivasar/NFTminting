// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    uint public unlockTime;
    address payable public owner;

    event Withdrawal(uint amount, uint when);

    constructor(uint _unlockTime) payable {
        require(
            block.timestamp < _unlockTime,
            "Unlock time should be in the future"
        );

        unlockTime = _unlockTime;
        owner = payable(msg.sender);
    }

    function withdraw() public {
        // Uncomment this line, and the import of "hardhat/console.sol", to print a log in your terminal
        // console.log("Unlock time is %o and block timestamp is %o", unlockTime, block.timestamp);

        require(block.timestamp >= unlockTime, "You can't withdraw yet");
        require(msg.sender == owner, "You aren't the owner");

        emit Withdrawal(address(this).balance, block.timestamp);

        owner.transfer(address(this).balance);
    }
}
/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityPlatform {

    // Struct to represent a Charity
    struct Charity {
        string name;
        string description;
        address payable walletAddress;
        bool verified;
        uint256 totalDonations;
    }

    // Struct to represent a Donation
    struct Donation {
        address donor;
        uint256 amount;
        uint256 timestamp;
    }

    // Struct to represent a Funding Request
    struct FundingRequest {
        address charityAddress;
        uint256 amountRequested;
        uint256 votes;
        bool approved;
    }

    // Mapping to store charities
    mapping(address => Charity) public charities;

    // Mapping to store donations for each charity
    mapping(address => Donation[]) public donations;

    // Mapping to store funding requests
      FundingRequest[] public fundingRequests;

    // Mapping to store votes on funding requests
    mapping(address => mapping(uint256 => bool)) public votes;

    // Address of the owner
    address public owner;

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }
    FundingRequest[] public fundingRequests;

    // Mapping to store votes on funding requests
    mapping(address => mapping(uint256 => bool)) public votes;

    // Address of the owner
    address public owner;

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }



