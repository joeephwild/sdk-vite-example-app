// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

/**
1: function to create an account, update an account and also delete
2: function to list job posting, update a job posting and also disable
3: function to apply for a specific job and send message to the job company
4: listing price should be added like 0.04 for listing a job to the dapp only
5: function to store the user video recording of the meeting
6: keep track of the jobs applied for by the user
7: ability to disable the job posting once the job is closed and only the company that posted the job can call this function
 */

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
        uint256 experience;
        uint256 salaryExpectation;
        string description;
        string profileImage;
        string githubLink;
        string linkedin;
    }

    uint256 listingPrice = 0.05 ether;

    event job(address owner, address company, string message );

    function updateListingPrice() public {}

    function createAnAccount() public {}

    function updateAnAccount() public {}

    function listAJob() public {}

    function getAllAccount() public view {}

    function getUserAccount() public view {}

    function getAllJobPosting() public {}

    function applyForJobs() public {}
}
