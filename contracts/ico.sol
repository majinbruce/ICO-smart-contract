pragma solidity ^0.5.0;

import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";
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
    uint256 preSalePrice = 22666;
    uint256 seedSalePrice = 13600;
    uint256 publicSalePrice = 3400;

    // crowdsale stages
    uint256 preSale = 0;
    uint256 seedSale = 1;
    uint256 publicSale = 2;

    //this mapping tracs the amount of tokens available per stage
    mapping(uint256 => uint256) private stageTokens;

    function setStageTokenMapping() private {
        stageTokens[preSale] = preSaleQty;
        stageTokens[seedSale] = seedSaleQty;
        stageTokens[publicSale] = publicSaleQty;
    }

    //this mapping tracs the rate per stage
    mapping(uint256 => uint256) private stageRate;

    // function getRate() private view returns () {}

    function _getTokenAmount(uint256 weiAmount, uint256 rate)
        internal
        view
        returns (uint256)
    {
        {
            return (weiAmount.mul(rate));
        }
    }
    /*
    function currentSaleStage() public view returns (crowdSaleStage _stage) {
        return saleStage;
    }

   function availableTokensForCurrentStage() public view returns (uint256) {
        SaleStages _stage = currentSaleStage();

        uint256 maxTokens;

        if (_stage == SaleStages.PreSale) {
            maxTokens = tokensAvailableForStage[SaleStages.PreSale];
        } else if (_stage == SaleStages.SeedSale) {
            maxTokens = (tokensAvailableForStage[SaleStages.PreSale] +
                tokensAvailableForStage[SaleStages.SeedSale]);
        } else if (_stage == SaleStages.FinalSale) {
            maxTokens = totalTokensToSell;
        }

        return maxTokens - tokensSold;
    }

    function currentTokenPriceInCents() external view returns (uint256) {
        return pricePerTokenForStage[currentSaleStage()];
    }
    */
}
