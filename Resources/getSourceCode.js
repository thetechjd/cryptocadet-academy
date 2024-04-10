const axios  = require('axios')



const getSourceCode = async () => {
const etherscan = await axios.get(`https://api.polygonscan.com/api
?module=contract
&action=getsourcecode
&address=0xB7b31a6BC18e48888545CE79e83E06003bE70930
&apikey=DFWUINR24ZWV6Q64X3KH1TZYBXINBT8HB9`) 

   let { result } = etherscan.data;
   

  console.log( result[0].SourceCode );

  //return result;
}
getSourceCode();

module.exports = {getSourceCode}

