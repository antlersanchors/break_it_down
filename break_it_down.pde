int numWaves = 5;
int waveWidth = 30;

Oscillator osc = new Oscillator(-10, 5, 0.05);

WaveBank bank;

ArrayList<WaveBank> ocean = new ArrayList<WaveBank>();

public void setup() {
	size(512, 512, P2D);
	smooth();
	frameRate(30);

}

public void draw() {
	background(15, 35, 255);
	
	PVector drawLoc;

	for (int i=0; i < ocean.size(); i++ ){

		bank = ocean.get(i);
		drawLoc = bank.position;

		bank.display(drawLoc, osc.update());
		
	}
}

public void mousePressed() {

	bank = new WaveBank(mouseX, mouseY);
	ocean.add(bank);

};