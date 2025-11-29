// SPDX-License-Identifier: License-Reserved
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title EncryptHealthToken
 * @notice Final deployed version for EncryptHealth™. All rights reserved.
 */
contract EncryptHealthToken is ERC20 {
    constructor() ERC20("EncryptHealth", "EHT") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }
}
