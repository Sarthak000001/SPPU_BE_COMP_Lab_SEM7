pragma solidity ^0.8.0;

contract Bank{
    mapping (address=>uint) public user_account;
    mapping (address=>bool) public user_exists;

    function create_account() public payable returns(string memory){
        require(user_exists[msg.sender]==false,"Account already created");
        if(msg.value == 0){
            user_exists[msg.sender] = true;
            user_account[msg.sender] = 0;
            return "Account created Successfully";
        }
        user_exists[msg.sender] = true;
        user_account[msg.sender] = msg.value;
        return "Account created Successfully";
    }

    function deposit() public payable returns (string memory){
        require(user_exists[msg.sender] == true,"Account not created");
        require(msg.value > 0,"value for deposit is invalid");

        user_account[msg.sender] = user_account[msg.sender] + msg.value;
        return "Deposited Successfully";
    }

    function withdraw(uint amount) public payable returns (string memory){
        require(user_account[msg.sender] > amount,"Insufficient Balance");
        require(user_exists[msg.sender] == true,"Account not created");
        require(amount > 0,"Amount should be greater than zero");

        user_account[msg.sender] = user_account[msg.sender] - amount;
        payable(msg.sender).transfer(amount);
        return "Withdraw Successfully";
    }

    function user_balance() public view returns(uint){
        require(user_exists[msg.sender] == true,"Account not created");
        return user_account[msg.sender];
    }

    function account_exists() public view returns(bool){
        return user_exists[msg.sender];
    }
}


