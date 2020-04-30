// Make sure to import mqtt and controlp5 libraries before running

import mqtt.*;
import controlP5.*;

ControlP5 cp5;
MQTTClient client;
Dashboard_view view = new Dashboard_view();
RecipeData api = new RecipeData();
Database db = new Database();

void setup() {
    textSize(30);
    textAlign(CENTER);
    cp5 = new ControlP5(this);
    // connect to the broker
    client = new MQTTClient(this);
    // connect to the broker and use a random string for clientid
    client.connect("mqtt://broker.mqttdashboard.com", "processing" + str(random(3)));
    
    delay(100);
    
    // refresh the dashboard with the information
    updateDashboardData();
}

public void settings() {
  size(900, 600);

}

// we don't really use the draw function as controlP5 does the work
void draw() {
    background(165, 165, 165);
    text("Recipe Sending System",450,45);
}
