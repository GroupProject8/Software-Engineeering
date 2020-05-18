// Make sure to import mqtt and controlp5 libraries before running

import mqtt.*;
import controlP5.*;
PImage img;
ControlP5 cp5;
MQTTClient client;
Dashboard_view view = new Dashboard_view();
RecipeData api = new RecipeData();
Database db = new Database();

void setup() {
    textSize(40);
    textAlign(CENTER);
    
    cp5 = new ControlP5(this);
    // connect to the broker
    client = new MQTTClient(this);
    // connect to the broker and use a random string for clientid
    client.connect("mqtt://broker.mqttdashboard.com", "processing" + str(random(3)));
    
    delay(100);
    
    // refresh the dashboard with the information
    updateDashboardData();
    img = loadImage("pokefood.png");
}

public void settings() {
  size(900, 620);

}

// we don't really use the draw function as controlP5 does the work
void draw() {
    
    
    background(165, 165, 165);
    text("Recipe Sending System",430,120);
    image(img,20,20,200,40);
    
}
