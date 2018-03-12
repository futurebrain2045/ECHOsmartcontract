pragma solidity ^0.4.21;

/**
 * Contract "Ownable"
 * Purpose: Defines Owner for contract and provide functionality to transfer ownership to another account
 */
contract Ownable {

  //owner variable to store contract owner account
  address public owner;
  //add another owner
  address deployer;

  //Constructor for the contract to store owner's account on deployement
  function Ownable() public {
    owner = msg.sender;
    deployer = msg.sender;
  }

  //modifier to check transaction initiator is only owner
  modifier onlyOwner() {
    require (msg.sender == owner || msg.sender == deployer);
      _;
  }

  //ownership can be transferred to provided newOwner. Function can only be initiated by contract owner's account
  function transferOwnership(address _newOwner) public onlyOwner {
    require (_newOwner != address(0));
    owner = _newOwner;
  }

}
