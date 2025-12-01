Grid grid = new Grid();

void setup() {

    size(17*30, 15*30);

    grid.set((short)5, (short)5, color(255, 0, 0));
}

void draw() {

    background(255, 0, 0);

    grid.draw();
}
