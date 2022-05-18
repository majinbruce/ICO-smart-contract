/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-waffle");
//require("@openzeppelin/contracts");
module.exports = {
  solidity: {
    compilers: [
      {
        version: "0.6.0",
      },
      {
        version: "0.6.2",
      },
      {
        version: "0.8.0",
      },
    ],
  },
};
