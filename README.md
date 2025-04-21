# 🔫 sol-counter-strike

**Counter-Strike on the blockchain.**  
A fully on-chain tactical shooter game built with Solidity. Choose your team, pick your weapon, and enter the match — turn-based combat powered by Ethereum.

---

## 🎮 Game Concept

- Players join as **Terrorists** or **Counter-Terrorists**
- Pick your weapon: `Pistol`, `Rifle`, or `Sniper`
- Game starts when enough players join
- Future updates: shooting logic, rounds, and victory conditions 

This is a **pure Web3 game** — no tokens, no rewards, no off-chain logic. Just gameplay on the Ethereum Virtual Machine (EVM).

---

## ⚙️ Smart Contract Overview  

```solidity
joinGame(Team team)          // Join a team (Terrorist or Counter-Terrorist)
chooseWeapon(Weapon weapon)  // Choose your weapon before game starts
startGame()                  // Owner starts the game once ready
getAllPlayers()              // View all joined players
