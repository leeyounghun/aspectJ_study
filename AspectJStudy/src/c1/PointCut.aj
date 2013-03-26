package c1;

import data.FigureElement;


public aspect PointCut {
	pointcut move():
		call(void FigureElement.setXY(int, int)) ||
		call(void Point.setX(int))||
		call(void Point.setY(int)) ||
		call(void Line.setP1(Point))||
		call(void Line.setP2(Point))||
		call(void Figure.make*(..))||
		call(public * Figure.*(..));

	before():move(){
		System.out.println("about to move");
	}

	/**
	 *
	 * after() 언제나호출
	 *
	 * after returning 정상종료 after throwing 예외호출
	 */
	after() returning:move(){
		System.out.println("after returning");
	}

	after(FigureElement fe, int x, int y) returning :
		call(void FigureElement.setXY(int, int))
		&& target(fe)
        && args(x, y)
	{
		System.out.println(fe + "move to ( x : " + x + ", y :  " + y);
	}

	pointcut setXY(FigureElement fe, int x, int y):
	    call(void FigureElement.setXY(int, int))
	    && target(fe)
	    && args(x, y);


	after(FigureElement fe, int x, int y) returning: setXY(fe, x, y) {
	    System.out.println(fe + " moved to (" + x + ", " + y + ").");
	}

}
