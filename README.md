# Mirage: An NFT Collection with Whitelist using Hardhat and Solidity

Mirage is an innovative NFT collection named Crypto Devs that ensures early supporters have guaranteed access to minting NFTs. Using Hardhat and Solidity, Mirage incorporates a whitelist dApp allowing the first ten users to mint NFTs for free. This project is built with security in mind, ensuring that sensitive information like private keys is handled appropriately during development.

## Features

- **Whitelist System:** Early supporters can join the whitelist to get guaranteed access to mint NFTs.
- **Free Minting for Whitelisted Users:** The first ten users on the whitelist can mint NFTs for free.
- **Paid Minting for Others:** Users not on the whitelist can mint NFTs by paying a specified fee.
- **Max Token Limit:** The total supply of Crypto Devs NFTs is capped at 20.

## Prerequisites
- Hardhat
- Solidity
- Foundry
- MetaMask
- QuickNode account
- Etherscan account

## Setup

# 1. Clone the repository to your local machine

   ```bash
    git clone https://github.com/<your-username>/mirage.git
    cd mirage
   ```
# 2. Set Up Environment Variables

  Create a .env file in foundry-app:
  
   ```bash
    PRIVATE_KEY="..."
    QUICKNODE_RPC_URL="..."
    ETHERSCAN_API_KEY="..."
   ```
  PRIVATE_KEY: Exported from MetaMask.
  QUICKNODE_RPC_URL: QuickNode HTTP Provider link.  
  ETHERSCAN_API_KEY: Etherscan API key.

# 3. Deploy the Whitelist Contract

  Load environment variables:

  ```bash
    source .env
   ```
  Deploy the contract:
  ```bash
    forge create --rpc-url $QUICKNODE_RPC_URL --private-key $PRIVATE_KEY --constructor-args 10 --etherscan-api-key $ETHERSCAN_API_KEY --verify src/Whitelist.sol:Whitelist
```

# 4. Add Users to the Whitelist

Interact with the deployed contract on Etherscan:

- Go to Sepolia Etherscan.
- Search for your contract address.
- Under the "Contract" tab, go to "Write Contract".
- Connect your wallet.
- Call `addAddressToWhitelist`.

# 5. Deploy the NFT Contract

Deploy the CryptoDevs contract:

```bash
forge create --rpc-url $QUICKNODE_RPC_URL --private-key $PRIVATE_KEY --constructor-args <Whitelist Contract Address> --etherscan-api-key $ETHERSCAN_API_KEY --verify src/CryptoDevs.sol:CryptoDevs
```
Replace <Whitelist Contract Address> with your actual Whitelist contract address.

# 6. Test Whitelisted Mint

- Open the NFT contract on Sepolia Etherscan.
- Go to the "Write Contract" tab.
- Connect your wallet.
- Call mint with payableAmount as 0.

# 7. Test Non-Whitelisted Mint

- Switch to a non-whitelisted account.
- Connect your wallet on Etherscan.
- Call mint with payableAmount as 0.01.

## Conclusion

With Mirage, you now have a secure, robust NFT collection with a whitelist system ensuring early supporters get rewarded. Enjoy launching your Crypto Devs NFTs!

## License
This project is licensed under the MIT License.

## Contributing

Contributions are welcome! If you have ideas for improvements, new features, or bug fixes, please open an issue or submit a pull request.
