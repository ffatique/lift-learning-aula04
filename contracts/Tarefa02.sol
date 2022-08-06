// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract Tarefa02 is ERC20 {
    uint public BURN_RATE = 5;

    constructor() ERC20("Tarefa02", "T2L") {
        _mint(msg.sender, 10000 * 10**decimals());
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        uint burnAmount = (amount * BURN_RATE / 100);
        _burn(_msgSender(), burnAmount);
        _transfer(owner, to, amount - burnAmount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        uint burnAmount = (amount * BURN_RATE / 100);
        _spendAllowance(from, spender, amount);
        _burn(_msgSender(), burnAmount);
        _transfer(from, to, amount - burnAmount);
        return true;
    }

}
