void speelveldVoorberijden() {
  levelscherm = true;
  gamemodescherm = false;
  veldenBezet = 0;
  stroke2 = 1 + width*0.0005;
  scoreP1 = 0;
  scoreP2 = 0;
  xBeginSpeelveld = width/17;
  yBeginSpeelveld = height/17;
  totaalBlokken = aantalblokken*aantalblokken;
  eenVakje = width/2/aantalblokken;
  speelveld = new int[aantalblokken * aantalblokken][2];
  vakje = new boolean[aantalblokken * aantalblokken];
  bommen = new boolean [aantalblokken * aantalblokken];
  status = new int [aantalblokken * aantalblokken];
  int bom = 0;
  while (bom < aantalblokken) {
    int bomplek = bomlocaties();
    if (!bommen[bomplek]) {
      bommen[bomplek] = true;
      bom++;
    }
  }
  int blok = 0;
  for (int j = 0; j < aantalblokken; j++) {
    for (int i = 0; i < aantalblokken; i++) {
      speelveld[blok][0] = xBeginSpeelveld + j * eenVakje;
      speelveld[blok][1] = yBeginSpeelveld + i * eenVakje;
      blok++;
    }
  }
  image(achtergrond, oorsprong, oorsprong, width, height);
  image(achtergrond5, speelveld[0][0], speelveld[0][1], width/2, width/2);
  for (int i = 0; i < speelveld.length; i++) {
    noFill();
    strokeWeight(stroke2);
    status[i] = 0;
    rect(speelveld[i][0], speelveld[i][1], eenVakje, eenVakje);
  }
  beginnendespeler();
  aantalBommen = aantalblokken;

  int kleurgoed =0;
  while (kleurgoed < 1) {
    if (kleurP1 == kleurP2) {
      kleurP1 = kleurPlayer();
      kleurP2 = kleurPlayer();
    } else {
      kleurgoed++;
    }
  }
}



void muisActiesSpel() {
  for (int i = 0; i < speelveld.length; i++) {
    boolean speelveldX = mouseX > speelveld[i][0] && mouseX < speelveld[i][0] + eenVakje;
    boolean speelveldY = mouseY > speelveld[i][1] && mouseY < speelveld[i][1] + eenVakje;
    if (speelveldX && speelveldY && !vakje[i]) {
      veldenBezet++;
      if (bommen[i]) {
        vakje[i] = true;
        fill(0);
        image(bom, speelveld[i][0], speelveld[i][1], eenVakje, eenVakje);
        if (player1) {
          scoreP1--;
        }
        if (player2) {
          scoreP2--;
        }
        spelerdood();
        aantalBommen--;
      } else {
        vakje[i] = true;
        boolean naastelkaarPlus = i < totaalBlokken - 1 && (!((i+1) % aantalblokken == 0));
        boolean naastelkaar2Plus = i < totaalBlokken - 1 - aantalblokken;
        boolean naastelkaarMin = i > 0 && (!(i % aantalblokken == 0));
        boolean naastelkaar2Min = i >= 0 + aantalblokken;

        if (player1) {
          match = 1;
          status[i] = 1;
          fill(kleurP1, doorzichtig); 
          scoreP1+=1;

          if (naastelkaarMin && (status[i-1] == 1)) {
            scoreP1+=1;
          }
          if (naastelkaar2Min && (status[i - aantalblokken] == 1)) {
            scoreP1+=1;
          }
          if (naastelkaarPlus && (status[i+1] == 1)) {
            scoreP1+=1;
          }
          if (naastelkaar2Plus && (status[i + aantalblokken] == 1)) {
            scoreP1+=1;
          }
        }
        if (player2) {
          match = 2;
          status[i] = 2;
          fill(kleurP2, doorzichtig); 
          scoreP2+=1;
          if (naastelkaarMin && (status[i-1] == 2)) {
            scoreP2+=1;
          }
          if (naastelkaar2Min && (status[i - aantalblokken] == 2)) {
            scoreP2+=1;
          }
          if (naastelkaarPlus && (status[i+1] == 2)) {
            scoreP2+=1;
          }
          if (naastelkaar2Plus && (status[i + aantalblokken] == 2)) {
            scoreP2+=1;
          }
        }

        rect(speelveld[i][0], speelveld[i][1], eenVakje, eenVakje);
      }
    }
  }
}
