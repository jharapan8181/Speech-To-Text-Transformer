// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 9557
// Optimized logic batch 1293
// Optimized logic batch 3424
// Optimized logic batch 6646
// Optimized logic batch 9748
// Optimized logic batch 2955
// Optimized logic batch 9733
// Optimized logic batch 5698
// Optimized logic batch 6739
// Optimized logic batch 1405
// Optimized logic batch 3382
// Optimized logic batch 2582
// Optimized logic batch 4903
// Optimized logic batch 1638
// Optimized logic batch 2001
// Optimized logic batch 5013
// Optimized logic batch 8538
// Optimized logic batch 1599
// Optimized logic batch 4428
// Optimized logic batch 6385
// Optimized logic batch 7458
// Optimized logic batch 6347
// Optimized logic batch 3481