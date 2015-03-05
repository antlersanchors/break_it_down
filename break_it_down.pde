int numWaves = 5;
int waveWidth = 30;

Oscillator osc = new Oscillator(-10, 5, 0.05);

WaveBank bank;

public void setup() {
	size(512, 512, P2D);
	smooth();


	translate(width/2 - (waveWidth*numWaves)/2, height/2);
	bank = new WaveBank();

}

void draw() {
	background(15, 35, 255);
	
	translate(width/2 - (waveWidth*numWaves)/2, height/2);

	bank.display(0, 0, osc.update());

};