const axios  = require('axios')



const getTransactions = async () => {
const etherscan = await axios.get(`https://api.etherscan.io/api
?module=account
&action=txlist
&address=0x046EeE2cc3188071C02BfC1745A6b17c656e3f3d
&startblock=0
&endblock=99999999
&page=1
&offset=10
&sort=asc&apikey=8XX3TRP1WSAQDAJD24KCGE56NJJADYD2P3`) 

   let { result } = etherscan.data;

   console.log( result);
}

getTransactions();

