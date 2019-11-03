void voledigscherm() {
  if (voledigscherm == 0) {
    background(zwart);
    textAlign(CENTER, CENTER);
    omleiningEnTekst(breedteOmtrek2, hoogteOmtrek2, "Op voledig scherm spelen?");

    buttonTekenen(rood, button1, "Nee");

    buttonTekenen(groen, button3, "Ja");
  }
  if (voledigscherm == 1) {
    surface.setSize(nietFsBreedte, nietFsHoogte);
    startscherm = true;
  }
  if (voledigscherm == 2) {
    surface.setSize(displayWidth, displayHeight - bar);
    surface.setLocation(oorsprong, oorsprong);
    surface.setAlwaysOnTop(true);
    startscherm = true;
  }
}

boolean eindespel() {
  int levelafgelopen = 0;
  if ((veldenBezet + aantalBommen == (totaalBlokken))) { 
    return true;
  }
  while (levelafgelopen < (totaalBlokken)) {
    if (vakje[levelafgelopen]) {
      levelafgelopen++;
    } else return false;
  }
  return true;
}

boolean opVlak(float x) {
  boolean X = (mouseX > width * x - breedteButton / 2 && mouseX < width * x + breedteButton/2);
  boolean Y = (mouseY > height * yButtons - hoogteButton / 2 && mouseY < height * yButtons + hoogteButton/2);
  if (X && Y) {
    return true;
  } else return false;
}

color kleurPlayer() {
  float kleurCode = random(0, 5);
  if (kleurCode <= 1) {
    kleurSpeler = geel;
  }
  if (kleurCode > 1 && kleurCode <= 2) {
    kleurSpeler = rood;
  }
  if (kleurCode > 2 && kleurCode <= 3) {
    kleurSpeler = groen;
  }
  if (kleurCode > 3 && kleurCode <= 4) {
    kleurSpeler = blauw;
  }
  if (kleurCode > 4) {
    kleurSpeler = paars;
  }
  return kleurSpeler;
}

int bomlocaties() {
  return floor(random(0, totaalBlokken));
}

void spelerdood() {
  player1 = !player1;
  player2 = !player2;
}

void beginnendespeler() {
  float beginner = random(0, 1);
  while (player1 == player2) {
    if (beginner <= 0.5) {
      player1 = true;
    }
    if (beginner > 0.5) {
      player2 = true;
    }
  }
}
