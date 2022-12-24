// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract EthJobs {

   struct Jobs {
    string CompanyName;
    string Category;
    uint256 salary;
    uint256 timeStamp;
    address owner;
    string description;
    string skills;
    string location;
    string jobType;
    bool isJobVacant;
   }

   struct Candidate {
    string name;
    string skills;
    uint experience;
    uint256 salaryExpectation;
    string description;
    string profileImage;
    string githubLink;
   }
}
