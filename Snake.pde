class SnakePart {

  short x;
  short y;

  SnakePart previous;
  SnakePart next;

  SnakePart(short x, short y) {
    this.x = x;
    this.y = y;
  }
}

class Snake {

    public SnakePart head;

    public Snake(short x, short y) {
        head = new SnakePart(x, y);
        head.previous = null;
        head.next = null;
    }

    public void add() {

        SnakePart last = head;
        while (last.next != null) {
            last = last.next;
        }

        last.next = new SnakePart(last.x, last.y);
        last.next.next = null;
    }

    public short length() {

        short len = 1;

        SnakePart current = head;

        while (current != null) {
            len++;
            current = current.next;
        }

        return len;
    }

    public void move() {
        
        // TODO: implement snake movement
    }
}