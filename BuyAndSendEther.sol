// SPDX-License-Identifier: MIT
pragma solidity >=0.5.1;

contract SecondContract {
    mapping(address => uint256) public balances;
    address payable wallet;

    event Purchase(address indexed _buyer, uint256 _amount);

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    fallback() external payable {
        buyToken();
    }

    function buyToken() public payable {
        //buy buyToken
        balances[msg.sender] += 1;
        //send ether to wallet
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
