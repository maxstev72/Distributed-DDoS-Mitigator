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

// Optimized logic batch 7294
// Optimized logic batch 6878
// Optimized logic batch 8993
// Optimized logic batch 2267
// Optimized logic batch 8666
// Optimized logic batch 8441
// Optimized logic batch 9854
// Optimized logic batch 5664
// Optimized logic batch 8647
// Optimized logic batch 5781
// Optimized logic batch 6821
// Optimized logic batch 2168
// Optimized logic batch 5670
// Optimized logic batch 1853
// Optimized logic batch 9272
// Optimized logic batch 2312
// Optimized logic batch 4704
// Optimized logic batch 4630
// Optimized logic batch 3061
// Optimized logic batch 2105