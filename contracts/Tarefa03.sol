// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract Tarefa03 is ERC20 {
    uint256 public TIME_BLOCK = 1672531201; //Date and time (GMT): Sunday, 1 January 2023 00:00:01
    address public contractOwner;

    constructor() ERC20("Tarefa03", "T3L") {
        contractOwner = msg.sender;
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    modifier checkBlock() {
        require(msg.sender == contractOwner || block.timestamp > TIME_BLOCK, 'Wait until 2023');
        _;
    }

    function transfer(address to, uint256 amount) public checkBlock virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public checkBlock virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }
}