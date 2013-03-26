package c1;

import java.util.Iterator;
import java.util.Vector;

import data.Point;
import data.Screen;


public aspect PointObserving {
	private Vector Point.observers = new Vector();

	public static void addObserver(Point p, Screen s) {
		/*p.observers.add(0,new Object());*/
	}

	public static void removeObserver(Point p, Screen s) {
		p.observers.remove(s);
	}

	pointcut changes(Point p): target(p) && call(void Point.set*(int));

	after(Point p): changes(p) {
		Iterator iter = p.observers.iterator();
		while (iter.hasNext()) {
			updateObserver(p, (Screen) iter.next());
		}
	}

	static void updateObserver(Point p, Screen s) {
		s.display(p);
	}

}
