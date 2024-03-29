// SPDX-License-Identifier: UNLISENCED
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(uint256 totalSupply) public ERC20("MyToken", "MTN") {
        _mint(owner(), totalSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return 9;
    }
}
