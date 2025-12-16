Grid grid;
Snake snake;
Apples apples;

int clk;
int tickSpeedMs;

void setup() {

    grid = new Grid();
    snake = new Snake(new Coord(1, 1));
    apples = new Apples(grid.width, grid.height);

    clk = millis();
    tickSpeedMs = 250;

    int width = 17;
    int height = 15;
    int diameter = 30;

    size(17*30+2, 15*30); // x axis + 2 because else border of invisible

    grid.width = width;
    grid.height = height;
    grid.diameter = diameter;

    for (int i = 0; i < 2; i++) {
        snake.grow();
    }

    apples.spawnApple();

    focused = true;
}

void draw() {

    if (millis() - clk < tickSpeedMs) { return; }
    clk = millis();

    background(0, 0, 0);

    snake.move();
    if (snake.lost(grid)) {
        println("You lost! Final length: " + snake.length());
        noLoop();
    }

    grid.draw_apples(apples);
    grid.draw_snake(snake);
    grid.draw();
    grid.reset();
}

void keyPressed() {

    switch (keyCode) {

        case RIGHT:
            snake.direction = Direction.RIGHT;
            break;

        case DOWN:
            snake.direction = Direction.DOWN;
            break;

        case LEFT:
            snake.direction = Direction.LEFT;
            break;

        case UP:
            snake.direction = Direction.UP;
            break;
    }

    switch (key) {

        case 'd':
        case 'D':
            snake.direction = Direction.RIGHT;
            break;

        case 's':
        case 'S':
            snake.direction = Direction.DOWN;
            break;

        case 'a':
        case 'A':
            snake.direction = Direction.LEFT;
            break;

        case 'w':
        case 'W':
            snake.direction = Direction.UP;
            break;
    }
}