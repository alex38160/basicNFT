const Web3 = require("web3")
const abi = require("./contractABI.json")
const contract = new web3.eth.Contract([abi], address)

function startApp(provider){
    let myContract = ""
    let web3 = new Web3(provider) 
    const contract = new web3.eth.Contract([abi], address)
}
window.addEventListener('load', function() {

    const provider = window.ethereum;

    if (provider) {
        // From now on, this should always be true:
        // provider === window.ethereum
        startApp(provider); // initialize your app
    } else {
        console.log('Please install MetaMask!')
    }
})

function hello(){
    console.log("hi")
}

contract.methods.getBalance().call(function (err, res) {
    if (err) {
      console.log("An error occured", err)
      return
    }
    console.log("The balance is: ", res)
  })