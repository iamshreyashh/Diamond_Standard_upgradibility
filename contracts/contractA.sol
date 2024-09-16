// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ArbStorage} from "./libraries/ArbStorage.sol";

contract contractA {
    function valGetter() external view  returns (uint256 val) {
        val = ArbStorage.valGetter();
        return val;
    }

    function valSetter(uint256 val) external   {
        uint256 new_val = val + ArbStorage.valGetter();
        ArbStorage.valSetter(new_val);
   }
}

