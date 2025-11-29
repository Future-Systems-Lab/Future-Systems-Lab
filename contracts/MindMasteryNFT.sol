// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/**
 * @title MindMasteryNFT
 * @dev ERC-721A-style NFT contract for HypnoNeuro interactive tiers (Foundation, Elevation, Ascension, HealerGenesis, SurvivorMedal).
 * NOTE: We rely on OpenZeppelin 4.9.x contracts pulled directly from GitHub to avoid local NPM-package issues in Remix.
 */

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.9.3/contracts/access/Ownable.sol";

contract MindMasteryNFT is ERC721URIStorage, Ownable {
    // ------------------------------------------------------------------
    // Types & storage
    // ------------------------------------------------------------------
    enum NFTType { Foundation, Elevation, Ascension, HealerGenesis, SurvivorMedal }

    struct NFTMetadata {
        NFTType nftType;      // Tier / category
        uint256 discount;     // Discount percentage (3,6,9)
        bool    isEvolved;    // Has the NFT evolved visually/utility-wise?
    }

    uint256 public nextTokenId;
    mapping(uint256 => NFTMetadata) private _tokenMeta;

    // ------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------
    constructor() ERC721("MindMasteryNFT", "MMNFT") {}

    // ------------------------------------------------------------------
    // Minting (onlyOwner for now - can be delegated to game backend later)
    // ------------------------------------------------------------------
    function mint(
        address to,
        NFTType nftType,
        string memory tokenUri,
        uint256 discount
    ) external onlyOwner {
        uint256 tokenId = nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenUri);
        _tokenMeta[tokenId] = NFTMetadata(nftType, discount, false);
    }

    // ------------------------------------------------------------------
    // Evolution (updates URI + discount once)
    // ------------------------------------------------------------------
    function evolve(
        uint256 tokenId,
        string memory newUri,
        uint256 newDiscount
    ) external onlyOwner {
        require(_exists(tokenId), "Token does not exist");
        NFTMetadata storage meta = _tokenMeta[tokenId];
        require(!meta.isEvolved, "Already evolved");
        meta.discount  = newDiscount;
        meta.isEvolved = true;
        _setTokenURI(tokenId, newUri);
    }

    // ------------------------------------------------------------------
    // Public getters
    // ------------------------------------------------------------------
    function getMetadata(uint256 tokenId) external view returns (NFTMetadata memory) {
        require(_exists(tokenId), "Token does not exist");
        return _tokenMeta[tokenId];
    }
}
