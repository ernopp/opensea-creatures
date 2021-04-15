# Part 1

https://docs.opensea.io/docs/1-structuring-your-smart-contract

## Get Eth Funds on Rinkeby

- Request Eth funds on Rinkeby using https://faucet.rinkeby.io/
- My dummy wallet 0xEA357056BC0236928e8B79Ae3B81C3A0952eC8A9

## Installs

- `npm install -g yarn`
- `npm install -g truffle`

## Yarn install versioning error 

```
error opensea-creatures@1.0.0: The engine "node" is incompatible with this module. Expected version "12.18.x". Got "10.14.1"
error opensea-creatures@1.0.0: The engine "yarn" is incompatible with this module. Expected version "1.22.4". Got "1.22.10"
```

Lazyily I just did 
`yarn install --ignore-engines`

Saw later that the README says to use `nvm use`

## Save env vars

`. .env`

## ALchemy API key

In UI they give you the whole URL, but it's just the last part e.g `RluH92LxAw89S5-liNBSU9Iz9zIfkbV-` 

See truffle.js

```
const rinkebyNodeUrl = isInfura
  ? "https://rinkeby.infura.io/v3/" + NODE_API_KEY
  : "https://eth-rinkeby.alchemyapi.io/v2/" + NODE_API_KEY;
```

## Deploy command

The Readme said: 
`DEPLOY_CREATURES_SALE=1 yarn truffle deploy --network rinkeby`
while the website said 
`truffle deploy --network rinkeby` went with the latter

## Rename truffle.js

` Warning: Please rename truffle.js to truffle-config.js to ensure Windows compatibility.`

## First deploy 

```
Error: There was a timeout while attempting to connect to the network.
       Check to see that your provider is valid.
       If you have a slow internet connection, try configuring a longer timeout in your Truffle config. Use the networks[networkName].networkCheckTimeout property to do this.
    at Timeout.setTimeout (C:\Users\ernes\AppData\Roaming\npm\node_modules\truffle\build\webpack:\packages\provider\index.js:56:1)
    at ontimeout (timers.js:436:11)
    at tryOnTimeout (timers.js:300:5)
    at listOnTimeout (timers.js:263:5)
    at Timer.processTimers (timers.js:223:10)
```

Turns out this was issue with API key see above 

## Actual deploy

Deployed to https://rinkeby.etherscan.io/address/0x0bc61BC2D7444b5EAD9402572F3030F0bF1d508F
Cost 0.06 fake eth

## Minting

Worked fine, could see transactions 
https://rinkeby.etherscan.io/tx/0x6d4c77fcb1fa4e0ec79f00e7261e41fdae3f1f0f41e5ce0f62c744cc1765c004

and items in OpenSea account on https://testnets.opensea.io/

# Part 2

https://docs.opensea.io/docs/2-adding-metadata

> Each token identifier in your ERC721 contract will have corresponding metadata URI that returns additional important information about the item, such as the item's name, image, description, etc. To find this URI, we use the tokenURI method in ERC721 and the uri method in ERC1155

Default contract URIs
```js
    function baseTokenURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/api/creature/";
    }

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-creatures";
    }
```

e.g https://creatures-api.opensea.io/api/creature/3

## TokenURI

