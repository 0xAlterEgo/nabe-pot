// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./INabeDividend.sol";

interface IERC20Staker is INabeDividend {
    
    event Stake(address indexed owner, uint256 amount);
    event Unstake(address indexed owner, uint256 amount);

    function stake(uint256 amount) external;
    function unstake(uint256 amount) external;
}