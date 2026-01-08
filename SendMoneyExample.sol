//SPDX-License-Identifier: MIT 

pragma solidity 0.8.30;

contract SendWithdrawMoney {

    uint public balanceReceived;


    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    // function getBalanceReceived() public view returns(uint) {
    //     return balanceReceived;
    // }

    function withdrawAll() public payable {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    // function withdrawAllToAddress(address payable to) public {
    //     to.transfer(getContractBalance());
    // }

    function withdrawToAddress(address payable to, uint256 amount) public payable {
        // uint amountInEther = amount * 10**18;
        require(amount > 0, "Amount must be greater than 0");
        require(address(this).balance >= amount, "Insufficient contract balance");
        
        to.transfer(amount);
    }

}