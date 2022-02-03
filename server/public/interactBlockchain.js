var waitForLoad = () => {
    return new Promise((resolve, reject) => {
        window.addEventListener('load', resolve)
    })
}

var mintButtonFunc = async contract => {
    
}

var main = async () => {
    await waitForLoad()

    console.log(`I'm here`)
    if(typeof web3 !== 'undefined') document.getElementById('metamaskMissing').classList.add('displayNone')
    else return

    const Provider = new Web3(web3.currentProvider)

    const myContract = new Provider.eth.Contract(window.erc721abi, '0x71CF1e20763F5A933B24166443A067e2168cE893')

    console.log(myContract)


    document.getElementById('mintButton').addEventListener('click', () => { mintButtonFunc(myContract) })


    let result
    try{
        result = await myContract.methods.tokenURI(1).call()
    }catch(err){
        
    }



    console.log(result)
}

main()






/*const Web3 = require("web3")
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
*/