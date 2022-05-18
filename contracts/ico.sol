pragma solidity ^0.6.0;

import "./crowdsale.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "hardhat/console.sol";

contract MyTokenCrowdsale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {}

    uint256 preSaleQty = 30000000 * 10**9;
    uint256 seedSaleQty = 50000000 * 10**9;
    uint256 publicSaleQty = 20000000 * 10**9;

    //

    uint256 preSaleRate = 22666;
    uint256 seedSaleRate = 13600;
    uint256 publicSaleRate = 3400;

    // crowdsale stages
    uint256 preSale = 0;
    uint256 seedSale = 1;
    uint256 publicSale = 2;

    //this mapping tracs the amount of tokens available per stage
    mapping(uint256 => uint256) private stageTokens;

    function setStageTokensMapping() private {
        stageTokens[preSale] = preSaleQty;
        stageTokens[seedSale] = seedSaleQty;
        stageTokens[publicSale] = publicSaleQty;
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
            return (weiAmount.mul(preSaleRate));
        } else if (contractStage == seedSale) {
            return (weiAmount.mul(seedSaleRate));
        } else {
            return (weiAmount.mul(publicSaleRate));
        }
    }

    function _processPurchase(address beneficiary, uint256 tokenAmount)
        internal
        override
    {
        if (contractStage == 0) {
            require(tokenAmount < stageTokens[preSale] && tokenAmount != 0);
            stageTokens[preSale] = stageTokens[preSale].sub(tokenAmount);

            if (preSaleQty == 0) {
                contractStage = 1;
            }
        } else if (contractStage == 1) {
            require(tokenAmount < stageTokens[seedSale] && tokenAmount != 0);
            stageTokens[seedSale] = stageTokens[seedSale].sub(tokenAmount);

            if (seedSaleQty == 0) {
                contractStage = 2;
            }
        } else if (contractStage == 2) {
            require(tokenAmount < stageTokens[publicSale] && tokenAmount != 0);
            stageTokens[publicSale] = stageTokens[publicSale].sub(tokenAmount);
        }

        super._processPurchase(beneficiary, tokenAmount);
    }
}
