// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract UserActivity {

    struct User {
        uint256 userId;
        string name;
        string role;
    }

    struct Practitioner {
        uint256 practitionerId;
        uint256 userId;
        string specialty;
        uint256 yearsExperience;
    }

    struct Session {
        uint256 sessionId;
        uint256 userId;
        uint256 practitionerId;
        uint256 timestamp;
        string notesHash;
    }

    struct Token {
        uint256 tokenId;
        uint256 userId;
        uint256 amount;
        uint256 earnedTimestamp;
    }

    struct Device {
        uint256 deviceId;
        uint256 userId;
        string deviceType;
        string serialNumber;
        uint256 lastSync;
    }

    struct SensorData {
        uint256 dataId;
        uint256 deviceId;
        string metric;
        uint256 timestamp;
        uint256 value;
    }

    struct InventoryItem {
        uint256 itemId;
        string itemName;
        string itemType;
        uint256 quantity;
    }

    mapping(uint256 => User) public users;
    mapping(uint256 => Practitioner) public practitioners;
    mapping(uint256 => Session) public sessions;
    mapping(uint256 => Token) public tokens;
    mapping(uint256 => Device) public devices;
    mapping(uint256 => SensorData) public sensorData;
    mapping(uint256 => InventoryItem) public inventory;

    uint256 public nextUserId = 1;
    uint256 public nextPractitionerId = 1;
    uint256 public nextSessionId = 1;
    uint256 public nextTokenId = 1;
    uint256 public nextDeviceId = 1;
    uint256 public nextDataId = 1;
    uint256 public nextItemId = 1;

    constructor() {
        // --- MOCK DATA ---

        // Users
        users[nextUserId++] = User(1, "Alice Smith", "participant");
        users[nextUserId++] = User(2, "Bob Jones", "participant");
        users[nextUserId++] = User(3, "Dr. Eve", "practitioner");

        // Practitioner
        practitioners[nextPractitionerId++] = Practitioner(1, 3, "Hypnosis Therapy", 20);

        // Sessions (notes hashed for privacy)
        sessions[nextSessionId++] = Session(1, 1, 1, block.timestamp, "0x8c6976e5b5410415bde908bd4dee15dfb167a3b");
        sessions[nextSessionId++] = Session(2, 2, 1, block.timestamp, "0x5f4dcc3b5aa765d61d8327deb882cf99");

        // Tokens
        tokens[nextTokenId++] = Token(1, 1, 3, block.timestamp);
        tokens[nextTokenId++] = Token(2, 1, 3, block.timestamp);
        tokens[nextTokenId++] = Token(3, 2, 3, block.timestamp);

        // Devices
        devices[nextDeviceId++] = Device(1, 1, "Smartwatch", "SW123", block.timestamp);
        devices[nextDeviceId++] = Device(2, 2, "WearablePatch", "WP456", block.timestamp);

        // Sensor Data
        sensorData[nextDataId++] = SensorData(1, 1, "HeartRate", block.timestamp, 72);
        sensorData[nextDataId++] = SensorData(2, 2, "DopamineEstimate", block.timestamp, 4);

        // Inventory
        inventory[nextItemId++] = InventoryItem(1, "Kelp Noodles", "Food", 50);
        inventory[nextItemId++] = InventoryItem(2, "Blue Corn Masa", "Food", 100);
    }

    // --- VIEW FUNCTIONS ---

    function getUser(uint256 userId) public view returns (User memory) {
        return users[userId];
    }

    function getPractitioner(uint256 practitionerId) public view returns (Practitioner memory) {
        return practitioners[practitionerId];
    }

    function getSession(uint256 sessionId) public view returns (Session memory) {
        return sessions[sessionId];
    }

    function getToken(uint256 tokenId) public view returns (Token memory) {
        return tokens[tokenId];
    }

    function getDevice(uint256 deviceId) public view returns (Device memory) {
        return devices[deviceId];
    }

    function getSensorData(uint256 dataId) public view returns (SensorData memory) {
        return sensorData[dataId];
    }

    function getInventoryItem(uint256 itemId) public view returns (InventoryItem memory) {
        return inventory[itemId];
    }
}
