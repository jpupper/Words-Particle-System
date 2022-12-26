void sendTest() {
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  // print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());


  if (theOscMessage.addrPattern().equals("/psx")) {
    PS.setPos(map(theOscMessage.get(0).floatValue(), 0, 1, 0, width), PS.pos.y);
  }

  if (theOscMessage.addrPattern().equals("/psy")) {
    PS.setPos(PS.pos.x, map(theOscMessage.get(0).floatValue(), 0, 1, 0, height));
  }

  if (theOscMessage.addrPattern().equals("/rx")) {
    repeler.setPos(map(theOscMessage.get(0).floatValue(), 0, 1, 0, width), repeler.pos.y);
  }

  if (theOscMessage.addrPattern().equals("/ry")) {
    repeler.setPos(repeler.pos.x, map(theOscMessage.get(0).floatValue(), 0, 1, 0, height));
  }

  println(theOscMessage.get(0).floatValue());
}
