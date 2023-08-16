//SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.11;




interface ERC165 {
    
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}


interface X is ERC165 {


    function getNumOfTweets() external view returns (uint8);


}


contract Account is X{

uint8 public tweets;

constructor(uint8 _tweets){
    setNumOfTweets(_tweets);
}

function getNumOfTweets() external view returns (uint8){
    return tweets;
}

function setNumOfTweets(uint8 _tweets) public {
    tweets = _tweets;
}

function supportsInterface(bytes4 interfaceId) external pure returns (bool){
    return interfaceId == 0xa0f4a7a6;
}


}



contract Selector {

    function calculateInterfaceId() external pure returns (bytes4){
        X i;
        return i.getNumOfTweets.selector;
    }
}


contract XTracker {

    
   
    function readStats(address _addr) external view returns (uint8){
        require(ERC165(_addr).supportsInterface(0xa0f4a7a6), "Does not support X Interface");
       
        
        return X(_addr).getNumOfTweets();
    }

    
    


}