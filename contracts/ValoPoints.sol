// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ValorantPointsToken is ERC20, Ownable {
    uint256 public totalVPAdded;
    uint256 public totalVPRemoved;

    event TotalVPAdded(address indexed recipient, uint256 amount);
    event TotalVPRemoved(address indexed burner, uint256 amount);
    event TransferredVP(address indexed sender, address indexed recipient, uint256 amount);

    constructor() ERC20("Valorant Points", "VP") Ownable(msg.sender) {}

    function addingVP(uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        _mint(owner(), amount);
        totalVPAdded += amount;

        emit TotalVPAdded(owner(), amount);
    }

    function removingVP(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to burn");
        _burn(msg.sender, amount);
        totalVPRemoved += amount;

        emit TotalVPRemoved(msg.sender, amount);
    }

    function tokenTurnover() external view returns (uint256) {
        return totalVPAdded + totalVPRemoved;
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(recipient != address(0), "Transfer to the zero address is not allowed");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance to transfer");

        _transfer(msg.sender, recipient, amount);
        emit TransferredVP(msg.sender, recipient, amount);

        return true;
    }
}
