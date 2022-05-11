pragma solidity ^0.5.0;

import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";

contract myTokenCrowdsale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {}

    //  enum crowdSaleStage {
    //    preSaleStage,
    //     SeedSaleStage
    //   }

    // Crowdsale public stage = crowdSaleStage.preSaleStage;

    /* function setCrowdSaleStage(uint stage ) public {
    if(uint(crowdSaleStage.preSaleStage)==stage){
        stage=crowdSaleStage.preSaleStage;
    }else if (uintcrowdSaleStage.SeedSaleStage)==stage){



        stage=crowdSaleStage.SeedSaleStage;
    }
    }

}
*/
}
