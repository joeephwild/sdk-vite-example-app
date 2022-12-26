// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract EthJobs {
    struct Jobs {
        string CompanyName;
        uint256 id; //id is a number so it supposed to be uint type
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

    struct employer {
        string CompanyName;
        string Category;
        address owner;
        string description;
        string location;
        string jobType;
    }

    struct Candidate {
        string name;
        address ownerUser;
        string skills;
        uint256 experience;
        uint256 salaryExpectation;
        string description;
        string profileImage;
        string githubLink;
    }

    uint256 public jobCounter; //stores the number of jobs in the dapp
    uint256 public employerCounter;
    uint256 accountCounter;
    mapping(address => Candidate) public profile;
    mapping(address => employer) public companyProfile;
    mapping(uint256 => Jobs) public company;
    //array of type candidate struct to store every candidate in the dapp like [{name, skills etc},{name, skills etc},{name, skills etc}] and so on
    Candidate[] listCandidates;
    //array of type employer struct to store every candidate in the dapp like [{name, skills etc},{name, skills etc},{name, skills etc}] and so on
    employer[] listEmployers;
    //array of type Jobs struct to store every candidate in the dapp like [{name, skills etc},{name, skills etc},{name, skills etc}] and so on
    Jobs[] listJobs;
    uint256 listingPrice = 0.05 ether;

    modifier onlyOwner() {
        require(
            msg.sender == companyProfile[msg.sender].owner,
            "Only owner is allowed to change details"
        );

        _;
    }

    event job(address owner, address company, string message);

    function updateListingPrice() public {}

    // create the user account details
    function createAnAccount(
        string memory _name,
        address _owner,
        string memory _skills,
        uint256 _experience,
        uint256 _salaryExpectation,
        string memory _description,
        string memory _profileImage,
        string memory _githubLink
    ) public returns(uint256) {
        Candidate storage accounts = profile[_owner];
        accounts.name = _name;
        accounts.ownerUser = msg.sender;
        accounts.skills = _skills;
        accounts.experience = _experience;
        accounts.salaryExpectation = _salaryExpectation;
        accounts.description = _description;
        accounts.profileImage = _profileImage;
        accounts.githubLink = _githubLink;
        accountCounter++;
        listCandidates.push(accounts);
        return accountCounter;
    }

    //update or edit the user details
    // if there is nothing to input in _dataInteger then enter 0
    function updateAnAccount(
        uint256 option,
        string memory _data,
        uint256 _dataInteger
    ) public returns (Candidate memory) {
        require(
            msg.sender == profile[msg.sender].ownerUser,
            "Only owner is allowed to change details"
        );
        if (option == 0) {
            profile[msg.sender].name = _data;
        } else if (option == 2) {
            profile[msg.sender].skills = _data;
        } else if (option == 3) {
            profile[msg.sender].experience = _dataInteger;
        } else if (option == 4) {
            profile[msg.sender].salaryExpectation = _dataInteger;
        } else if (option == 5) {
            profile[msg.sender].description = _data;
        } else if (option == 6) {
            profile[msg.sender].profileImage = _data;
        } else {
            profile[msg.sender].githubLink = _data;
        }

        return profile[msg.sender];
    }

    function createEmployerAccount(
        string memory _CompanyName,
        string memory _Category,
        address _owner,
        string memory _description,
        string memory _location
    ) public {
        //create a new variable to store every data
        employer storage Profile = companyProfile[_owner];
        Profile.CompanyName = _CompanyName;
        Profile.owner = msg.sender;
        Profile.Category = _Category;
        Profile.description = _description;
        Profile.location = _location;
        employerCounter++;
        listEmployers.push(Profile);
    }

    //update or edit the user details
    // if there is nothing to input in _dataInteger then enter 0
    function updateEmployerAccount(
        uint256 option,
        string memory _data,
        uint256 _dataInteger
    ) public onlyOwner returns (employer memory) {
        require(
            msg.sender == companyProfile[msg.sender].owner,
            "Only owner is allowed to change details"
        );
        if (option == 0) {
            companyProfile[msg.sender].CompanyName = _data;
        } else if (option == 2) {
            companyProfile[msg.sender].Category = _data;
        } else if (option == 3) {
            companyProfile[msg.sender].description = _data;
        } else if (option == 4) {
            companyProfile[msg.sender].location = _data;
        } else {
            companyProfile[msg.sender].jobType = _data;
        }

        return companyProfile[msg.sender];
    }

    // create a new job in dapp
    function listAJob(
        uint256 _id,
        string memory _CompanyName,
        string memory _Category,
        uint256 _salary,
        string memory _description,
        string memory _skills,
        string memory _location,
        string memory _jobType
    ) public returns (uint256) {
        require(
            msg.sender == companyProfile[msg.sender].owner,
            "Only owner is allowed to change details"
        );
         //create a new variable to store every data
        Jobs storage post = company[_id];
        post.CompanyName = _CompanyName;
        post.Category = _Category;
        post.salary = _salary;
        post.timeStamp = block.timestamp;
        post.description = _description;
        post.skills = _skills;
        post.location = _location;
        post.jobType = _jobType;
        post.isJobVacant = false;
        //pushing the newly created job variable to the array 
        listJobs.push(post);
        jobCounter++;
        return jobCounter;
    }

    // to list all the jobs present in the dapp
    function getAllJob() public view returns (Jobs[] memory) {
        return listJobs;
    }

    function getAllEmployers() public view returns(employer[] memory) {
        return listEmployers;
    } // get the user details or candidate details
   
   
    function getAllAccount() public view returns (Candidate[] memory) {
        return listCandidates;
    } // all user profiles

    function getAllJobPosting() public {} // list of jobs as per users choice

    function applyForJobs() public {} // apply to any job.
}
