// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "hardhat/console.sol";

contract Tarefa01 is ERC20 {
    constructor() ERC20("Tarefa01", "T1L") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }
}
