/* Comment Block
The game has win/lose condition, the core gameplay mechanics (walk, jump, ladder climbing, power-ups pick up, cheat), time limit and visual indicator for time remaining are finished.
Modify background tiles at runtime and sounds still need to be added.
No bugs so far.
To play: Use left & right to move on a platform, up & down to move on a ladder, press B to jump over obstacles/enemies, collide with power-ups to pick them up. Try your best to reach the top of the level in the time limit to deliver the food to the customer who is waiting you at the top.
*/

#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "title.h"
#include "pause.h"
#include "gameBg.h"
#include "lose.h"
#include "win.h"
#include "spritesheet.h"
#include "instruction.h"
#include "underground.h"

// Prototypes.
void initialize();

// State Prototypes.
void initArrow();
void drawArrow();
void goToInstruction();
void instruction();
void goToInstruction();
void instruction();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States.
enum {
    START,
    INSTRUCTION,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;
int t_select;
ARROW arrow;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

int initialized2 = 0;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

int main() {

    initialize();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state) {
            case INSTRUCTION:
                instruction();
                break;
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
    }
}

// Sets up GBA.
void initialize() {
    life = 3;
    delivered = 0;
    score = 0;
    initialized2 = 0;

    buttons = BUTTONS;
    oldButtons = 0;

    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_LARGE;
    
    t_select = 0;

    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    initArrow();
    goToStart();
}

// Sets up the start state.
void goToStart() {
    hideSprites();
    waitForVBlank();
    // Call DMANow to load in startPal
    DMANow(3, titlePal, PALETTE, titlePalLen / 2);
    DMANow(3, titleTiles, &CHARBLOCK[0], titleTilesLen / 2);
    DMANow(3, titleMap, &SCREENBLOCK[31], titleMapLen / 2);

    // add arrow selection
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    
    state = START;

}

void initArrow() {
    arrow.height = 16;
    arrow.width = 16;
    arrow.row = SCREENHEIGHT / 3 + 18;
    arrow.col = SCREENWIDTH / 7;
}

void drawArrow() {
    shadowOAM[14].attr0 = arrow.row | ATTR0_SQUARE;
    shadowOAM[14].attr1 = arrow.col | ATTR1_SMALL;
    shadowOAM[14].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
}

// Runs every frame of the start state.
void start() {
    hideSprites();
    drawArrow();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
    if (BUTTON_PRESSED(BUTTON_DOWN) && t_select == 0) {
        t_select++;
        arrow.row += 28;
    }

    if (BUTTON_PRESSED(BUTTON_UP) && t_select == 1) {
        t_select--;
        arrow.row -= 28;
    }

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START) && t_select == 0) {
        initGame();
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_START) && t_select == 1) {
        goToInstruction();
    }
}

void goToInstruction() {
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_SIZE_LARGE;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    // Display instruction screen
    DMANow(3, instructionPal, PALETTE, instructionPalLen / 2);
    DMANow(3, instructionTiles, &CHARBLOCK[0], instructionTilesLen / 2);
    DMANow(3, instructionMap, &SCREENBLOCK[31], instructionMapLen / 2);
    waitForVBlank();
    
    state = INSTRUCTION;
}

void instruction() {
    // back to splash
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
    }
}

// Sets up the game state.
void goToGame() {
    paused = 0;
    won = 0;
    lost = 0;
    hideSprites();
    waitForVBlank();
    // Load the background's palette and tiles into a desired space in memory
    // DMANow(3, gameBgPal, PALETTE, 256);
    // DMANow(3, gameBgTiles, &CHARBLOCK[0], gameBgTilesLen / 2);
    // DMANow(3, gameBgMap, &SCREENBLOCK[31], gameBgMapLen / 2);
    DMANow(3, undergroundPal, PALETTE, 256);
    DMANow(3, undergroundTiles, &CHARBLOCK[0], undergroundTilesLen / 2);
    DMANow(3, undergroundMap, &SCREENBLOCK[31], undergroundMapLen / 2);
    state = GAME;
}

// Runs every frame of the game state.
void game() {
    updateGame();
    drawGame();
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (life == 0 || (time_m == 0 && time_s == 0)) {
        goToLose();
    }
    // Easter egg: if score 99 win directly
    if (delivered || score >= 99) {
        goToWin();
    }
}

// Sets up the pause state.
void goToPause() {
    paused = 1;
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    // Load in pause pal
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen / 2);

    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    state = PAUSE;
}

// Runs every frame of the pause state.
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    // restart the game
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
    }
}

// Sets up the win state.
void goToWin() {
    REG_TM1CNT = TIMER_OFF;
    won = 1;
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    // Load in pause pal
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[31], winMapLen / 2);

    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    state = WIN;
}

// Runs every frame of the win state.
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    }
}

// Sets up the lose state.
void goToLose() {
    lost = 1;
    REG_TM1CNT = TIMER_OFF;
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    // Load in pause pal
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen / 2);

    REG_BG1VOFF = 0;
    REG_BG1HOFF = 0;
    state = LOSE;
}

// Runs every frame of the lose state.
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    }
}