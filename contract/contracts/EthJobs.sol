// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract EthJobs {

   struct Jobs {
    string CompanyName;
    string id;
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

   struct  Candidate {
    string name;
    address ownerUser;
    string skills;
    uint experience;
    uint256 salaryExpectation;
    string description;
    string profileImage;
    string githubLink;
   }

mapping (address => Candidate) profile;
mapping (address => employer) companyProfile;
mapping (string => Jobs) company;
address[] listCandidates;
address[] listEmployers;
string [] listJobs;


   uint256 listingPrice = 0.05 ether;
      uint256 no = 1;

    modifier onlyOwner{
                 require(msg.sender ==  companyProfile[msg.sender].owner, "Only owner is allowed to change details");

      _;
    }

    

    event job(address owner, address company, string message );

    function updateListingPrice() public {}

// create the user account details
    function createAnAccount(string memory _name, string  memory _skills, uint _experience, uint256 _salaryExpectation, string memory _description, string memory _profileImage, string memory _githubLink ) public returns(bool) {
      
      profile[msg.sender].name = _name;
      profile[msg.sender].ownerUser =msg.sender;
      profile[msg.sender].skills = _skills;
      profile[msg.sender].experience = _experience;
      profile[msg.sender].salaryExpectation = _salaryExpectation;
      profile[msg.sender].description = _description;
      profile[msg.sender].profileImage = _profileImage;
      profile[msg.sender].githubLink = _githubLink;
     listCandidates.push(msg.sender);
     return true;
      
    } 
//update or edit the user details
// if there is nothing to input in _dataInteger then enter 0
    function updateAnAccount(uint256 option, string memory _data, uint256 _dataInteger) public  returns (Candidate memory) {
           require(msg.sender == profile[msg.sender].ownerUser, "Only owner is allowed to change details");
           if(option == 0){
               profile[msg.sender].name = _data;
           }
           else  if(option == 2){
               profile[msg.sender].skills = _data;
           }
           else  if(option == 3){
               profile[msg.sender].experience = _dataInteger;
           }
           else  if(option == 4){
               profile[msg.sender].salaryExpectation = _dataInteger;
           }
           else  if(option == 5){
               profile[msg.sender].description = _data;
           }
           else  if(option == 6){
               profile[msg.sender].profileImage = _data;
           }
           else
           {
               profile[msg.sender].githubLink = _data;
           }




      return profile[msg.sender];
    } 


 function createEmployerAccount( string memory _CompanyName, string memory _Category, string memory _description,  string memory _location, string memory _jobType) public returns(bool) {
      
      companyProfile[msg.sender].CompanyName = _CompanyName;
       companyProfile[msg.sender].owner =msg.sender;
       companyProfile[msg.sender].Category = _Category;
        companyProfile[msg.sender].description = _description;
        companyProfile[msg.sender].location = _location;
        companyProfile[msg.sender].jobType = _jobType;
          listEmployers.push(msg.sender);

     return true;
      
    } 
//update or edit the user details
// if there is nothing to input in _dataInteger then enter 0
    function updateEmployerAccount(uint256 option, string memory _data, uint256 _dataInteger) public onlyOwner  returns (employer memory) {
           require(msg.sender ==  companyProfile[msg.sender].owner, "Only owner is allowed to change details");
           if(option == 0){
                 companyProfile[msg.sender].CompanyName = _data;
           }
           else  if(option == 2){
                companyProfile[msg.sender].Category = _data;
           }
           else  if(option == 3){
                companyProfile[msg.sender].description = _data;
           }
           else if(option == 4)
           {
                companyProfile[msg.sender].location = _data;
           }
            else 
           {
                companyProfile[msg.sender].jobType = _data;
           }
          
      return companyProfile[msg.sender];
    } 


// create a new job in dapp
    function listAJob( string memory _CompanyName, string memory _Category, uint256 _salary, uint256 _timeStamp, string memory _description, string memory _skills, string memory _location, string memory _jobType, bool _isJobVacant) public  returns(Jobs memory) {
       require(msg.sender ==  companyProfile[msg.sender].owner, "Only owner is allowed to change details");

      string memory jobId = string(abi.encodePacked(_CompanyName ,'_',no));
      no++;
      company[jobId].CompanyName = _CompanyName;
      company[jobId].id = jobId; 
       company[jobId].owner =msg.sender;
       company[jobId].Category = _Category;
       company[jobId].salary = _salary;
        company[jobId].timeStamp = _timeStamp;
        company[jobId].location = _location;
        company[jobId].jobType = _jobType;
        company[jobId].isJobVacant = _isJobVacant;
          listJobs.push(jobId);

     return company[jobId];
      
    } 
// to list all the jobs present in the dapp
    function getAllJob() public view returns(string[] memory) {
        return listJobs; 
    } 

    function getUserAccountDetails() public view {} // get the user details or candidate details

    function getAllAccount() public view returns(Candidate[] memory) {} // all user profiles

    function getAllJobPosting() public {} // list of jobs as per users choice

    function applyForJobs() public {} // apply to any job.
}
