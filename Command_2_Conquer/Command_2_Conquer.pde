color kleurP1 = 0, 
  kleurP2 = 0, 
  groen = #00FF00, 
  blauw = #00FFFF, 
  rood = #FF0000, 
  geel = #FFFF00, 
  paars = #800080, 
  zachtOranje = #ffae5b, 
  wit = 255, 
  zwart = 0, 
  lichtGrijs = 175, 
  donkerGrijs = 100, 
  kleurSpeler;

int oorsprong = 0, 
  match = 10000, 
  eenVakje, 
  totaalBlokken, 
  stroke = 1, 
  tekstGrootte1 = 19,
  tekstGrootte2 = 15,
  tekstGrootte3 = 30,
  voledigscherm = 0, 
  blokgroote = 25, 
  aantalblokken, 
  scoreP1, 
  scoreP2,
  veldenBezet, 
  aantalBommen, 
  breedteButton, 
  delay = 300, 
  nietFsBreedte = 800, 
  nietFsHoogte = 450, 
  bar = 22, 
  randje = 10,
  doorzichtig = 109, 
  hoogteButton,
  xBeginSpeelveld,
  yBeginSpeelveld;
int[] status;
int speelveld[][];

float driehoekY = 0, 
  driehoekX, 
  driehoekGrootte, 
  button1 = 0.25, 
  button2 = 0.5, 
  button3 = 0.75,
  yButtons = 0.75, 
  xDriehoek = 0.73,
  breedteOmtrek1 = 0.6, 
  breedteOmtrek2 = 0.96, 
  hoogteOmtrek1 = 0.39, 
  hoogteOmtrek2 = 0.10,
  stroke2,
  marge = 0.06,
  hoogteOmleining = 0.16,
  xSpelerTekst = 0.73,
  yBommen = 0.28,
  ySpelerTekst1 = 0.07,
  dashbordX = 0.70,
  dashbordY = 0.05,
  dashbordHoogte = 0.3,
  dashbordBreedte = 0.25,
  ySpelerTekst2 = 0.14;

boolean startscherm = false, 
  gamemodescherm = false, 
  levelscherm = false, 
  eindscherm = false, 
  player1 = false, 
  player2 = false;  
boolean[] vakje, bommen;

PImage achtergrond, achtergrond2, achtergrond3, achtergrond4, achtergrond5, bom;

void setup() {
  breedteButton = width / 5;
  hoogteButton = height / 7;
  achtergrond = loadImage("achtergrond.jpg");
  achtergrond2 = loadImage("achtergrond2.jpeg");
  achtergrond3 = loadImage("achtergrond3.jpeg");
  achtergrond4 = loadImage("achtergrond4.jpg");
  achtergrond5 = loadImage("achtergrond5.jpg");
  bom = loadImage("bom.png");

  size(300, 300);

  voledigscherm();
}

void draw() {
  strokeWeight(stroke);
  textAlign(CENTER, CENTER);
  breedteButton = width / 5;
  hoogteButton = height / 7;

  if (startscherm) {
    image(achtergrond3, oorsprong, oorsprong, width, height);
    omleiningEnTekst(breedteOmtrek1, hoogteOmtrek1, "Command 2 Conquer");
    buttonTekenen(rood, button1, "Stoppen");
    buttonTekenen(groen, button3, "Starten");
  }

  if (gamemodescherm) {
    image(achtergrond2, oorsprong, oorsprong, width, height);
    omleiningEnTekst(breedteOmtrek1, hoogteOmtrek2, "Gamemode selecteren:");
    buttonTekenen(zachtOranje, button1, "5 bij 5");
    buttonTekenen(zachtOranje, button2, "7 bij 7");
    buttonTekenen(zachtOranje, button3, "10 bij 10");
  }

  if (levelscherm) {
    dashbord();
    if (eindespel()) {
      delay(delay);
      eindscherm = true;
      levelscherm = false;
    }
  }
  if (eindscherm) {
    image(achtergrond4, oorsprong, oorsprong, width, height);
    String uitkomst;
    if (scoreP1 > scoreP2) {
      uitkomst =("Speler 1 heeft gewonnen met " + (scoreP1 - scoreP2) + " punten verschil");
    } else if (scoreP1 == scoreP2) {
      uitkomst = ("Gelijkspel");
    } else {
      uitkomst = ("Speler 2 heeft gewonnen met " + (scoreP2 - scoreP1) + " punten verschil");
    }
    omleiningEnTekst(breedteOmtrek2, hoogteOmtrek2, uitkomst);
    buttonTekenen(rood, button1, "Stoppen");
    buttonTekenen(groen, button3, "Nogmaals");
  }
}


void mouseClicked() {

  if (voledigscherm == 0) {
    if (opVlak(button1)) {
      voledigscherm = 1;
      setup();
    }
    if (opVlak(button3)) {
      voledigscherm = 2;
      setup();
    }
  } else if (startscherm) {
    if (opVlak(button1)) {
      startscherm = false;
      exit();
    }
    if (opVlak(button3)) {
      gamemodescherm = true;
      startscherm = false;
    }
  } else if (gamemodescherm) {
    if (opVlak(button1)) {
      aantalblokken = 5;
      speelveldVoorberijden();
    }
    if (opVlak(button2)) {
      aantalblokken = 7;
      speelveldVoorberijden();
    }
    if (opVlak(button3)) {
      aantalblokken = 10;
      speelveldVoorberijden();
    }
  } else if (levelscherm) {
    muisActiesSpel();
  } else if (eindscherm) {
    if (opVlak(button1)) {
      eindscherm = false;
      exit();
    }
    if (opVlak(button3)) {
      gamemodescherm = true;
      eindscherm = false;
    }
  }
}
