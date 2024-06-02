contract MyToken {
    address public owner;
    modifier isOwner() {
        require(msg.sender == owner, "Caller isn't the owner");
        _;
    }
    constructor() {
        owner = msg.sender;
    }
    
    // public variables here
    string tokenName = "INDIA";
    string tokenAbbr = "IND";
    uint totalSupply = 0;

    // mapping variable here
    mapping (address => uint) public balances;

    // mint function
    function mint (address _add, uint _val) public isOwner returns (uint, string memory) {
        totalSupply += _val;
        balances[_add] += _val;
        return (balances[_add], tokenAbbr);
    }
    // burn function
    function burn (address _add, uint _val) public isOwner returns (uint, string memory) {
        require(balances[_add] >= _val, "Not enough tokens for address");
        totalSupply -= _val;
        balances[_add] -= _val;
        return (balances[_add], tokenAbbr);
    }
}
