// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IUtilsLens {
    struct AssetPriceInfo {
        bool queryFailure;
        bytes queryFailureReason;
        uint256 timestamp;
        address oracle;
        address asset;
        address unitOfAccount;
        uint256 amountIn;
        uint256 amountOutMid;
        uint256 amountOutBid;
        uint256 amountOutAsk;
    }

    function TTL_ERROR() external view returns (int256);
    function TTL_INFINITY() external view returns (int256);
    function TTL_LIQUIDATION() external view returns (int256);
    function TTL_MORE_THAN_ONE_YEAR() external view returns (int256);
    function calculateTimeToLiquidation(
        address liabilityVault,
        uint256 liabilityValue,
        address[] memory collaterals,
        uint256[] memory collateralValues
    ) external view returns (int256);
    function computeAPYs(uint256 borrowSPY, uint256 supplySPY)
        external
        pure
        returns (uint256 borrowAPY, uint256 supplyAPY);
    function computeSupplySPY(uint256 borrowSPY, uint256 cash, uint256 borrows, uint256 interestFee)
        external
        pure
        returns (uint256);
    function getAssetPriceInfo(address asset, address unitOfAccount) external view returns (AssetPriceInfo memory);
    function getControllerAssetPriceInfo(address controller, address asset)
        external
        view
        returns (AssetPriceInfo memory);
    function oracleLens() external view returns (address);
}
