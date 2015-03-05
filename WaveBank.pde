
class WaveBank {

	int x;
	int y;
	float oscVal;

	PVector position; 
	PVector drawPosition;

	ArrayList<Wave> waves;

	public WaveBank(float tempX, float tempY) {

		position = new PVector(tempX, tempY);
		println("creation position: "+position);

		waves = new ArrayList<Wave>();

		for (int i=0; i < numWaves; i++ ){
			Wave w = new Wave(i);
			waves.add(w);

		}
	}

	public void display(PVector locTemp, float oscValTemp) {

		drawPosition = locTemp;
		oscVal = oscValTemp * noise(0,0.03);
		
		for (int i=0; i < waves.size(); i++ ){
			
			pushMatrix();
			translate(drawPosition.x + oscVal, drawPosition.y + oscVal);
			Wave w = waves.get(i);
			w.display(oscVal);
			popMatrix();

		}
	}
};