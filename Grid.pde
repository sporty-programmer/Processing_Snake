class Grid {

    public int diameter = 30;
    public int width = 17;
    public int height = 15;
    public color backgroundColor = color(0, 0, 0);

    public color[][] cells = new color[width][height];

    public Grid() {
        // set all cells to black
        for (int i = 0; i < this.width; i++) {
            for (int j = 0; j < this.height; j++) {
                cells[i][j] = backgroundColor;
            }
        }
    }

    public void draw_apples(Apples apples) {
        for (Coord apple : apples.apples) {
            grid.set(apple, apples.appleColor);
        }
    }

    public void draw_snake(Snake snake) {
        SnakePart current = snake.head;
        grid.set(current.coord, snake.snakeHeadColor);
        current = current.next;
        while(current != null) {
            grid.set(current.coord, snake.snakeBodyColor);
            current = current.next;
        }
    }

    public void draw() {
        for (int x = 0; x < this.width; x++) {
            for (int y = 0; y < this.height; y++) {
                stroke(255);
                fill(this.cells[x][y]);
                rect(x * this.diameter, y * this.diameter, this.diameter, this.diameter);
            }
        }
    }

    public Boolean set(Coord coord, color c) {
        if (coord.x < 0 || coord.x >= this.width || coord.y < 0 || coord.y >= this.height) { return false; }
        this.cells[coord.x][coord.y] = c;
        return true;
    }

    public void reset() {
        for (int x = 0; x < this.width; x++) {
            for (int y = 0; y < this.height; y++) {
                this.cells[x][y] = this.backgroundColor;
            }
        }
    }
}