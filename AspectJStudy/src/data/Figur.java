package data;

public class Figur {
	public Point makePoint(){
		return new Point();
	}

	public Line makeLine(){
		Line line = new Line();
		line.setP1(new Point());
		line.setP2(new Point());

		return line;
	}
}
