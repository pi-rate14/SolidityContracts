// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MyContract {
    //Person[] public people; //people array of data type person

    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    uint256 openingTime = 1621196600;

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    struct Person {
        uint256 _id;
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname)
        public
        onlyWhileOpen
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstname, _lastname);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
