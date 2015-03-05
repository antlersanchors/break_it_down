
class WaveBank {

	int x;
	int y;
	float oscVal;

	ArrayList<Wave> waves;

	public WaveBank() {

		waves = new ArrayList<Wave>();

		for (int i=0; i < numWaves; i++ ){
			Wave w = new Wave(i);
			waves.add(w);
		}
	}

	public void display(int tempX, int tempY, float oscValTemp) {

		x = tempX;
		y = tempY;
		oscVal = oscValTemp * noise(0,0.03);
		println("oscVal: "+oscVal);

		translate(x + oscVal, y + oscVal);
		for (int i=0; i < waves.size(); i++ ){
			
			Wave w = waves.get(i);
			w.display(oscVal);

		}
	}
}