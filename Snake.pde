class Snake {

    public SnakePart head;
    public SnakePart tail;

    public color snakeHeadColor = color(255, 150, 150);
    public color snakeBodyColor = color(255, 0, 0);

    public Direction direction = Direction.RIGHT;

    public Snake(Coord coord) {

        head = new SnakePart(coord);
        head.previous = null;
        head.next = null;

        tail = head;
    }

    public void grow() {

        Coord coord = tail.coord.copy();

        if (length() == 1) {
            switch (direction) {
                case RIGHT: coord.x--; break;
                case DOWN:  coord.y--; break;
                case LEFT:  coord.x++; break;
                case UP:    coord.y++; break;
            }
        }
        else {
            coord.x += tail.coord.x - tail.previous.coord.x;
            coord.y += tail.coord.y - tail.previous.coord.y;
        }

        tail.next = new SnakePart(coord);
        tail.next.previous = tail;
        tail.next.next = null;

        tail = tail.next;
    }

    public int length() {

        if (head == null) {
            // let the program crash in the next few lines
        }

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

        Coord head_coord_new = head.coord.copy();

        switch (direction) {
            case RIGHT: head_coord_new.x++; break;
            case DOWN:  head_coord_new.y++; break;
            case LEFT:  head_coord_new.x--; break;
            case UP:    head_coord_new.y--; break;
        }

        SnakePart current = tail;
        while (current.previous != null) {
            current.coord = current.previous.coord;
            current = current.previous;
        }
        head.coord = head_coord_new;
    }

    public Boolean lost(Grid grid) {

        if (head.coord.x < 0 || head.coord.x >= grid.width ||
            head.coord.y < 0 || head.coord.y >= grid.height) {
                return true;
            }

        SnakePart current = head.next;
        while (current != null) {
            if (head.coord.x == current.coord.x &&
                head.coord.y == current.coord.y) {
                    return true;
                }
            current = current.next;
        }

        return false;
    }
}