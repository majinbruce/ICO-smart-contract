require("@nomiclabs/hardhat-waffle");
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const { RINKEBY_PRIVATE_KEY, ALCHEMY_API_KEY, ETHERSCAN_API_KEY } = process.env;


module.exports = {
  solidity: {
    compilers: [
      {
        version: "0.6.0",
      },
      {
        version: "0.6.2",
      },
    ],
  },

  networks: {
    rinkeby: {
      url: ALCHEMY_API_KEY,
      accounts: [`0x${RINKEBY_PRIVATE_KEY}`],
    },
  },

  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};
