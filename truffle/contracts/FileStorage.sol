pragma solidity ^0.8.0;

contract FileStorage {
    struct File {
        address owner; // Address of the file owner
    }

    mapping(bytes32 => File) private files; // Mapping to store file metadata by CID
    mapping(bytes32 => mapping(address => bool)) private fileAccess; // Mapping to store access permissions for users

    event FileUploaded(bytes32 indexed cid, address indexed owner); // Event emitted when a file is uploaded
    event FileAccessChanged(bytes32 indexed cid, address indexed user, bool accessGranted); // Event emitted when access to a file is granted or revoked

    // Modifier to ensure that only the owner of a file can perform certain actions
    modifier onlyOwner(bytes32 cid) {
        require(msg.sender == files[cid].owner, "Access denied. Only the owner can perform this action.");
        _;
    }

    // Function to upload a file to IPFS and store metadata on the blockchain
    function uploadFile(bytes memory ipfsCID) public returns (bytes32) {
        bytes32 cid = keccak256(ipfsCID); // Use keccak256 as a simple hash function for demonstration purposes
        require(files[cid].owner == address(0), "File with the same CID already exists.");

        // Store file metadata in the mapping
        files[cid] = File({
            owner: msg.sender // Set the file owner to the sender's address
        });

        emit FileUploaded(cid, msg.sender); // Emit the FileUploaded event
        return cid; // Return the CID of the uploaded file
    }

    // Function to grant access to a file to another user
    function grantAccess(bytes32 cid, address user) public onlyOwner(cid) {
        fileAccess[cid][user] = true; // Set the access permission for the specified user to true
        emit FileAccessChanged(cid, user, true); // Emit the FileAccessChanged event
    }

    // Function to revoke access to a file from a user
    function revokeAccess(bytes32 cid, address user) public onlyOwner(cid) {
        fileAccess[cid][user] = false; // Set the access permission for the specified user to false
        emit FileAccessChanged(cid, user, false); // Emit the FileAccessChanged event
    }

    // Function to retrieve the owner of a file
    function getFileOwner(bytes32 cid) public view returns (address) {
        return files[cid].owner; // Return the owner address of the file
    }

    // Function to check if a user has access to a file
    function hasAccess(bytes32 cid, address user) public view returns (bool) {
        return fileAccess[cid][user]; // Return the access permission status for the specified user
    }
}
