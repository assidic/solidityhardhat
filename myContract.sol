// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Crowdfunding {
    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 deadine;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;

    }
    
    mapping(uint256 => Campaign) public campaigns;

    uint256 public numberOfCampaigns = 0;

    function createCampaign(address _owner, string memory _title, string memory _description, uint256 _target, uint256 _deadLine, string memory _image) public returns (uint256) { 
        
        
        
        Campaign storage campaign = campaigns[numberOfCampaigns];

        require(campaign.deadline < block.timestamp, "The deadline should be a date inthe future.");

        campaign.owner = owner;
        campaign.title = title;
        campaign.description = description;
        campaign.target = target;
        campaign.deadline = deadline;
        campaign.anountCollected = 0;
        campaign.image = _image;

        numberOfCampaigns++;

        return numberOfCampaigns - 1;

    }

    
    function donateToCampaign(uint256 _id) public payable {

        uint256 amount = msg.value;

        Campaign storage campaign = campaign[_id];

        campaign.donators.push(msg.sender);
        campaign.donations.push(amount);

        (bool sent,) = payable(campaign.owner).call{value: amount}("");

        if(sent) {
            campaign.amountCollected = campaign.amount.Collected = amount;
        }
        }





    }

    function getDonators(uint256_id) view public returns (address[] memory, uint256[] memory) {
        return (campaigns[_id].donations, campaign)


    }

    function getCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

        for(uint i = 0;i < numberOfCapaigns; i++) {
            Campaign storage item = campaigns[i];

            allCampaigns[i] = item;


        }
        return allCampaigns;
    }


    
    
    
    
    }


    #21 minutes into WEB3 ytvid
