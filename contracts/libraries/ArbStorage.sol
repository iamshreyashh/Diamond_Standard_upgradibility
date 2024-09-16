// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library ArbStorage {
    bytes32 constant ArbStorage_POSITION = keccak256("diamond.standard.arb.storage");

    struct arbStorage {
        uint256 value;
        address contract_admin;
        address super_admin;
    }

    

    function valGetter() internal view returns (uint256) {
        return diamondStorage().value;
    }

    function valSetter(uint256 val) internal {
        diamondStorage().value = diamondStorage().value + val;
   }

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


    function setContractOwner(address _newOwner) internal {
        arbStorage storage ds = diamondStorage();
        address previousOwner = ds.contract_admin;
        ds.contract_admin = _newOwner;
        emit OwnershipTransferred(previousOwner, _newOwner);
    }
 

    function contractOwner() internal view returns (address contractAdmin_) {
        contractAdmin_ = diamondStorage().contract_admin;
    }

    function enforceIsContractOwner() internal view {
        require(msg.sender == diamondStorage().contract_admin, "LibDiamond: Must be contract owner");
    }


   function diamondStorage() internal pure returns (arbStorage storage ds) {
    bytes32 position = ArbStorage_POSITION;
    assembly {
        ds.slot := position
    }
   }
}