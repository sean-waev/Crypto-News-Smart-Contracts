// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IDStorage {
    struct Data {
        string id;
        int number;
    }

    mapping(string => Data) private dataStore;

    function setId(string memory _id, int points) public {
        // Only create a new entry if it does not exist
        if (bytes(dataStore[_id].id).length == 0) {
            dataStore[_id] = Data(_id, points);
        }
    }

    function getIdAndNumber(
        string memory _id
    ) public view returns (string memory, int) {
        require(bytes(dataStore[_id].id).length > 0, 'ID not found');
        return (dataStore[_id].id, dataStore[_id].number);
    }

    function increment(
        string memory _id
    ) public returns (address, string memory, int, uint) {
        require(bytes(dataStore[_id].id).length > 0, 'ID not found');
        dataStore[_id].number += 1;
        return (msg.sender, dataStore[_id].id, dataStore[_id].number, 1);
    }

    function decrement(
        string memory _id
    ) public returns (address, string memory, int, uint) {
        require(bytes(dataStore[_id].id).length > 0, 'ID not found');
        dataStore[_id].number -= 1;
        return (msg.sender, dataStore[_id].id, dataStore[_id].number, 0);
    }
}

