// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SellerTarefa04 is Ownable {
    IERC20 tarefaToken; // Our Token Contract

    uint256 public tokensPerMatic = 100; // Tokens price for MATIC

    event BuyTokens(
        address buyer,
        uint256 amountOfMatic,
        uint256 amountOfTokens
    );

    constructor(address tokenAddress) {
        tarefaToken = IERC20(tokenAddress);
    }

    function buyTokens() public payable returns (uint256 tokenAmount) {
        require(msg.value > 0, "Send MATIC to buy some tokens");

        uint256 amountToBuy = msg.value * tokensPerMatic;
        uint256 SellerBalance = tarefaToken.balanceOf(address(this)); // check if the Vendor Contract has enough amount of tokens for the transaction
        require(
            SellerBalance >= amountToBuy,
            "Vendor contract has not enough tokens in its balance"
        );
        bool sent = tarefaToken.transfer(msg.sender, amountToBuy); // Transfer token to the Msg.Sender
        require(sent, "Failed to transfer token to user");

        emit BuyTokens(msg.sender, msg.value, amountToBuy); // emit the event

        return amountToBuy;
    }

    function withdraw() public onlyOwner {
        // Allow the owner of the contract to withdraw MATIC
        uint256 ownerBalance = address(this).balance;
        require(ownerBalance > 0, "Owner has not balance to withdraw");

        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send user balance back to the owner");
    }
}
