// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

contract NeuroBalanceConsent {
    address public owner;

    struct Consent {
        bool heartRate;
        bool mood;
        bool sleep;
        bool motion;
    }

    mapping(address => Consent) public userConsent;

    constructor() {
        owner = msg.sender;
    }

    function updateConsent(bool heartRate, bool mood, bool sleep, bool motion) external {
        userConsent[msg.sender] = Consent(heartRate, mood, sleep, motion);
    }
}
