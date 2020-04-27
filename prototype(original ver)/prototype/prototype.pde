// We're going to draw a circle which moves across 
// the screen. Here we create two variables to store
// a position.  Because they are global - declared 
// outside of setup() and loop() - we can think 
// of them as a permanent place to store numbers.
PImage my_img;
int pic;
Button_c open;
Button_c sign;
Button_c fruit;
Button_c calender;
Button_c search;
Button_c back;
Button_c addItem;
Button_c ok;
Button_c searchItem;
Button_c inputWord;
Button_c startSearch;
Button_c setting;
Button_c selfReport;
Button_c resign;
Button_c backSetting;
// This code runs once, when you run the sketch.
void setup() {
  
  size( 650, 900 );
  my_img = loadImage("OPEN.JPG");
  pic = 0;
  open = new Button_c(400,450,50);
  sign = new Button_c(400,550,50);
  fruit = new Button_c(280,280,50);
  calender = new Button_c(100,800,50);
  search = new Button_c(300,800,50);
  back = new Button_c(50,50,50);
  addItem = new Button_c(600,50,50);
  ok = new Button_c(400,450,50);
  searchItem = new Button_c(120,120,50);
  inputWord = new Button_c(200,120,50);
  startSearch = new Button_c(450,100,50);
  setting = new Button_c(500,800,50);
  selfReport = new Button_c(100,500,50);
  resign = new Button_c(600,180,50);
  backSetting = new Button_c(100,50,50);
}


// This code is called iteratively (again and again)
// once setup() has finished.
void draw() {

  image( my_img, 0 , 0 );
  if(pic == 0){open.draw();}
  if(pic == 1){sign.draw();}
  if(pic == 2){
    fruit.draw();
    calender.draw();
    search.draw();
    setting.draw();
  }
  if( pic == 3 ){addItem.draw();back.draw();}
  if( pic == 4 ){back.draw();}
  if( pic == 5 ){searchItem.draw();back.draw();}
  if( pic == 6 ){ok.draw();}
  if( pic == 7 ){back.draw();}
  if( pic == 8 ){inputWord.draw();back.draw();}
  if( pic == 9 ){startSearch.draw();back.draw();}
  if( pic == 10){back.draw();}
  if( pic == 11){selfReport.draw();resign.draw();back.draw();}
  if( pic == 12){backSetting.draw();}
}

void mouseReleased() {
  
  if( open.checkClick()&&(pic == 0) ) {
     my_img = loadImage("SIGN.JPG");
     pic = 1;
  }
  if( sign.checkClick()&&(pic == 1) ) {
     my_img = loadImage("HOME.JPG");
     pic = 2;
  }
  if( fruit.checkClick() &&(pic == 2)) {
     my_img = loadImage("FRUIT.JPG");
     pic = 3;
  }
  if( calender.checkClick()&&(pic == 2)) {
     my_img = loadImage("CALENDER.JPG");
     pic = 4;
  }
  if( search.checkClick()&&(pic == 2)) {
     my_img = loadImage("SEARCH.JPG");
     pic = 5;
  }
  if( back.checkClick() ) {
     my_img = loadImage("HOME.JPG");
     pic = 2;
  }  
  if( addItem.checkClick()&&(pic == 3) ) {
     my_img = loadImage("FRUIT1.JPG");
     pic = 6;
  }  
  if( ok.checkClick()&&(pic == 6) ) {
     my_img = loadImage("FRUIT2.JPG");
     pic = 7;
  } 
  if( searchItem.checkClick()&&(pic == 5) ) {
     my_img = loadImage("SEARCH1.JPG");
     pic = 8;
  }  
  if( inputWord.checkClick()&&(pic == 8) ) {
     my_img = loadImage("SEARCH2.JPG");
     pic = 9;
  }  
  if( startSearch.checkClick()&&(pic == 9) ) {
     my_img = loadImage("SEARCH3.JPG");
     pic = 10;
  } 
  if( setting.checkClick()&&(pic == 2) ) {
     my_img = loadImage("SETTING.JPG");
     pic = 11;
  }
  if( selfReport.checkClick()&&(pic == 11) ) {
     my_img = loadImage("SELFREPORT.JPG");
     pic = 12;
  }
  if( backSetting.checkClick()&&(pic == 12) ) {
     my_img = loadImage("SETTING.JPG");
     pic = 11;
  }
  if( resign.checkClick()&&(pic == 11) ) {
     my_img = loadImage("SIGN.JPG");
     pic = 1;
  }
}
