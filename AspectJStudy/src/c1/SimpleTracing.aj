package c1;

public aspect SimpleTracing {
	pointcut tracedCall():
		call (void data.FigureElement.draw());

	before():tracedCall(){
		System.out.println("entering " + thisJoinPoint );
	}
}
