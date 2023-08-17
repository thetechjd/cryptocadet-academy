const axios  = require('axios')



const getABI = async () => {
const etherscan = await axios.get(`https://api.etherscan.com/api
?module=contract
&action=getabi
&address=0x956ad9336f47d9a17d422e4839a602c55b676501
&apikey=${process.env.ETHERSCAN_API_KEY}`) 

   let { result } = etherscan.data;
   

   console.log( result );
}

getABI();

