//I want to create an NFT smart contract

// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

//Useful libraries that I would be working with -->
import "node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "node_modules/@openzeppelin/contracts/utils/Counters.sol";

//Declaring the various neccessary variables
contract DoJutsu is ERC721, ERC721Enumerable, ERC721URIStorage{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 MAX_SUPPLY = 10000;

    constructor() ERC721("DoJutsu", "DOJ") {}

    function safeMint(address to, string memory uri) public {
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId <= MAX_SUPPLY, "I'm sorry but all NFT's have been minted");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}