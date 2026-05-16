 🍄 MASM Super Mario Platformer

> A fully-featured 2-level platformer built from scratch in **x86 MASM Assembly** with Irvine32 library and WinMM audio support.

![Assembly](https://img.shields.io/badge/Assembly-x86_MASM-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![Levels](https://img.shields.io/badge/Levels-2-brightgreen)
![Status](https://img.shields.io/badge/Status-Complete-success)

---


## 🎮 Overview

This project is a complete 2D platformer inspired by classic Super Mario Bros., implemented entirely in **Microsoft Macro Assembler (MASM)** using the Irvine32 library. It demonstrates low-level game development concepts including real-time input handling, collision detection, sprite rendering, audio synthesis via WinMM, and state management — all written in x86 assembly language.

> **Why Assembly?** This project showcases the fundamentals of computer architecture, memory management, and direct hardware interaction that modern high-level languages abstract away.

---

## ✨ Features

### Core Gameplay
- **Smooth Movement** — Walk left/right with momentum-based physics
- **Jump Mechanics** — Jump up to 5 tiles with gravity and falling simulation
- **Mid-air Control** — Adjust trajectory while jumping for precision platforming
- **Solid Collision** — Full collision detection with ground, blocks, and boundaries
- **Multi-Zone Levels** — 2 distinct levels with seamless teleportation between areas
- **Enemy AI** — Patrolling enemies with collision-based damage system
- **Time Pressure** — 200-second time limit per level for added challenge

### Advanced Systems
- **Scoring Engine** — Real-time score tracking with combo potential
- **Life Management** — Heart-based life system with extra life pickups
- **High Score Persistence** — Save and display top scores across sessions
- **Pause/Resume** — Full game state preservation during pause

---

## 🕹️ Gameplay

Navigate through two challenging levels filled with enemies, traps, and secrets. Collect coins, grab power-ups, and find hidden areas to maximize your score. Reach the end of each level before time runs out!

### Objective
- Survive enemy encounters
- Collect items and maximize score
- Find secret areas and underworld passages
- Complete both levels to win

---

## ⌨️ Controls

| Key | Action | Notes |
|:---:|:---|:---|
| **A** | Move Left | Swaps with D after `@` power-up |
| **D** | Move Right | Swaps with A after `@` power-up |
| **W** | Jump | Standard jump |
| **E** | Jump | Alternative jump key |
| **P** | Pause Game | Freezes gameplay and timer |
| **R** | Resume Game | Continues from pause |
| **H** | View Highscores | Shows top scores |
| **M** | Main Menu | Return to title screen |
| **X** | Exit Game | Quit to desktop |

> **Pro Tip:** After collecting the `@` Special Power, your controls reverse — A moves right and D moves left! Adapt quickly to survive.

---

## 🏆 Scoring System

| Action | Points | Effect |
|:---|:---:|:---|
| Collect `0` (Coin) | **+20** | Basic currency |
| Collect `8` (Rare Coin) | **+200** | High-value coin |
| Collect `&` (Heart) | **+0** | **+1 Extra Life** |
| Collect `L` (Risk Token) | **+1000** | **-1 Life** (Risk/Reward!) |
| Collect `@` (Special Power) | **+3000** | **+1 Life**, Super Jump, Reversed Controls |
| Defeat Enemy (Jump on) | **+100** | Remove enemy from map |
| Break `$` Block | **+20** | Block collapses, may reveal hidden path |
| **Level Completion** | **+2000** | Bonus for finishing level |

### High Score Table
Press **H** during gameplay or from the menu to view your highest scores. Scores are persisted between sessions.

---

## 🎁 Items & Power-ups

### `0` — Standard Coin
Common collectible. Worth 20 points each. Scattered throughout levels.

### `8` — Rare Coin
High-value collectible worth 200 points. Often hidden or in dangerous locations.

### `&` — Heart
Restores one life. Essential for surviving difficult sections. Limited spawns per level.

### `L` — Risk Token
**High risk, high reward!** Grants 1000 points but costs 1 life. Use strategically when you have lives to spare.

### `@` — Special Power
The ultimate power-up:
- **+3000 points** instantly
- **+1 Extra Life**
- **Super Jump** — Jump height increased from 5 to 6 blocks
- **Reversed Controls** — A and D swap directions (challenge mechanic!)

### `$` — Score Trigger
Breakable block worth 20 points. When broken, the tile collapses and may drop the player into hidden areas or secret paths.

---

## ⚡ Special Mechanics

### 🌀 Teleportation
Certain locations allow instant travel across the map. Discover teleport points to skip dangerous sections or access hidden areas.

### 🦘 Super Jump
Activated by the `@` power-up. Increases maximum jump height from 5 tiles to 6 tiles, allowing access to previously unreachable areas.

### 🔄 Control Reversal
A double-edged mechanic from the `@` power-up. Your horizontal movement keys swap — A moves right, D moves left. Lasts until power-up expires or level ends.

### 💀 Risk-Reward Design
The `L` token and `@` power-up introduce strategic decision-making. Is the score boost worth the life cost? Can you handle reversed controls for super jump capability?

### 👾 Enemy Stomping
Jump directly on top of enemies to defeat them and earn 100 points. Timing is crucial — side contact damages you instead!

### 🕳️ Collapsible Paths
Breaking `$` blocks doesn't just give points — it destroys the tile beneath you. Use this to create shortcuts, fall into the underworld, or accidentally plummet to your doom!

---

## 🔮 Secret Areas

### 🚪 Secret Room
Hidden chambers accessible only by:
- Breaking specific tiles (`$` blocks)
- Finding special teleport locations
- Executing precise platforming sequences

Secret rooms often contain rare coins, hearts, or score tokens.

### 🔥 Underworld
A dangerous subterranean map layer featuring:
- Increased enemy density
- More complex obstacles and traps
- Unique hazards not found on the surface

**How to Access:**
- Fall through holes in the level
- Trigger special collapse events
- Break specific floor tiles

**How to Escape:**
- Find the exit portal back to the surface
- Complete the underworld challenge to progress
- Some underworld areas are optional but contain major score bonuses

> **Warning:** The underworld is not for the faint of heart. Enter prepared or risk losing precious lives!

---

## 🎵 Audio & Visuals

### Sound Design
- **Continuous Background Music** — Thematic music plays throughout levels
- **Jump SFX** — Distinctive jump sound for audio feedback
- **Coin Collection** — Satisfying pickup chime
- **Power-up Sound** — Unique audio for each item type
- **Enemy Hit/Defeat** — Combat audio feedback
- **Win/Lose Jingles** — Victory and game over themes

### Visual Presentation
- **ASCII Graphics** — Retro-style character and tile art rendered in text
- **Color-Coded Display** — Different colors for:
  - Player character
  - Enemies
  - Collectibles (coins, power-ups)
  - Terrain and blocks
  - UI elements (score, lives, timer)
- **Menu Screens** — Styled ASCII art for main menu, pause, game over, and victory
- **HUD Overlay** — Real-time display of score, lives, time remaining, and level info

---

## 💻 Installation

### Prerequisites
- Windows OS (Windows 7 or later recommended)
- Irvine32 library setup
- WinMM library (included with Windows)

### Download
```bash


# Link with Irvine32 and WinMM libraries
link main.obj irvine32.lib winmm.lib /SUBSYSTEM:CONSOLE
Using Visual Studio with MASM
Create new Empty Project
Enable Build Customizations → Select masm
Add .asm files to project
Configure Linker → Additional Dependencies:
irvine32.lib
winmm.lib
Build and run (Ctrl+F5)
Run the Game
bash
Copy
# Execute the compiled binary
main.exe
🖥️ System Requirements
Table
Component	Minimum	Recommended
OS	Windows 7	Windows 10/11
CPU	x86 compatible processor	Any modern x86/x64
RAM	512 MB	2 GB
Display	80x25 console window	Fullscreen console
Audio	Windows-compatible sound	Any PC audio
📸 Screenshots
Screenshots will be added here. Suggested captures:
Main Menu ASCII art
Level 1 gameplay with HUD
Underworld secret area
Game Over / Victory screens

📜 License
This project is released for educational purposes.
Note: This is a fan project inspired by Nintendo's Super Mario Bros. All original Mario characters, concepts, and trademarks are property of Nintendo Co., Ltd. This project is not affiliated with or endorsed by Nintendo.
You may use this code for:
✅ Learning x86 Assembly programming
✅ Educational reference for game development
✅ Portfolio demonstration
Please include appropriate attribution if you fork or reference this project.
🚀 Future Enhancements
Potential additions for future versions:
[ ] Additional levels (World 3, 4, etc.)
[ ] Boss battles at end of each world
[ ] Save/load game state
[ ] More enemy types with unique behaviors
[ ] Animated sprite transitions
[ ] Two-player competitive mode
[ ] Level editor tool
🤝 Contributing
Contributions are welcome! This is primarily an educational project, but improvements are appreciated:
Fork the repository
Create your feature branch (git checkout -b feature/amazing-feature)
Commit your changes (git commit -m 'Add amazing feature')
Push to the branch (git push origin feature/amazing-feature)
Open a Pull Request

⭐ Star this repo if you found it helpful or interesting

