// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;



contract Whitelist {

    uint8 public maxWhitelistedAddresses;
    
    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // This function adds the address of the sender to the whitelist

    function addAddresstoWhitelist() public {
        // check if the user is already in the whitelist
        require(!whitelistedAddresses[msg.sender], "Sender is already in the whitelist");
        // check wheather or not we have reached the max white listed address limit
        require(numAddressesWhitelisted < maxWhitelistedAddresses,"More addresses can not be added, limit reached!");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;

    }

}

