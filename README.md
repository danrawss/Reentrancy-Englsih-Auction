# English Auction Smart Contract

## Overview
This repository contains Solidity smart contracts implementing an English auction for NFTs, a demonstration of reentrancy vulnerability, and a mock NFT (ERC721) contract. The auction is deployed and managed on the Ethereum blockchain. The goal of this project is to showcase how reentrancy attacks work and demonstrate a vulnerable NFT auction scenario.

The whole idea of the project was to change the order of transactions in the **end()** method of the auction to highlight the vulnerability, showcasing how improper handling of transaction order can lead to security issues.

### Smart Contracts Included
- **EnglishAuction.sol**: Implements a simple English auction for an NFT where participants can place bids and the highest bidder wins the auction.
- **MaliciousSeller.sol**: A contract representing a malicious actor that attempts to exploit vulnerabilities in the auction contract.
- **ERC721.sol** and **MyNFT.sol**: Custom implementations of the ERC721 standard, used to mint and manage NFTs.

## Contract Details
### EnglishAuction.sol
This contract allows the auctioning of an NFT to the highest bidder. Key functions include:
- **start()**: Starts the auction by transferring the NFT from the seller to the auction contract.
- **end()**: Ends the auction, transfers the NFT to the highest bidder, and sends the Ether to the seller.
- **bid()**: Allows participants to place a bid higher than the current highest bid.
- **withdraw()**: Lets users withdraw their funds if they are not the highest bidder.

### MaliciousSeller.sol
A contract that mimics a malicious seller attempting to exploit reentrancy vulnerabilities by calling functions in a sequence to manipulate the auction process. This demonstrates how improper handling of reentrancy can lead to vulnerabilities.

### ERC721.sol & MyNFT.sol
These contracts implement the ERC721 interface, allowing the minting and burning of NFTs. **MyNFT.sol** is a mock implementation for testing the auction contract.

## Features
- English auction system with a time limit.
- A malicious contract to demonstrate a potential reentrancy attack.
- Custom implementation of the ERC721 standard to mint and manage NFTs.

