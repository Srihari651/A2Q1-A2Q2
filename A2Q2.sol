//0x96d70A53Ed6E5Ab1097e54762f47181cf3F107F7//

pragma solidity ^0.8.1;
contract Voting
{
    mapping (bytes32 => uint256) public votesReceived; //maps the address to the integer
    bytes32[] public candidateList; //creates the array of address of the candidate list

  constructor(bytes32[] memory candidateNames) public //takes the address of the candidate before deploying the contract
  {
      candidateList = candidateNames; //stores the candidate to the array
  }

  function getVotesForCandidate(bytes32 candidate) view public returns (uint256) //used to give the vote to the candidate 
  {
      require(validCandidate(candidate));
      return votesReceived[candidate];
  }

  function voteForCandidate(bytes32 candidate) public //increments the vote given by the voter
  {
      require(validCandidate(candidate));
      votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) view public returns (bool) { //checks wheather the condidate is valid or not
    for(uint i = 0; i < candidateList.length; i++)
    {
      if (candidateList[i] == candidate) //returs true is the candidate is present in the list
      {
          return true;
      }
    }
    return false; // returns false and exits the loop
  }
}
