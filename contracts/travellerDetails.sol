// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract travellerDetails {
    //enum for gender
    enum Sex {male, female, other}

    // struct for saving the data of traveller
    struct travellerData {
        uint256 uid;
        string name;
        uint256 age;
        Sex gender;
        string location;
    }

    //mapping to retrieve traveller data stored in the blockchian
    mapping(uint256 => mapping(uint256 => travellerData)) private pData;
    // Iterable variable declaration for traveller data count
    mapping(uint256 => uint256) travellerCount;

    //function to set traveller data
    function settraveller(
        uint256 _uid,
        string memory _name,
        uint256 _age,
        Sex _gender,
        string memory _location
    ) public {
        travellerCount[_uid] += 1;
        pData[_uid][travellerCount[_uid]] = travellerData(
            _uid,
            _name,
            _age,
            _gender,
            _location
        );
    }

    // function to retrieve data of traveller from blockchain
    function gettraveller(uint256 _uid, uint256 _travellerCount)
        public
        view
        returns (
            uint256,
            string memory,
            uint256,
            Sex,
            string memory
        )
    {
        return (
            pData[_uid][_travellerCount].uid,
            pData[_uid][_travellerCount].name,
            pData[_uid][_travellerCount].age,
            pData[_uid][_travellerCount].gender,
            pData[_uid][_travellerCount].location
        );
    }

    //mapping to retrieve travelled location data stored in the blockchian
    mapping(uint256 => mapping(uint256 => string)) private locationData;
    // Iterable variable declaration for location data count
    mapping(uint256 => uint256) locationCount;

    //function to set location data
    function setlocationData(uint256 _uid, string memory _locationData) public {
        locationCount[_uid] += 1;
        locationData[_uid][locationCount[_uid]] = _locationData;
    }

    // function to retrieve data of location from blockchain
    function getData(uint256 _uid, uint256 _locationCount)
        public
        view
        returns (string memory)
    {
        return locationData[_uid][_locationCount];
    }
}
