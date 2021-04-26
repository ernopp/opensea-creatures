pragma solidity ^0.5.0;

import "./ERC721Tradable.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title Creature
 * Creature - a contract for my non-fungible creatures.
 */
contract Creature is ERC721Tradable {
    constructor(address _proxyRegistryAddress)
        public
        ERC721Tradable("Creature", "OSC", _proxyRegistryAddress)
    {}

    function baseTokenURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/api/creature/";
    }

    function contractURI() public pure returns (string memory) {
        return "https://creatures-api.opensea.io/contract/opensea-creatures";
    }

    /**
   * @dev Returns an URI for a given token ID
   */
    function tokenURI(uint256 _tokenId) public view returns (string memory) {
    // return Strings.strConcat(
    //     baseTokenURI(),
    //     Strings.uint2str(_tokenId)
    // );
    return "https://raw.githubusercontent.com/ernopp/opensea-creatures/master/test-metadata.json";
    }
}
