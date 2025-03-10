// // SPDX-License-Identifier: MIT

// // Have our invariant aka properties of our system that should always hold

// // What are our invariants?

// // 1. The total suppply of DSC should be less than the total value of collateral
// // 2. Getter view functions should never revert <- evergreen invariant

// pragma solidity 0.8.18;

// import {Test} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DeployDSC} from "script/DeployDSC.sol";
// import {DSCEngine} from "src/DSCEngine.sol";
// import {DecentralisedStableCoin} from "src/DecentralisedStableCoin.sol";
// import {HelperConfig} from "script/HelperConfig.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// contract OpenInvariantsTest is StdInvariant, Test {
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentralisedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     functino setUp() external {
//         deployer = new DeployDSC();
//         (dsc, dsce, config) = deployer.run();
//         (,, weth, wbtc,) = config.activeNetworkConfig();
//         targetContract(address(dsce));
//     }

//     function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
//         // get the value of all the collateral in the protocol
//         // compare it to all the debt
//         unit256 totalSupply = dsc.totalSupply();
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(dsce));
//         uint256 totalBtcDeposited = IERC20(wbtc).balanceOf(address(dsce));

//         uint256 wethValue = dsce.getUsdValue(weth, totalWethDeposited);
//         uint256 btcValue = dsce.getUsdValue(wbtc, totalBtcDeposited);

//         assert(wethValue + btcValue > totalSupply, "Protocol has more value than total supply");
//     }
// }
