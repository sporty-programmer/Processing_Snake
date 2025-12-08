class Apples {

    public int gridWidth;
    public int gridHeight;
    public color appleColor = color(0, 255, 0);

    public ArrayList<Coord> apples = new ArrayList<Coord>();

    public Apples(int gridWidth, int gridHeight) {
        this.gridWidth = gridWidth;
        this.gridHeight = gridHeight;
    }

    public void spawnApple() {

        // TODO: checken ob feld frei (keine schlange, kein apfel)
        
        apples.add(
            new Coord(
                (int) random(0, this.gridWidth),
                (int) random(0, this.gridHeight)
            )
        );
    }

    public void dispawnApple(Coord coord) {
        apples.remove(coord);
    }

    public void draw(Grid grid) {
        for (Coord apple : apples) {
            grid.set(apple, this.appleColor);
        }
    }
}