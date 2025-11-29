// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

contract ConsentPolicy {
    address public owner;

    mapping(address => bool) public consentGiven;

    constructor() {
        owner = msg.sender;
    }

    function giveConsent() external {
        consentGiven[msg.sender] = true;
    }

    function revokeConsent() external {
        consentGiven[msg.sender] = false;
    }
}
