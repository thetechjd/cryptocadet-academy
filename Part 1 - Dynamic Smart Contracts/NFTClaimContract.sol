// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;


import "@openzeppelin/contracts/token/ERC721/IERC721.sol";



interface IERC721A is IERC721 {

    function walletOfOwner(address owner) external view returns(uint256[] memory);

    function balanceOf(address owner) external view returns (uint256);

    function ownerOf(uint256 tokenId) external view returns (address owner);
}



contract SlimysClaim {

    
    mapping(address => uint256[]) public holders;
    bool public invalidIdClaimed = false;
    address public owner; 
    address public deadWallet = 0x000000000000000000000000000000000000dEaD;
    IERC721A public v1;
    IERC721A public v2;
    

    modifier onlyOwner {
        require (msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _v1, address _v2){
        owner = msg.sender;
        v1 = IERC721A(_v1);
        v2 = IERC721A(_v2);

        
    } 
    function onERC721Received(
    address, 
    address, 
    uint256, 
    bytes calldata
)external returns(bytes4) {
    return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
} 

    


    function getV1TokenIds(address _addr) public view returns (uint256 [] memory) {
        return v1.walletOfOwner(_addr);
    } 

    function invalidIdClaim() external {
        if(!invalidIdClaimed){
            if(v1.ownerOf(0) == msg.sender){
           v1.transferFrom(msg.sender, deadWallet, 0);
           v2.transferFrom(address(this), msg.sender, 44);

           invalidIdClaimed = true;
           } else {
               revert("Id lookup failed.");
           }
        } else {
            revert("Invalid Id already claimed.");
        }
        
        
    }

    function claim() external {


           uint256[] memory ids = getV1TokenIds(msg.sender);
               
               for(uint8 i = 0; i < ids.length; i++){
                   //*********Caution: the V1 transfer requires an approval step
                   v1.transferFrom(msg.sender, deadWallet, ids[i]);
                   //********************************************************//
                   v2.transferFrom(address(this), msg.sender, ids[i]);
                   }
               
          
    }




    function airdrop(address _addr, uint256[] calldata _ids) external onlyOwner{
        for(uint8 i; i < _ids.length; i++){
            v2.transferFrom(address(this), _addr, _ids[i]);
        }
    }

    function multiAirdrop(address[] calldata _addr) external onlyOwner{
        for(uint8 i; i < _addr.length; i++){
            uint256[] memory ids = getV1TokenIds(_addr[i]);
            for(uint8 j; j < ids.length; j++){
                v2.transferFrom(address(this), _addr[i], ids[j]);
            }
        }
    }


    function withdrawUnclaimed(uint256[] calldata _ids) external onlyOwner {
        for(uint8 i; i < _ids.length; i++){
            v2.transferFrom(address(this), owner, _ids[i]);
        }
    }

    function setVersions(address _v1, address _v2) external onlyOwner{
        v1 = IERC721A(_v1);
        v2 = IERC721A(_v2);
    }
}