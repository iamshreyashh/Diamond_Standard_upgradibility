require("@nomicfoundation/hardhat-ignition-ethers");

const XINFIN_NETWORK_URL = "https://erpc.apothem.network";
const XINFIN_PRIVATE_KEY = "PRIVATE_KEY_HIDDEN";

module.exports = {
  solidity: "0.8.20",
  networks: {
    xinfin: {
      url: XINFIN_NETWORK_URL,
      accounts: [XINFIN_PRIVATE_KEY],
    },
  },
};