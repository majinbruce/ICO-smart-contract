# ICO-smart-contract

## MyToken.sol contarct
This contract deploys an ERC20 token with the following details.

* **Name**: "MyToken"

* **Symbol**: "MTN"

* **Decimals**: 9 (usually a token has 18 decimal places)

* **Total Supply**: 100 million => 10**8 => 100000000

* Contract deployed on ropsten test network at:

> 0x951FC3ee0c458820C0B73808861d0b6A1159603F

## crowdSale.sol contarct
This contract was took from openzepplin, which handles the checks,events & token transfer

## ico.sol contarct
Inherits from crwdSale.sol, has a mapping that manages amount of tokens available per stage

* Contract deployed on rinkeby test network at:
> 0x6Af4890E42Be6246e6B5fF1ED96933628AE60897

This contract sells the tokens received in three different stages at different prices.
SaleStages: PreSale, SeedSale, PublicSale

### Tokens available in different stages:-
* **PreSale**: 30 million tokens
* **SeedSale**: 50 million tokens
* **PublicSale** 20 million tokens

### Token price for different stages:-
* **PreSale**: 15 cents/ $0.15 per token
* **SeedSale**: 25 cents/ $0.25 per token
* **PublicSale** 150 cents/ $1 per token


### Rate Calculation Formula:-
> **Rate**= (currentPriceOfEther/PriceOfTokenPerStage*10^9) <br>
> https://docs.openzeppelin.com/contracts/2.x/crowdsales

### rate for different stages:-
assuming the current price of ether to be $2500

* **PreSaleRate**: 16,667/10^9
* **SeedSaleRate**: 10,100/10^9
* **FinalSaleRate**: 2,500/10^9

### verified at:-
> https://goerli.etherscan.io/address/0x20a6F1D5d37a401841E633678E42b7B78acB1097#code
