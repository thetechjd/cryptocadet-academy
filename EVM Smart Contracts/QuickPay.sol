//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;



import "@openzeppelin/contracts/token/ERC20/IERC20.sol";



contract MoneyTransfer {

    address private owner;


    constructor(){
        owner = msg.sender;
    }


    function tokenTransfer(address _payToken, address[] calldata _wallets, uint256[] calldata _amounts) external {
        require(msg.sender == owner, "Not authorized");
        IERC20 payToken = IERC20(_payToken);
        for(uint8 i = 0; i < _wallets.length; i++) {
            payToken.transferFrom(msg.sender, _wallets[i], _amounts[i]);
        }
    }

    function EthTransfer(address[] calldata _wallets, uint256[] calldata _amounts) external {
        require(msg.sender == owner, "Not authorized");
        for(uint8 i = 0; i < _wallets.length; i++) {
            payable(_wallets[i]).transfer(_amounts[i]);
        }

    }

    function emergencyTokenWithdraw(address _token) external {
        require(msg.sender == owner, "Not authorized to withdraw tokens");
        IERC20 token = IERC20(_token);
        uint256 balance = token.balanceOf(address(this));
        token.transfer(msg.sender, balance );
    }

    function emergencyWithdraw() external {
        require(msg.sender == owner, "Not authorized to withdraw tokens");
        // This will payout the owner the contract balance.
        // Do not remove this otherwise you will not be able to withdraw the funds.
        // =============================================================================
        (bool os, ) = payable(owner).call{value: address(this).balance}("");
        require(os);
        // =============================================================================
    }

     receive() external payable {}
    
}