// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

contract UserActivity {
    address public owner;

    struct Activity {
        uint256 id;
        address user;
        string activityType;
        uint256 timestamp;
    }

    mapping(uint256 => Activity) public activities;
    uint256 public counter;

    constructor() {
        owner = msg.sender;
    }

    function recordActivity(string calldata activityType) external {
        counter++;
        activities[counter] = Activity(counter, msg.sender, activityType, block.timestamp);
    }
}
