// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Tickets {
    address public owner = msg.sender;

    struct Ticket {
        uint256 price;
        address owner;
    }

    Ticket[10] public tickets;

    constructor() public {
        for(uint256 i=0;i<10;i++) {
            tickets[i].price = 1e17;            // 0.1 ETH
            tickets[i].owner = address(0x0);    // not owned yet
        }
    }

    function buyTicket(uint256 index) external payable {
        require(index<10 && index>=0);
        require(tickets[index].owner == address(0x0));
        require(msg.value >= tickets[index].price);
        tickets[index].owner = msg.sender;
    }
}