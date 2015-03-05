
class Wave {

	int pos;
	float oscVal;
	PShape w;

	public Wave(int posTemp) {

		pos = posTemp;
		
	}

	public void display(float oscValTemp) {

		oscVal = oscValTemp * 0.3 * noise(0,0.03);

		w = createShape();
		w.beginShape();
		w.fill(0, 255, 35, 135);
		w.vertex(0,0);
		w.bezierVertex(10, 10, 15 + 5 * oscVal, 15, 30 + 5 * oscVal, 30);
		w.bezierVertex(10, 20, 15 + 2 * oscVal, 45, 0, 60);
		w.endShape(CLOSE);
		
		shape(w, 0 + waveWidth * pos, 0);
		
	}
};