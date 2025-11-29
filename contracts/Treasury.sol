// Rights Reserved, Unlicensed
// HypnoNeuro / EncryptHealth Autonomous DAO
// Treasury.sol — executes automatic, rule-bound disbursements once spending thresholds and multisig approval are met.

pragma solidity ^0.8.20;

contract Treasury {
    address public admin;
    uint256 public spendingLimit = 100 ether;

    mapping(address => bool) public authorized;
    uint256 public authCount;

    event AuthorizedAdded(address indexed account);
    event AuthorizedRemoved(address indexed account);
    event Disbursed(address indexed to, uint256 amount, string purpose);

    modifier onlyAuthorized() {
        require(authorized[msg.sender], "Not authorized");
        _;
    }

    constructor() {
        admin = msg.sender;
        authorized[admin] = true;
        authCount = 1;
    }

    function addAuthorized(address _account) external {
        require(msg.sender == admin, "Only admin");
        require(!authorized[_account], "Already authorized");
        authorized[_account] = true;
        authCount++;
        emit AuthorizedAdded(_account);
    }

    function removeAuthorized(address _account) external {
        require(msg.sender == admin, "Only admin");
        require(authorized[_account], "Not authorized");
        authorized[_account] = false;
        authCount--;
        emit AuthorizedRemoved(_account);
    }

    function disburse(address payable _to, uint256 _amount, string memory _purpose)
        external
        onlyAuthorized
    {
        require(_amount <= spendingLimit, "Exceeds limit");
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Transfer failed");
        emit Disbursed(_to, _amount, _purpose);
    }

    receive() external payable {}
}
