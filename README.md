# ICO-smart-contract

## MyToken.sol contarct
This contract deploys an ERC20 token with the following details.

* Name: "MyToken"

* Symbol: "MTN"

* Decimals: 9 (usually a token has 18 decimal places)

* Total Supply: 100 million => 10**8 => 100000000

* Contract deployed on ropsten test network at:

> 0xB8024F57322A00D55269CEa0D5B1Aee4Da9979F2 

## crowdSale.sol contarct
This contract was took from openzepplin, which handles the checks,events & token transfer

## ico.sol contarct
Inherits from crwdSale.sol, has a mapping that manages amount of tokens available per stage

* Contract deployed on rinkeby test network at:
> 0xf22b13F41FF82B22c7b9770Eac0D23904D57B333

This contract sells the tokens received in three different stages at different prices.
SaleStages: PreSale, SeedSale, FinalSale

### Tokens available in different stages:-
* PreSale: 30 million tokens
* SeedSale: 50 million tokens
* FinalSale: 20 million tokens

### Token price for different stages:-
* PreSale: 15 cents/ $0.15 per token
* SeedSale: 25 cents/ $0.25 per token
* FinalSale: 150 cents/ $1 per token

### Rate Calculation Formula:-
> rate= (currentPriceOfEther/PriceOfTokenPerStage*10^9)

### rate for different stages:-
assuming the current price of ether to be $2500

* PreSaleRate: 
* SeedSaleRate: 
* FinalSaleRate: 

