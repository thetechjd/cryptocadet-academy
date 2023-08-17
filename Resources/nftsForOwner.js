const { Alchemy, Network } = require("alchemy-sdk");

const settings = {
  apiKey: process.env.ALCHEMY_API_KEY, // Replace with your Alchemy API Key.
  network: Network.ETH_MAINNET, // Replace with your network.
};

const alchemy = new Alchemy(settings);



const getNfts = async () => {
let list = [];
let pageKey = null;
let hasNextPage = true;

while (hasNextPage){
const response = await alchemy.nft.getNftsForOwner('0x19EDD5D0Bfe4F2f12EC1001A8530365AAA06eA9F', {contractAddresses: ['0x6339e5E072086621540D0362C4e3Cea0d643E114'], pageKey})
response.ownedNfts.forEach(x => {
    list.push(x.tokenId)
})

if (response.pageKey) {
    pageKey = response.pageKey;
} else {
    hasNextPage = false;
}
}

list.forEach((item, index) => {
    console.log(item);
  });

}


getNfts();