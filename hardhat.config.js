/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-waffle");
//require("@openzeppelin/contracts");
module.exports = {
  solidity: {
    compilers: [
      {
        version: "0.5.0",
      },
      {
        version: "0.5.5",
      },
      {
        version: "0.8.0",
      },
    ],
  },
};
