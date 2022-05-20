pragma solidity ^0.6.0;

import "./crowdsale.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

contract MyTokenCrowdsale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {
        setStageTokensMapping();
    }

    uint256 public preSaleQty = 30000000 * 10**9;
    uint256 public seedSaleQty = 50000000 * 10**9;
    uint256 public publicSaleQty = 20000000 * 10**9;

    //

    uint256 preSaleRate = 16667;
    uint256 seedSaleRate = 13600;
    uint256 publicSaleRate = 3400;

    // crowdsale stages
    uint256 public preSale = 0;
    uint256 public seedSale = 1;
    uint256 public publicSale = 2;

    //this mapping tracs the amount of tokens available per stage
    mapping(uint256 => uint256) public stageTokens;

    function setStageTokensMapping() private {
        stageTokens[preSale] = preSaleQty;
        stageTokens[seedSale] = seedSaleQty;
        stageTokens[publicSale] = publicSaleQty;
    }

    function setContractStage(uint256 setContractstage)
        private
        returns (uint256)
    {
        return contractStage = setContractstage;
    }

    // function getRate() private view returns () {}
    uint256 contractStage;

    function _getTokenAmount(uint256 weiAmount)
        internal
        view
        override
        returns (uint256)
    {
        if (contractStage == preSale) {
            return (weiAmount.mul(preSaleRate).div(10**9));
        } else if (contractStage == seedSale) {
            return (weiAmount.mul(seedSaleRate).div(10**9));
        } else {
            return (weiAmount.mul(publicSaleRate).div(10**9));
        }
    }

    function _processPurchase(address beneficiary, uint256 tokenAmount)
        internal
        override
    {
        if (contractStage == 0) {
            require(tokenAmount < stageTokens[preSale] && tokenAmount != 0);
            stageTokens[preSale] = stageTokens[preSale].sub(tokenAmount);

            if (stageTokens[preSale] == 0) {
                setContractStage(1);
            }
        } else if (contractStage == 1) {
            require(tokenAmount < stageTokens[seedSale] && tokenAmount != 0);
            stageTokens[seedSale] = stageTokens[seedSale].sub(tokenAmount);

            if (stageTokens[seedSale] == 0) {
                setContractStage(2);
            }
        } else if (contractStage == 2) {
            require(tokenAmount < stageTokens[publicSale] && tokenAmount != 0);
            stageTokens[publicSale] = stageTokens[publicSale].sub(tokenAmount);
        }

        super._processPurchase(beneficiary, tokenAmount);
    }
}
