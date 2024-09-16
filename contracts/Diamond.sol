// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ArbStorage} from "./libraries/ArbStorage.sol";

contract Diamond {
    struct Facet {
        address facetAddress;
        bytes4[] selectors;
    }


    mapping(bytes4 => address) public selectorToFacet;
    address public owner;

    constructor() {
        ArbStorage.setContractOwner(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == ArbStorage.contractOwner() , "Not contract owner");
        _;
    }

   

    // Add or replace a facet (upgrade logic)
    function addFacet(address _facetAddress, bytes4[] memory _selectors) external onlyOwner {
        for (uint256 i = 0; i < _selectors.length; i++) {
            selectorToFacet[_selectors[i]] = _facetAddress;
        }
    }

    // Remove a facet by removing its function selectors
    function removeFacet(bytes4[] memory _selectors) external onlyOwner {
        for (uint256 i = 0; i < _selectors.length; i++) {
            delete selectorToFacet[_selectors[i]];
        }
    }

    // Fallback function that forwards calls to the appropriate facet
    fallback() external payable {
        address facet = selectorToFacet[msg.sig];
        require(facet != address(0), "Function does not exist");

        (bool success, ) = facet.delegatecall(msg.data);
        require(success, "Facet delegatecall failed");
    }
     receive() external payable {}
}
