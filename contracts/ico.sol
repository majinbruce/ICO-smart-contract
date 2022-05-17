pragma solidity ^0.5.0;

import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyTokenCrowdsale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {
        //setting the initial values of mappings from constructor arg values
        stageTokens[crowdSaleStage.preSale] = preSaleQty;
    }

    uint256 preSaleQty = 30000000 * 10**9;
    uint256 seedSaleQty = 50000000 * 10**9;
    uint256 publicSaleQty = 20000000 * 10**9;
    uint256 preSalePrice = 22666;
    uint256 seedSalePrice = 13600;
    uint256 publicSalePrice = 3400;
    // crowdsale stages

    enum crowdSaleStage {
        preSale,
        seedSale,
        publicSale
    }

    // set default stage to pre sale stage
    crowdSaleStage constant defaultStage = crowdSaleStage.preSale;
    crowdSaleStage stage;

    //this mapping tracs the amount of tokens available per stage
    mapping(bytes32 => uint256) private stageTokens;

    function getPresale() private view returns (uint256) {
        return stageTokens[sha3(crowdSaleStage.preSale)];
    }

    function setpreSale(uint256 qty) private view {
        stageTokens[getPresale()] = qty;
    }

    //this mapping tracs the rate per stage
    mapping(bytes32 => uint256) private stageRate;

    function getCrowdSaleStage() public view returns (crowdSaleStage) {
        return stage;
    }

    // function getRate() private view returns () {}

    function _getTokenAmount(uint256 weiAmount, rate)
        internal
        view
        returns (uint256)
    {
        if (stage = crowdSaleStage.preSale) {
            return (weiAmount.mul(rate));
        }
    }

    function currentSaleStage() public view returns (stage _stage) {
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
}
