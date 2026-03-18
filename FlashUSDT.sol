// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; // Updated version

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract FlashUSDT is ERC20, Ownable {
    // Note: OZ 5.0+ requires passing an address to Ownable
    constructor() ERC20("Tether USD", "USDT") Ownable(msg.sender) {
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 6; 
    }
}
