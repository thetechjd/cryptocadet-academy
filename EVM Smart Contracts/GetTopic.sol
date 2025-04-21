// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GetTopic {
    //change to event signature you want
    event SwapAndLiquify(
        uint256 tokensSwapped,
        uint256 ethReceived,
        uint256 tokensIntoLiqudity
        
    );


    function generateEventTopic() external pure returns (bytes32) {
        return keccak256("SwapAndLiquify(uint256,uint256,uint256");
       
    }
}