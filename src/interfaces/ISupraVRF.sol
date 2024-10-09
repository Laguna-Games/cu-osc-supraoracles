// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.19;

interface ISupraRouter {
    function generateRequest(
        string memory _functionSig,
        uint8 _rngCount,
        uint256 _numConfirmations,
        uint256 _clientSeed,
        address _clientWalletAddress
    ) external returns (uint256);

    function generateRequest(
        string memory _functionSig,
        uint8 _rngCount,
        uint256 _numConfirmations,
        address _clientWalletAddress
    ) external returns (uint256);
}

interface ISupraClient {
    struct playerStats {
        uint8 level;
        uint8 health;
        uint8 strength;
    }

    struct HighGasTraitsStorage {
        uint256 tokenId;
        address supraAddr;
        mapping(uint256 => address) nonceToMinterAddress;
        mapping(uint256 => playerStats) tokenIdToStats;
        uint256 loopLimit;
    }

    struct RandomTraitsStorage {
        uint256 tokenId;
        address supraAddr;
        mapping(uint256 => address) nonceToMinterAddress;
        mapping(uint256 => playerStats) tokenIdToStats;
    }

    function mint() external;

    function finishMint(uint256 nonce, uint256[] calldata rngList) external;

    function levelUpToken(uint _tokenId) external;
}