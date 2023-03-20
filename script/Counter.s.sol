// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Counter.sol";

contract CounterScript is Script {
       
    function run() external {
        string memory mnemonic = vm.envString("MNEMONIC");
        (address deployer, ) = deriveRememberKey(mnemonic, 0);
               
        vm.startBroadcast(deployer);
        Counter c = new Counter();
        console2.log("Counter deployed on %s", address(c));
        vm.stopBroadcast();
    }
}