// SPDX-License-Identifier: UNLISENCED
pragma solidity >=0.8.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20,Ownable {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTN") {
        _mint(owner(), initialSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return 9;
    }
}
