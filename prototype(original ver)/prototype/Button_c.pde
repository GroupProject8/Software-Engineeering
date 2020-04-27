class Button_c {
  
  int x;        // Variables to store position on screen.
  int y;
  int diameter; // Variable for the diameter of our button.
  
  // Constructor / initialiser
  // This function is used when creating an
  // instance of your class, and should set up
  // any class variables
  Button_c( int set_x, int set_y, int set_d ) {
    
    // Initialise class variables.
    x = set_x;
    y = set_y;
    diameter = set_d;
    
  }
  
  void draw() {
     stroke( 0, 0, 0 );      // Draw with a black outline.
     strokeWeight( 4 );      // Make the outline thick.
     fill( 255, 255, 255 );  // Fill with colour white.
     
     // Draw an ellipse, using the class variables.
     ellipse( x, y, diameter, diameter );
  }
  
  // Returns true if the mouse cursor is within the
  // circle we are drawing.
  boolean checkClick() {
     float distance;
     
     // First, use built in function to calculate distance.
     // Note, mouseX and mouseY are global.
     distance = dist( mouseX, mouseY, x, y );
     
     // Distance can be negative!  Nice bug potential here.
     distance = abs( distance );
     
     // If the distance is less than the radius, we were
     // clicked. 
     if( distance < ( diameter / 2 ) ) {
        return true; 
     } 
     
     // If the above fails, we were not clicked.
     return false;
  }
  
}
