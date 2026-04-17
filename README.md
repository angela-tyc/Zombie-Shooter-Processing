# Zombie Shooter 🧟

A 2D top-down zombie survival shooter game built with Processing.  
**Graphics CS Final Project — Group 17**

## Overview
Survive waves of zombies that chase you across the screen. 
Move your player, shoot zombies with your mouse, and see how 
long you can last as the difficulty ramps up each level.

## Gameplay
- Zombies spawn randomly and chase the player
- Shoot toward your mouse cursor to eliminate them
- Score decreases over time — survive as long as possible
- Difficulty increases every level (zombies spawn faster)
- 5 levels total with color-coded level indicators
- Pause anytime, and your high score is tracked per session

## Controls
| Key | Action |
|-----|--------|
| W / ↑ | Move up |
| A / ← | Move left |
| S / ↓ | Move down |
| D / → | Move right |
| Mouse click | Shoot toward cursor |
| P | Pause / Resume |

## Levels
| Level | Score Threshold |
|-------|----------------|
| 1 | Start |
| 2 | 100 |
| 3 | 300 |
| 4 | 600 |
| 5 | 1000 |

## How to Run
1. Download and install [Processing](https://processing.org/download)
2. Install the **Sound** library:
   - In Processing: Sketch → Import Library → Add Library → search "Sound" → Install
3. Clone or download this repo
4. Open `group_17_finalproject.pde` in Processing
5. Make sure all asset files are in the same folder:
   - `button.mp3`
   - `background.mp3`
   - `shooting.mp3`
   - `gameover.mp3`
   - `backgroundfinal.png`
   - `ComicSansMS-Bold-48.vlw`
6. Press the ▶ Run button

## Built With
- [Processing](https://processing.org/) (Java-based)
- Processing Sound Library

## Files
- `group_17_finalproject.pde` — main game loop, input handling, game states
- `Player.pde` — player class (movement, display)
- `Zombie.pde` — zombie class (spawning, movement, collision)
- `Bullet.pde` — bullet class (shooting mechanics)