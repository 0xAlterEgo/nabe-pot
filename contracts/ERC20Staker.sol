// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/IERC20Staker.sol";
import "./interfaces/INabeEmitter.sol";
import "./interfaces/INabe.sol";
import "./NabeDividend.sol";

contract ERC20Staker is NabeDividend, IERC20Staker {
    
    IERC20 public token;

    constructor(
        INabeEmitter nabeEmitter,
        INabe nabe,
        uint256 pid,
        IERC20 _token
    ) NabeDividend(nabeEmitter, nabe, pid) {
        token = _token;
    }

    function stake(uint256 amount) external {
        _addShare(amount);
        token.transferFrom(msg.sender, address(this), amount);
        emit Stake(msg.sender, amount);
    }

    function unstake(uint256 amount) external {
        _subShare(amount);
        token.transfer(msg.sender, amount);
        emit Unstake(msg.sender, amount);
    }
}