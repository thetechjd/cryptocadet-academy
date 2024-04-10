const axios  = require('axios')



const getABI = async () => {
const etherscan = await axios.get(`https://api.etherscan.io/api
?module=contract
&action=getabi
&address=0x956ad9336F47D9a17d422E4839a602c55B676501
&apikey=${process.env.ETHERSCAN_API_KEY}`) 

   let { result } = etherscan.data;
   

  // console.log( result );

  return result;
}

module.exports = {getABI}

