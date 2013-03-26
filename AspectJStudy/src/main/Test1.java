package main;

import data.Figur;
import data.FigureElement;
import data.Line;
import data.Point;

public class Test1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Figur factory = new Figur();
		Point p = factory.makePoint();
		p.setX(10);

		Line l = factory.makeLine();

		l.rotate(100.0);
	}

}
