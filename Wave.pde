
class Wave {

	int pos;
	float oscVal;
	PShape w;

	public Wave(int posTemp) {

		pos = posTemp;
		
	}

	public void display(float oscValTemp) {

		oscVal = oscValTemp * 0.1;

		rotate(radians(45));
		w = createShape();
		w.beginShape();
		w.fill(0, 255, 35, 135);
		w.vertex(0,0);
		w.bezierVertex(10*oscVal, 10, 15*oscVal, 15, 30*oscVal, 30);
		w.bezierVertex(30*oscVal, 30, 15*oscVal, 45, 0, 60);
		w.endShape(CLOSE);

		shape(w, 0 + waveWidth * pos, 0);
		
	}

	public void displayOld() {

		fill(0, 255, 35, 135);
		ellipse(0 + waveWidth * pos, 0, waveWidth, waveWidth);
	}
};