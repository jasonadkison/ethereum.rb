pragma solidity ^0.4.8;

contract ContractParent1 {

}

contract ContractParent2 {

}

contract ContractWithInheritance is ContractParent1, ContractParent2 {

}
