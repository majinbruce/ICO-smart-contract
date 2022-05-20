//const { BigNumber } = require("ethers");
const { ethers } = require("hardhat");

async function main() {
  const [owner] = await ethers.getSigners();
  const totalSupply = ethers.utils.parseUnits("1", 17); //100 million tokens

  // Get the ContractFactory and Signers here.
  const Token = await ethers.getContractFactory("MyToken");
  const myToken = await Token.deploy(totalSupply);
  await myToken.deployed();
  //const tokenDecimals = await myToken.decimals();
  console.log("token addr", myToken.address);

  const crowdSale = await ethers.getContractFactory("MyTokenCrowdsale");
  const myTokenCrowdsale = await crowdSale.deploy(
    16667,
    owner.address,
    myToken.address
  );
  await myTokenCrowdsale.deployed();
  console.log("ico addr", myTokenCrowdsale.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
