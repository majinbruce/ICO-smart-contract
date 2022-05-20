const { expect } = require("chai");

const { BigNumber } = require("ethers");
const { ethers } = require("hardhat");

describe("Token contract", function () {
  let Token;
  let myToken;
  let crowdSale;
  let owner;
  let addr1;
  let addr2; //this is the wallet where funds to be collected
  let addrs;
  let myTokenCrowdsale;

  let totalSupply = ethers.utils.parseUnits("1", 17); //100 million tokens

  beforeEach(async function () {
    // Get the ContractFactory and Signers here.
    Token = await ethers.getContractFactory("MyToken");
    crowdSale = await ethers.getContractFactory("MyTokenCrowdsale");
    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

    myToken = await Token.deploy(totalSupply);
    await myToken.deployed();
    tokenDecimals = await myToken.decimals();

    myTokenCrowdsale = await crowdSale.deploy(
      22666,
      addr2.address,
      myToken.address
    );

    await myTokenCrowdsale.deployed();
  });

  it("Should set the right owner", async function () {
    expect(await myToken.owner()).to.equal(owner.address);
  });

  it("Should assign the total supply of tokens to the owner", async function () {
    const ownerBalance = await myToken.balanceOf(owner.address);
    expect(await myToken.totalSupply()).to.equal(ownerBalance);
    //console.log(await myToken.totalSupply(), "is the total supply");
  });

  it("should set correct token amount in stageToken mapping", async function () {
    const presaleqty = await myTokenCrowdsale.stageTokens(0);
    const seedsaleqty = await myTokenCrowdsale.stageTokens(1);
    const publicsaleqty = await myTokenCrowdsale.stageTokens(2);

    expect(await presaleqty).to.be.equal(
      ethers.utils.parseUnits("30000000", 9)
    );
    expect(await seedsaleqty).to.be.equal(
      ethers.utils.parseUnits("50000000", 9)
    );
    expect(await publicsaleqty).to.be.equal(
      ethers.utils.parseUnits("20000000", 9)
    );
  });
});
