class SnakePart {
  Coord coord;
  SnakePart next;
  SnakePart previous;

  SnakePart(Coord coord) {
    this.coord = coord;
  }
}

enum Direction {
  UP,
  RIGHT,
  DOWN,
  LEFT
}

class Snake {
    public SnakePart head;
    public SnakePart tail;
    public color snakeColor = color(255, 0, 0);
    public Direction direction = Direction.RIGHT;

    public Snake(Coord coord) {

        head = new SnakePart(coord);
        head.previous = null;
        head.next = null;

        tail = head;
    }

    public void grow() {

        // TODO: später richtig implementieren
        tail.next = new SnakePart(
            new Coord(
                2 * tail.coord.x - tail.previous.coord.x,
                2 * tail.coord.y - tail.previous.coord.y
            )
        );
        tail.next.previous = tail;
        tail.next.next = null;
        tail = tail.next;
    }

    public int length() {

        int len = 1;

        SnakePart current = head;
        while (current.next != null) {
            len++;
            current = current.next;
        }

        return len;
    }

    public void move() {

        // TODO: kollisionen checken (wände, äpfel, sich selbst)

        Coord coord = head.coord;

        switch (direction) {

            case RIGHT:
                coord.x++;
                break;

            case DOWN:
                coord.y++;
                break;

            case LEFT:
                coord.x--;
                break;

            case UP:
                coord.y--;
                break;
        }

        SnakePart current = tail;
        while (current.previous != null) {
            current.coord = current.previous.coord;
            current = current.previous;
        }
        head.coord = coord;
    }

    public void draw(Grid grid) {

        SnakePart current = snake.head;
        while(current != null) {
            grid.set(current.coord, snake.snakeColor);
            current = current.next;
        }
    }
}