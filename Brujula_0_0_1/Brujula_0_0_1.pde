//Android
import ketai.sensors.*;
import android.location.Location;

KetaiLocation location;
KetaiSensor sensor;
Location destination;
PVector locationVector = new PVector();
float compass;


//Citas
String[] words;
int m1 = minute();
int index=int(random(40));
int no=0;
int a=255;

void setup() {
  destination = new Location("bam");
  destination.setLatitude(19.285120);
  destination.setLongitude(-99.650970);
  location = new KetaiLocation(this);
  sensor = new KetaiSensor(this);
  sensor.start();
  orientation(PORTRAIT);
  textAlign(CENTER, CENTER);
  textSize(72);
  smooth();
  frameRate(30);
}

void draw() {
  float bearing = location.getLocation().bearingTo(destination);
float d1 = (location.getLocation().distanceTo(destination)/500);
float dc =(d1/51)*-10000;
  float r;

  background(250, 92, 75);
  citas();

    translate(width/2, height/2);
    rotate(radians(bearing) - (radians(compass)%176)); //175
    r=(radians(bearing) - radians(compass));
    noStroke();
    triangle(-width/4, 600, width/4, 600, 0, width/2-100);
            //quad(-width/4, 0, width/4, 0, 15, -width/3,-15,-width/3);
  }



void onLocationEvent(Location _location) {
  println("onLocation event: " +_location.toString());
  locationVector.x = (float)_location.getLatitude();
  locationVector.y = (float)_location.getLongitude();
}
void onOrientationEvent(float x, float y, float z, long time, int accuracy) {
  compass = x;
}

void citas(){  
  PFont font;
  font=createFont("Henniver.ttf",12);
  textFont(font);  
  int m2= minute()%2;
String[] lines = loadStrings("citas.txt");
textSize(64);
fill(255,255,255,a);
text(lines[(index+no)%40],(width/2)-200,(height/2)-350,(width/2)+50,(height/2)+150);

  if (mousePressed==true){
       a=255;//Alpha de la letra  
       no=no+1;//Pasa de frase
}else{
  a=(a-2);//Control alpha
}
  }
