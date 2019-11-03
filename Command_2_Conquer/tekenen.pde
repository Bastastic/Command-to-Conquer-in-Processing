void buttonTekenen(color kleur, float x, String woord) {
  fill(kleur);
  rect(width * x - breedteButton / 2, height * yButtons  - hoogteButton / 2, breedteButton, hoogteButton, randje);
  fill(zwart);
  textSize(height / tekstGrootte1);
  text(woord, width * x, height * yButtons);
}

void omleiningEnTekst(float size, float y, String woord) {
  textSize(height / tekstGrootte2);
  fill(donkerGrijs);
  rect(width * ((1 - size) / 2), height*y, width*size, height*hoogteOmleining, randje);
  fill(wit);
  text(woord, width/2, height*(y + marge));
}

void dashbord() {
  textSize(width / tekstGrootte3);
  fill(lichtGrijs);
  rect(width * dashbordX, height * dashbordY, width * dashbordBreedte, height * dashbordHoogte, randje);
  fill(wit);
  textAlign(LEFT, TOP);
  fill(kleurP1);
  text("Speler 1: " + scoreP1, width * xSpelerTekst, height * ySpelerTekst1);
  fill(kleurP2);
  text("Speler 2: " + scoreP2, width * xSpelerTekst, height * ySpelerTekst2);
  fill(zwart);
  text("Bommen: " + aantalBommen, width * xSpelerTekst, height * yBommen);

  if (player1) {
    driehoekY = height * ySpelerTekst1;
  }
  if (player2) {
    driehoekY = height * ySpelerTekst2;
  }
  driehoekX = width * dashbordX;
  driehoekGrootte = width * xDriehoek - width * dashbordX;
  fill(wit);
  triangle(driehoekX, driehoekY, driehoekX, driehoekY + driehoekGrootte, driehoekX + driehoekGrootte, driehoekY + driehoekGrootte/2);
}
