const { expect } = require("chai");
const { BigNumber } = require("ethers");

describe("Token Contract", function () {
  let Token;
  let MyToken;
  let owner;
  let totalSupply = BigNumber.from(1000000000).mul(BigNumber.from(10).pow(9));


  beforeEach(async function () {
    Token = await ethers.getContractFactory("MyToken");
    [owner] = await ethers.getSigners();
    MyToken = await Token.deploy(totalSupply);
  });

  describe("MyToken Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await MyToken.owner()).to.equal(owner.address);
    });
    it("Should assign the total supply of tokens to the owner", async function () {
      const ownerBalance = await MyToken.balanceOf(owner.address);
      expect(await MyToken.totalSupply()).to.equal(ownerBalance);
    });
  });
});
 