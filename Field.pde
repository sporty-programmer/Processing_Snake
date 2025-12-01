class Grid {

    public short diameter = 30;
    public short width = 17;
    public short height = 15;

    public color[][] cells = new color[width][height];

    public Grid() {
        
        // set all cells to black
        for (int i = 0; i < this.width; i++) {
            for (int j = 0; j < this.height; j++) {
                cells[i][j] = color(0, 0, 0);
            }
        }
    }

    public void draw() {

        for (int i = 0; i < this.width; i++) {
            for (int j = 0; j < this.height; j++) {
                stroke(255);
                fill(cells[i][j]);
                rect(i*diameter, j*diameter, diameter, diameter);
            }
        }
    }

    public void set(short x, short y, color c) {

        this.cells[x][y] = c;
    }
}