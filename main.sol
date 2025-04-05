// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CounterStrike {
    enum Team { None, Terrorist, CounterTerrorist }
    enum Weapon { None, Pistol, Rifle, Sniper }

    struct Player {
        address addr;
        Team team;
        Weapon weapon;
        bool isAlive;
    }

    address public owner;
    mapping(address => Player) public players;
    address[] public playerList;

    uint public maxPlayers = 10;
    bool public gameStarted = false;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier onlyBeforeStart() {
        require(!gameStarted, "Game already started");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function joinGame(Team team) external onlyBeforeStart {
        require(players[msg.sender].addr == address(0), "Already joined");
        require(playerList.length < maxPlayers, "Max players reached");
        require(team == Team.Terrorist || team == Team.CounterTerrorist, "Invalid team");

        players[msg.sender] = Player({
            addr: msg.sender,
            team: team,
            weapon: Weapon.None,
            isAlive: true
        });

        playerList.push(msg.sender);
    }

    function chooseWeapon(Weapon weapon) external onlyBeforeStart {
        require(players[msg.sender].addr != address(0), "Not joined");
        require(weapon != Weapon.None, "Invalid weapon");

        players[msg.sender].weapon = weapon;
    }

    function startGame() external onlyOwner onlyBeforeStart {
        require(playerList.length >= 2, "Need at least 2 players");
        gameStarted = true;
    }

    function getPlayer(address player) external view returns (Player memory) {
        return players[player];
    }

    function getAllPlayers() external view returns (Player[] memory) {
        Player[] memory result = new Player[](playerList.length);
        for (uint i = 0; i < playerList.length; i++) {
            result[i] = players[playerList[i]];
        }
        return result;
    }
}
