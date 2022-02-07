pragma solidity ^0.8.0;

//Import ERC1155 token contract from Openzepplin

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTContract is ERC1155, Ownable {
    uint256 public constant ARTWORK = 0; // id: 0
    uint256 public constant PHOTO = 1;

    // mint initial versions of ARTWORK and PHOTO
    constructor() ERC1155("") {
        _mint(msg.sender, ARTWORK, 1, "");
        _mint(msg.sender, PHOTO, 2, "");
    }

    // Mint function is only be accessible by the address that deployed the contract initially.
    function mint(
        address account,
        uint256 id,
        uint256 amount
    ) public onlyOwner {
        _mint(account, id, amount, "");
    }

    function burn(
        address account,
        uint256 id,
        uint256 amount
    ) public {
        // can only burn your own token
        require(msg.sender == account);
        _burn(account, id, amount);
    }
}
