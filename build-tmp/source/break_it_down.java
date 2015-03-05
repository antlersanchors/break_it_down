import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class break_it_down extends PApplet {

int numWaves = 5;
int waveWidth = 30;

Oscillator osc = new Oscillator(-10, 5, 0.05f);

WaveBank bank;

public void setup() {
	size(512, 512, P2D);


	translate(width/2 - (waveWidth*numWaves)/2, height/2);
	bank = new WaveBank();

}

public void draw() {
	background(15, 35, 255);
	
	translate(width/2 - (waveWidth*numWaves)/2, height/2);

	bank.display(0, 0, osc.update());


};
class Oscillator {
  
  float _step, _theta;
  float _min, _max, _length;
  
  public Oscillator(float min, float max, float step) {
    _min = min;
    _max = max;
    _length = max - min;
    _step = step;
    _theta = 0;
  }
  
  public float update() {
    _theta += _step;
    return (sin(_theta) *  _length / 2) + _length / 2; 
  }
  
};

class Wave {

	int pos;
	float oscVal;
	PShape w;

	public Wave(int posTemp) {

		pos = posTemp;
		

		
	}

	public void display(float oscValTemp) {

		oscVal = oscValTemp * 0.1f;

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
		oscVal = oscValTemp;
		println("oscVal: "+oscVal);

		translate(x + oscVal, y + oscVal);
		for (int i=0; i < waves.size(); i++ ){
			
			Wave w = waves.get(i);
			w.display(oscVal);

		}
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "break_it_down" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
