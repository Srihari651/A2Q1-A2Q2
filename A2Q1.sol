pragma solidity ^0.8.1;
contract splitEther
{
    function split(address payable user1, address payable user2) external payable //takes 2 users as an input
    {
        require(msg.value%2==0 && msg.value !=0,"enter the value"); //checks that the value given is even
        uint256 splitValue=msg.value/2; //divides the value into 2 halves
        user1.transfer(splitValue); //sends the one half of the value to the user1
        user2.transfer(splitValue); //sends the other half of the value to the user2
    }
}