/** @type import('hardhat/config').HardhatUserConfig */
require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

const WALLET_PRIVATE_KEY = process.env.WALLET_PRIVATE_KEY;
const POLYGONSCAN_API_KEY = process.env.POLYGONSCAN_API_KEY;
const INFURA_URL = process.env.INFURA_URL;

module.exports = {
  solidity: "0.8.4",
  networks: {
    matic: {
      url: INFURA_URL,
      accounts: [`0x${WALLET_PRIVATE_KEY}`]
    },
  },
  etherscan: {
    apiKey: POLYGONSCAN_API_KEY
  },
};
