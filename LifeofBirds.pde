//Name: Nancy Zhu
//Date: May 19, 2020
//Teacher: Ms. Basaraba
//Description: This program will display an animation of 4 birds, an ostrich, an owl, a kiwi, and a turkey. The kiwi and turkey will be in cages. The ostrich will free them. The owl will watch and then be scared away by the kiwi. The 3 remaining birds will then go to the next background, and the ending scene will play. 2 curtains will be drawn and my name will appear on screen.

//Declaration Section
int ostrichWalk = 1; //Determines which one of 2 possible ostrich positions is played
int ostrichX = 265; //Translates the ostrich
int kiwiX = 370; //Translates kiwi
int owlX = 410; //Translates owl along x axis
int owlY = 210; //Translates owl along y axis
int turkeyX = 610; //Translates turkey
int neckRotate = 0; //Rotates neck
int neckRotate2 = 0; //Doesn't trigger any of the other code to play
int rectWidth = 0; //Increases the size of ending scene rectangles
Boolean kiwiCage = true; //In the if statement to decide when the kiwi cage should be shown
Boolean turkeyStay = true; //Determines when to show turkey in myBackground();
Boolean neckDown = true; //A value that helps differentiate the ostrich's neck going up and down
Boolean pickUpCage = true; //Stops neck from continuously going up and disrupting the code
Boolean kiwiEscape = false; //plays kiwi escaping
Boolean neckDown2 = false; //Differentiates the neck going down the second time from the first time
Boolean neckStop = true; //Stops if statement from continuously making neckDown2 true
Boolean pickUpCage2 = false; //Differentiates the neck going up the second time from the first time
int kiwiScare = 1; //Determines which one of 2 possible kiwi positions is played
Boolean owlGo = false; //Determines when the if statement that runs the owl flying is played
int owlFly = 1; //Determines which one of 2 possible owl positions is played
Boolean ostrichWalkCont = false; //Tells the ostrich to continue walking
Boolean ending = false; //Determines when ending is played
Boolean endStay = false; //Keeps the end screen playing
Boolean kiwiB = false; //Plays kiwi in the background

//Main Program
void setup(){
  size(800, 500);
  smooth();
  strokeWeight(10); //Changes size of stroke so the for lopps draw less lines
  frameRate(600); //Runs program faster
}

//Animated Portion
void draw(){
  myBackground();
  ostrichToKiwi(); //Ostrich walking to kiwi
  freeKiwi(); //Ostrich frees kiwi
  owlScared(); //Owl flies away
  ostrichToTurkey(); //Ostrich walking to turkey
  freeTurkey(); //Ostrich frees turkey
  turkeyEscape(); //Turkey escapes
  ending(); //Ending scene plays
}

//Un-Animated Portion
void myBackground(){
  background(#B2F3FF);
  //Sun
  for(int i = 50; i >= 10; i-=5){
    stroke(#FFF979);
    ellipse(670, 85, i, i);
  }
  
  //Tree
  //Trunk
  for(int i = 75; i >= 0; i-=5){
    stroke(#7E5E3C);
    rect(450, 100, i, 250);
  }
  //Branches
  for(int i = 15; i >= 0; i-=5){
    rect(315, 250, 135, i);
  }
  for(int i = 10; i >= 0; i-=5){
    rect(315, 225, i, 25);
  }
  //Leaves
  for(int i = 320; i >= 0; i-=5){
    stroke(#23AD28);
    ellipse(480, 0, i, 250);
    stroke(#6FD32D);
    arc(480, 0, i, 250, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  for(int i = 60; i >= 0; i-=5){
    ellipse(320, 200, i, i);
    arc(320, 200, i, i, PI+HALF_PI, TWO_PI+HALF_PI);
  }
  for(int i = 200; i >= 0; i-=5){
    ellipse(800, 0, i, i);
  }
  for(int i = 350; i >= 0; i-=5){
    ellipse(0, 0, i, 300);
  }
  
  //Bushes
  for(int i = 375; i >= 0; i-=5){
    stroke(#23AD28);
    ellipse(130, 400, i, 200);
    ellipse(675, 400, i, 200);
    stroke(#6FD32D);
    arc(130, 400, i, 200, PI+HALF_PI, TWO_PI+HALF_PI);
    arc(675, 400, i, 200, PI+HALF_PI, TWO_PI+HALF_PI);
    stroke(#23AD28);
    ellipse(425, 400, i, 200);
    stroke(#6FD32D);
    arc(425, 400, i, 200, PI+HALF_PI, TWO_PI+HALF_PI);
  }
 
  //Ground
  for(int i = 100; i >= 0; i-=5){
    stroke(#BAE849);
    rect(0, 400, 800, i);
  }
  
  //Owl
  if(owlGo == false){
    //Owl feet
    for(int i = 5; i >= 0; i--){
      strokeWeight(1); //The feet are too small to have a larger stroke weight
      stroke(#F5CC97);
      rect(390, 235, i, 15); //Owl left leg
      rect(390, 245, 10, i); //Owl left foot
      rect(405, 235, i, 15); //Owl right leg
      strokeWeight(10); //Changes stroke weight back so the other code isn't affected
    }
    //Owl wing, body, and head
    for(int i = 40; i >=0; i-=5){
      pushMatrix(); //Stops rotate and translate from affecting other code
      translate(410, 210); //Moves origin so I can use rotate
      rotate(radians(45)); //Rotates body and wings
      stroke(#EADDCC);
      ellipse(0, 0, i, 65); //Owl body
      stroke(#937E63);
      ellipse(-25, 0, 15, i); //Owl wing
      popMatrix(); //Stops rotate and translate from affecting other code
      ellipse(425, 175, i, 30); //Owl head
    }
    //Owlface
    //Face
    for(int i = 25; i >=0; i--){
    strokeWeight(1); //These parts are too small to have a larger stroke weight
    stroke(#FAF1E6);
    arc(418, 175, 25, i, radians(45), radians(315), CHORD); //Owl left half of face
    arc(432, 175, i, 25, radians(-135), radians(135), CHORD); //Owl right half of face
    }
    //Eyes
    for(int i = 10; i >= 0; i--){
      stroke(0);
      ellipse(418, 175, 5, i); //Owl left eye
      ellipse(432, 175, 5, i); //Owl right eye
    }
    //Beak
    for(int i = 423; i <= 427; i++){
      stroke(#F5CC97);
      triangle(i, 175, 427, 175, 425, 185); //Owl beak  
    }
    //Foot
    for(int i = 405; i <= 415; i++){
      quad(i, 250, i, 245, 415, 245, 415, 250); //Owl right foot
      strokeWeight(10); //Changes stroke weight back so the other code isn't affected
    }
  }
  
  //Kiwi and cage
  //Kiwi
  if(kiwiB == true){
    strokeWeight(1); //These parts are too small to have a larger stroke weight
    pushMatrix(); //Stops translate and scale from affecting other code
    translate(kiwiX, 430); //Moves kiwi
    scale(-1, 1); //Flips kiwi
    
    for(int i = 10; i <= 30; i++){
    stroke(#DBC3C3);
    quad(0, i, -5, i, -4, 30, 0, 30); //Kiwi's right leg
    quad(-5, i, -10, i, -9, 30, -5, 30); //Kiwi's left leg
    }
    for(int i = -25; i <= -15; i++){
    triangle(28, i, 28, -15, 50, -10); //Kiwi's beak
    }
    for(int i = 30; i >= 0; i--){
    pushMatrix(); //Stops rotate from affecting other code
    rotate(radians(45));
    stroke(#6C5C42);
    ellipse(0, 0, i, 45); //Kiwi's body
    popMatrix(); //Stops rotate from affecting other code
    }
    for(int i = 20; i >= 0; i--){
    ellipse(20, -20, i, i); //Kiwi's head
    }
    for(int i = 3; i >= 0; i--){
    fill(0);
    ellipse(25, -20, i, 6); //Kiwi's eye
    }
    
    popMatrix(); //Stops translate and scale from affecting other code
    strokeWeight(10); //Changes stroke weight back so the other code isn't affected
  }
  
  //Cage
  if(kiwiCage == true){
    for(int i = 90; i >= 0; i-=5){
    stroke(255);
    arc(375, 450, i, 115, -PI, 0); //Cage
    }
    for(int i = 10; i >= 0; i--){
    strokeWeight(1); //These parts are too small to have a larger stroke weight
    arc(375, 393, i, 20, -PI, 0); //Cage tip 
    strokeWeight(10); //Changes stroke weight back so the other code isn't affected
    }
  }
  
  //Turkey and cage
  if(turkeyStay == true){
    //Turkey
    for(int i = 110; i >= 0; i-=5){
      stroke(#F0D9C2);
      arc(690, 405, 135, i, radians(225), radians(315)); //Turkey tail top
    }
    for(int i = 90; i >= 0; i-=5){
      stroke(#81582C);
      arc(690, 405, 115, i, radians(225), radians(315)); //Turkey tail bottom
      stroke(#52433C);
      ellipse(690, 415, i, 65); //Turkey body
    }
    for(int i = 450; i <= 465; i++){
      strokeWeight(1); //These parts are too small to have a larger stroke weight
      stroke(#81582C);
      quad(670, i, 685, i, 680, 465, 675, 465); //Turkey left leg
      quad(695, i, 710, i, 705, 465, 700, 465); //Turkey right leg
    }
    for(int i = 460; i <= 470; i++){
      stroke(#F2CDC4);
      triangle(660, 470, 680, 470, 682, i); //Turkey left foot
      triangle(685, 470, 705, 470, 707, i); //Turkey right foot
    }
    for(int i = 380; i <= 395; i++){
      stroke(#E87254);
      quad(655, i, 660, 395, 650, 395, 645, i); //Turkey neck
    }
    for(int i = 10; i >= 0; i--){
      ellipse(620, 375, 5, i); //Turkey wattle
    }
    for(int i = 610; i <= 620; i++){
      stroke(#FCCB7F);
      triangle(i, 370, 620, 373, 620, 368); //Turkey beak
      strokeWeight(10); //Changes stroke weight back so the other code isn't affected
    }
    for(int i = 30; i >= 0; i-=5){
      stroke(#92BBCE);
      ellipse(640, 370, i, 15); //Turkey head
    }
    //Cage and turkey eye
    for(int i = 5; i >= 0; i--){
      strokeWeight(1); //These parts are too small to have a larger stroke weight
      stroke(0);
      ellipse(640, 370, i, 10); //Turkey eyes
      stroke(200);
      rect(590, 275, 185, i); //Top of cage
      rect(590, 480, 185, i); //Bottom of cage
      rect(600, 280, i, 200); //First bar
      rect(620, 280, i, 200); //Second bar
      rect(640, 280, i, 200); //Third bar
      rect(660, 280, i, 200); //Fourth bar
      rect(680, 280, i, 200); //Fifth bar
      rect(700, 280, i, 200); //Sixth bar
      rect(720, 280, i, 200); //Seventh bar
      rect(740, 280, i, 200); //Eighth bar
      rect(760, 280, i, 200); //Ninth bar
    }
    //Lock
    for(int i = 10; i >= 0; i--){
      stroke(100);
      ellipse(600, 400, 5, i); //Lock
      strokeWeight(10); //Changes stroke weight back so the other code isn't affected
    }
  }
  
}

//Ostrich walking to kiwi
void ostrichToKiwi(){
  if(ostrichX <= 320){ //Only plays until ostrich reaches the kiwi
    noStroke();
    pushMatrix(); //Stops translate from affecting other code
    translate(ostrichX, 215); //Moves ostrich
    
    if(ostrichWalk == 1){ //The first possible ostrich position
    fill(#F7B652);
    triangle(0, 0, -15, -5, -15, 5); //Ostrich Beak
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    quad(-45, 10, -35, 10, -40, 110, -55, 110); //Ostrich neck
    ellipse(-30, 0, 40, 25); //Ostrich head
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    ellipse(-30, 0, 5, 10); //Ostrich eye
    
    }else if(ostrichWalk == -1){ //The other possible ostrich position
      
    fill(#F7B652);
    triangle(0, 0, -15, -5, -15, 5); //Ostrich Beak
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-174, 210, 4, 25); //Ostrich's right foot
    fill(#E3CEAE);
    quad(-45, 10, -35, 10, -40, 110, -55, 110); //Ostrich neck
    ellipse(-30, 0, 40, 25); //Ostrich head
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 55); //Ostrich's right leg top
    rect(-170, 210, 45, 10); //Ostrich's right leg bottom
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    ellipse(-30, 0, 5, 10); //Ostrich eye
    }
    
    popMatrix(); //Stops translate from affecting other code
    ostrichWalk*=-1; //Changes the ostrich's postion
    ostrichX+=10; //Moves ostrich
  }
}

//Ostrich picks up the cage to free kiwi
void freeKiwi(){
  if(ostrichX >= 320 && neckRotate <=  90 && neckDown == true && ostrichX < 400){ //Ostrich going down first time
  noStroke();
  
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(ostrichX - 67, 325); //Moves origin
    rotate(radians(neckRotate)); //Rotates neck
    fill(#F7B652);
    triangle(55, -110, 40, -115, 40, -105); //Ostrich Beak
    fill(#E3CEAE);
    quad(10, -100, 20, -100, 15, 0, 0, 0); //Ostrich neck
    ellipse(25, -110, 40, 25); //Ostrich head
    fill(#503D21);
    ellipse(25, -110, 5, 10); //Ostrich eye
    popMatrix(); //Stops translate and rotate from affecting other code
    
  pushMatrix(); //Stops translate from affecting other code
  translate(ostrichX - 10, 215); //Moves origin
    fill(#F7B652);
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    popMatrix(); //Stops translate from affecting other code
    
    neckRotate+=5; //Rotates the neck
  }
  
  if(neckRotate >=  90){
    neckDown = false; //Stops the above code from causing the neck to not go up
  }
  
  if(neckDown == false && neckRotate >= 30 && pickUpCage == true){ //Ostrich going up first time
    kiwiCage = false; //Stops kiwi cage from showing in background
    noStroke();
    
    //Kiwi Escaping 
    pushMatrix(); //Stops translate from affecting other code
    translate(kiwiX, 430); //Moves kiwi
    fill(#DBC3C3);
    quad(0, 10, -5, 10, -4, 30, 0, 30); //Kiwi's right leg
    quad(-5, 10, -10, 10, -9, 30, -5, 30); //Kiwi's left leg
    triangle(28, -25, 28, -15, 50, -10); //Kiwi's beak
    pushMatrix(); //Stops rotate from affecting other code
    rotate(radians(45));
    fill(#6C5C42);
    ellipse(0, 0, 30, 45); //Kiwi's body
    popMatrix(); //Stops rotate from affecting other code
    ellipse(20, -20, 20, 20); //Kiwi's head
    fill(0);
    ellipse(25, -20, 3, 6); //Kiwi's eye
    popMatrix(); //Stops translate from affecting other code
    kiwiX+=5; //Moves kiwi
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(ostrichX - 67, 325); //Moves origin
    rotate(radians(neckRotate-5)); //Rotates neck
    fill(#F7B652);
    triangle(55, -110, 40, -115, 40, -105); //Ostrich Beak
    fill(#E3CEAE);
    quad(10, -100, 20, -100, 15, 0, 0, 0); //Ostrich neck
    ellipse(25, -110, 40, 25); //Ostrich head
    fill(#503D21);
    ellipse(25, -110, 5, 10); //Ostrich eye
    //Cage
    fill(255);
    arc(55, -110, 20, 10, HALF_PI, PI+HALF_PI); //Cage tip
    arc(115, -110, 125, 100, HALF_PI, PI+HALF_PI); //Cage
    popMatrix(); //Stops translate and rotate from affecting other code
    
  pushMatrix(); //Stops translate from affecting other code
  translate(ostrichX - 10, 215); //Moves origin
    fill(#F7B652);
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    popMatrix(); //Stops translate from affecting other code
    
    neckRotate-=5; //Rotates the neck
 
  }
  
  if(neckDown == false && neckRotate <= 30 && neckStop == true){
    pickUpCage = false; //Stops above code from running again
     neckDown2 = true; //Tells the code below to start
     neckStop = false; //Prevents this code from playing again
    }
  
  if(neckRotate <=  90 && neckDown2 == true){ //Ostrich going down second time
  noStroke();
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(ostrichX - 67, 325); //Moves origin
    rotate(radians(neckRotate)); //Rotates neck
    fill(#F7B652);
    triangle(55, -110, 40, -115, 40, -105); //Ostrich Beak
    fill(#E3CEAE);
    quad(10, -100, 20, -100, 15, 0, 0, 0); //Ostrich neck
    ellipse(25, -110, 40, 25); //Ostrich head
    fill(#503D21);
    ellipse(25, -110, 5, 10); //Ostrich eye
    //Cage
    fill(255);
    arc(55, -110, 20, 10, HALF_PI, PI+HALF_PI); //Cage tip
    arc(115, -110, 125, 100, HALF_PI, PI+HALF_PI); //Cage
    popMatrix(); //Stops translate and rotate from affecting other code
    
  pushMatrix(); //Stops translate from affecting other code
  translate(ostrichX - 10, 215); //Moves origin
    fill(#F7B652);
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    popMatrix(); //Stops translate from affecting other code
    
    neckRotate+=5; //Rotates the neck
    
    //Kiwi walking
    pushMatrix(); //Stops translate from affecting other code
    translate(kiwiX, 430); //Moves kiwi
    fill(#DBC3C3);
    quad(0, 10, -5, 10, -4, 30, 0, 30); //Kiwi's right leg
    quad(-5, 10, -10, 10, -9, 30, -5, 30); //Kiwi's left leg
    triangle(28, -25, 28, -15, 50, -10); //Kiwi's beak
    pushMatrix(); //Stops rotate from affecting other code
    rotate(radians(45));
    fill(#6C5C42);
    ellipse(0, 0, 30, 45); //Kiwi's body
    popMatrix(); //Stops rotate from affecting other code
    ellipse(20, -20, 20, 20); //Kiwi's head
    fill(0);
    ellipse(25, -20, 3, 6); //Kiwi's eye
    popMatrix(); //Stops translate from affecting other code
    kiwiX+=5; //Moves kiwi
  }
  
  if(neckRotate >=  90 && neckDown2 == true){
    neckDown2 = false; //Stops above code from playing again
    pickUpCage2 = true; //Plays the code below
  }

  if(pickUpCage2 == true && neckRotate >= 0){ //Ostrich going up second time
    kiwiCage = true; //Shows kiwi cage again
    noStroke();
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(ostrichX - 67, 325); //Moves origin
    rotate(radians(neckRotate-5)); //Rotates neck
    fill(#F7B652);
    triangle(55, -110, 40, -115, 40, -105); //Ostrich Beak
    fill(#E3CEAE);
    quad(10, -100, 20, -100, 15, 0, 0, 0); //Ostrich neck
    ellipse(25, -110, 40, 25); //Ostrich head
    fill(#503D21);
    ellipse(25, -110, 5, 10); //Ostrich eye
    popMatrix(); //Stops translate and rotate from affecting other code
    
  pushMatrix(); //Stops translate from affecting other code
  translate(ostrichX - 10, 215); //Moves origin
    fill(#F7B652);
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    popMatrix(); //Stops translate from affecting other code
    
    neckRotate-=5; //Rotates the neck
    
    //Kiwi scares owl away
    if(kiwiScare == 1){
    pushMatrix(); //Stops translate and scale from affecting other code
    translate(kiwiX, 430); //Moves kiwi
    scale(-1, 1); //Flips kiwi
    fill(#DBC3C3);
    quad(0, 10, -5, 10, -4, 30, 0, 30); //Kiwi's right leg
    quad(-5, 10, -10, 10, -9, 30, -5, 30); //Kiwi's left leg
    triangle(28, -25, 28, -15, 50, -10); //Kiwi's beak
    pushMatrix(); //Stops rotate from affecting other code
    rotate(radians(45));
    fill(#6C5C42);
    ellipse(0, 0, 30, 45); //Kiwi's body
    popMatrix(); //Stops rotate from affecting other code
    ellipse(20, -20, 20, 20); //Kiwi's head
    fill(0);
    ellipse(25, -20, 3, 6); //Kiwi's eye
    popMatrix(); //Stops translate from affecting other code
    kiwiScare*=-1; //Changes the position shown
    }else if (kiwiScare == -1){
      pushMatrix(); //Stops translate and scale from affecting other code
    translate(kiwiX, 430); //Moves kiwi
    scale(-1, 1); //Flips kiwi
    fill(#DBC3C3);
    quad(0, 10, -5, 10, -4, 30, 0, 30); //Kiwi's right leg
    quad(-5, 10, -10, 10, -9, 30, -5, 30); //Kiwi's left leg
    triangle(28, -20, 28, -25, 50, -20); //Kiwi's beak top
    triangle(28, -20, 28, -15, 50, -10); //Kiwi's beak bottom
    pushMatrix(); //Stops rotate from affecting other code
    rotate(radians(45));
    fill(#6C5C42);
    ellipse(0, 0, 30, 45); //Kiwi's body
    popMatrix(); //Stops rotate from affecting other code
    ellipse(20, -20, 20, 20); //Kiwi's head
    fill(0);
    ellipse(25, -20, 3, 6); //Kiwi's eye
    popMatrix(); //Stops translate from affecting other code
    //Text
    fill(0);
    text("squawk", 500, 350); //Shows that kiwi is squawking
    owlGo = true; //Causes the owl to fly away
    kiwiScare*=-1; //Changes the position shown
    
    if(neckRotate <= 0){
      kiwiB = true; //Makes kiwi play in the background again
      ostrichWalkCont = true; //Makes ostrich walk
      neckRotate = 1; //Fixes neck for next time
      neckDown2 = false; //Stops above code from playing again
    }
    }   
  }
}

//Owl flying away
void owlScared(){
  if(owlGo == true && owlX <= 850 && owlY >= -50){ //Only plays after kiwi squawks
  noStroke();
  pushMatrix(); //Stops translate and rotate from affecting other code
  translate(owlX, owlY); //Moves owl
  rotate(radians(45)); //Rotates owl
  
  if(owlFly == 1){ //The first possible owl position 
    fill(#FAF1E6);
    ellipse(5, -15, 140, 40); //Owl wings
    fill(#EADDCC);
    ellipse(0, 0, 50, 75); //Owl body
    fill(#937E63);
    ellipse(0, -50, 50, 40); //Owl head
    fill(#FAF1E6);
    arc(-8, -50, 25, 25, radians(45), radians(315), CHORD); //Owl left half of face
    arc(8, -50, 25, 25, radians(-135), radians(135), CHORD); //Owl right half of face
    fill(0);
    ellipse(-8, -50, 5, 10); //Owl left eye
    ellipse(8, -50, 5, 10); //Owl right eye
    fill(#F5CC97);
    triangle(-2, -50, 2, -50, 0, -40); //Owl beak
    owlFly*=-1; //Switches position
  }else if(owlFly == -1){ //The second possible owl position
    fill(#FAF1E6);
    ellipse(0, -15, 100, 40); //Owl wings
    fill(#EADDCC);
    ellipse(0, 0, 50, 75); //Owl body
    fill(#937E63);
    arc(-55, -15, 40, 40, radians(-45), radians(135)); //Owl left wing
    arc(55, -15, 40, 40, radians(45), radians(225)); //Owl right wing
    ellipse(0, -50, 50, 40); //Owl head
    fill(#FAF1E6);
    arc(-8, -50, 25, 25, radians(45), radians(315), CHORD); //Owl left half of face
    arc(8, -50, 25, 25, radians(-135), radians(135), CHORD); //Owl right half of face
    fill(0);
    ellipse(-8, -50, 5, 10); //Owl left eye
    ellipse(8, -50, 5, 10); //Owl right eye
    fill(#F5CC97);
    triangle(-2, -50, 2, -50, 0, -40); //Owl beak
    owlFly*=-1; //Switches position
  }
  
  popMatrix(); //Stops translate from affecting other code
  owlX+=10;
  owlY-=10;
  }
}

//Ostrich walks to turkey
void ostrichToTurkey(){
  if(ostrichWalkCont == true && ostrichX <= 555){
    noStroke();
    pushMatrix(); //Stops translate from affecting other code
    translate(ostrichX, 215); //Moves ostrich
    
    if(ostrichWalk == 1){ //The first possible ostrich position
    fill(#F7B652);
    triangle(0, 0, -15, -5, -15, 5); //Ostrich Beak
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    quad(-45, 10, -35, 10, -40, 110, -55, 110); //Ostrich neck
    ellipse(-30, 0, 40, 25); //Ostrich head
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    ellipse(-30, 0, 5, 10); //Ostrich eye
    
    }else if(ostrichWalk == -1){ //The other possible ostrich position
      
    fill(#F7B652);
    triangle(0, 0, -15, -5, -15, 5); //Ostrich Beak
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-174, 210, 4, 25); //Ostrich's right foot
    fill(#E3CEAE);
    quad(-45, 10, -35, 10, -40, 110, -55, 110); //Ostrich neck
    ellipse(-30, 0, 40, 25); //Ostrich head
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 55); //Ostrich's right leg top
    rect(-170, 210, 45, 10); //Ostrich's right leg bottom
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    ellipse(-30, 0, 5, 10); //Ostrich eye
    }
    
    popMatrix(); //Stops translate from affecting other code
    ostrichWalk*=-1; //Changes the ostrich's postion
    ostrichX+=10; //Moves ostrich
  }
}

//Ostrich breaks lock
void freeTurkey(){
  if(ostrichX >= 555 && neckRotate2 <= 100){
    noStroke();
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(ostrichX - 67, 325); //Moves origin
    rotate(radians(neckRotate2)); //Rotates neck
    fill(#F7B652);
    triangle(55, -110, 40, -115, 40, -105); //Ostrich Beak
    fill(#E3CEAE);
    quad(10, -100, 20, -100, 15, 0, 0, 0); //Ostrich neck
    ellipse(25, -110, 40, 25); //Ostrich head
    fill(#503D21);
    ellipse(25, -110, 5, 10); //Ostrich eye
    popMatrix(); //Stops translate and rotate from affecting other code
    
  pushMatrix(); //Stops translate from affecting other code
  translate(ostrichX - 10, 215); //Moves origin
    fill(#F7B652);
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    popMatrix(); //Stops translate from affecting other code
    
    neckRotate2+=5; //Rotates the neck
  }
}

//Turkey leaves cage
void turkeyEscape(){
  if(neckRotate2 >= 100){
    turkeyStay = false; //Stops turkey from being displayed in the background
    noStroke();
    //Turkey walking
    pushMatrix(); //Stops translate form affecting other code
    translate(turkeyX, 370); //Moves turkey
    fill(#F0D9C2);
    arc(80, 35, 145, 120, radians(225), radians(315)); //Turkey tail top
    fill(#81582C);
    arc(80, 35, 125, 100, radians(225), radians(315)); //Turkey tail bottom
    quad(60, 80, 75, 80, 70, 95, 65, 95); //Turkey left leg
    quad(85, 80, 100, 80, 95, 95, 90, 95); //Turkey right leg
    fill(#F2CDC4);
    triangle(50, 100, 70, 100, 72, 90); //Turkey left foot
    triangle(75, 100, 95, 100, 97, 90); //Turkey right foot
    fill(#E87254);
    quad(45, 10, 50, 15, 40, 25, 35, 10); //Turkey neck
    ellipse(10, 5, 5, 10); //Turkey wattle
    fill(#52433C);
    ellipse(80, 45, 100, 75); //Turkey body
    fill(#FCCB7F);
    triangle(0, 0, 10, 3, 10, -2); //Turkey beak
    fill(#92BBCE);
    ellipse(30, 0, 40, 25); //Turkey head
    fill(0);
    ellipse(30, 0, 5, 10); //Turkey eyes
    popMatrix(); //Stops translate form affecting other code
    turkeyX--;
    //Cage
    //The cage is in the foreground so it has to go after the turkey
    fill(200);
    rect(590, 275, 185, 5); //Top of cage
    rect(590, 480, 185, 5); //Bottom of cage
    rect(600, 280, 5, 200); //First bar
    rect(620, 280, 5, 200); //Second bar
    rect(640, 280, 5, 200); //Third bar
    rect(660, 280, 5, 200); //Fourth bar
    rect(680, 280, 5, 200); //Fifth bar
    rect(700, 280, 5, 200); //Sixth bar
    rect(720, 280, 5, 200); //Seventh bar
    rect(740, 280, 5, 200); //Eighth bar
    rect(760, 280, 5, 200); //Ninth bar
    
    //Ostrich
    noStroke();
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(ostrichX - 67, 325); //Moves origin
    rotate(radians(neckRotate2)); //Rotates neck
    fill(#F7B652);
    triangle(55, -110, 40, -115, 40, -105); //Ostrich Beak
    fill(#E3CEAE);
    quad(10, -100, 20, -100, 15, 0, 0, 0); //Ostrich neck
    ellipse(25, -110, 40, 25); //Ostrich head
    fill(#503D21);
    ellipse(25, -110, 5, 10); //Ostrich eye
    popMatrix(); //Stops translate and rotate from affecting other code
    
    pushMatrix(); //Stops translate from affecting other code
    translate(ostrichX - 10, 215); //Moves origin
    fill(#F7B652);
    rect(-150, 255, 25, 4); //Ostrich's left foot
    rect(-125, 255, 25, 4); //Ostrich's right foot
    fill(#E3CEAE);
    rect(-150, 165, 10, 90); //Ostrich's left leg
    rect(-125, 165, 10, 90); //Ostrich's right leg
    
    pushMatrix(); //Stops translate and rotate from affecting other code
    translate(-185, 120); //Changes origin
    rotate(radians(30)); //Makes the tail rotated
    fill(#B4A389);
    arc(0, 0, 25, 50, 0, radians(350), CHORD); //Ostrich tail
    popMatrix(); //Stops translate and rotate from affecting other code
    
    fill(#503D21);
    triangle(-40, 110, -60, 150, -65, 110); //Base of ostrich neck
    ellipse(-120, 130, 130, 100); //Ostrich body
    popMatrix(); //Stops translate from affecting other code
    
    turkeyX-=10; //Moves turkey
    ending = true; //Plays ending
  }
}

//Ending scene
void ending(){
    noStroke();
    fill(0);
  if(ending == true && rectWidth <= 400){
    rect(0, 0, rectWidth, 500); //One of the ending scene rectangles
    pushMatrix(); //Stops translate scale from affecting other code
    translate(800, 0); //Moves origin
    scale(-1, 1); //Flips the rectangle
    rect(0, 0, rectWidth, 500); //The other ending scene rectangle
    popMatrix(); //Stops scale from affecting other code
    rectWidth+=10; //Changes width of rectangles
  }
  if(rectWidth == 400){
    endStay = true; //Plays end screen
  }
  if(endStay == true){
    rect(0, 0, 800, 500); //Makes ending scene background black
    fill(255);
    PFont font1 = loadFont("SegoeUI-Light-48.vlw");
    textFont(font1);
    text("Created by", 290, 170); //Displays the word Merry
    PFont font2 = loadFont("SegoeUI-Light-80.vlw");
    textFont(font2);
    text("Nancy Zhu", 210, 270); //Displays the word Merry
  }
}
