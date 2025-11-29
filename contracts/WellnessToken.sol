// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WellnessToken is ERC20 {
    address public owner;

    constructor() ERC20("WellnessToken", "WLT") {
        owner = msg.sender;
        _mint(owner, 1000000 * 10**18);
    }

    function mintTo(address user, uint256 amount) external {
        require(msg.sender == owner, "not owner");
        _mint(user, amount);
    }
}
