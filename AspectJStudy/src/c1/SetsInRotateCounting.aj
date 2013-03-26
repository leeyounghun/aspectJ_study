package c1;

public aspect SetsInRotateCounting {
	int rotateCount = 0;
    int setCount = 0;

    before(): call(void data.Line.rotate(double)) {
    	System.out.println("line is roating");
        rotateCount++;
    }

    before(): call(void data.Point.set*(int))
              && cflow(call(void data.Line.rotate(double))) {
    	System.out.println("line with set");
        setCount++;
    }

    before(): call(void data.Point.setX(int)){
    	System.out.println("aa");
    }

}
