void keyPressed() {
  if (key == '3') {
    mode3D = !mode3D;
  }
  if (key == 'l' || key == 'L') {
    enableLUT = !enableLUT;
  }
  if (key == 'h' || key == 'H') {
    showUI = !showUI;
  }
}

void drawUI() {
  if (!showUI) return;
  
  hint(DISABLE_DEPTH_TEST);
  
  //Fondo de cristal esmerilado
  fill(10, 15, 25, 200); 
  rectMode(CORNER);      
  rect(10, 10, 360, 115, 8); 
  rectMode(CENTER);      
  noStroke();
  
  fill(255);
  textAlign(LEFT, TOP);
  textSize(14);
  text("Trencadís Líquido - Homenaje a Gaudí", 25, 20);
  
  stroke(255, 50);
  line(25, 42, 345, 42);
  noStroke();
  
  fill(200);
  textSize(12);
  text("Modo 3D [3]: " + (mode3D ? "ON" : "OFF"), 25, 55);
  text("Efecto LUT [L]: " + (enableLUT ? "ACTIVADO" : "DESACTIVADO"), 25, 75);
  text("Ocultar UI [H]: " + (showUI ? "MOSTRAR" : "OCULTAR"), 25, 95);
  
  fill(0, 255, 150); //Verde hacker
  textAlign(RIGHT, TOP);
  text("FPS: " + int(frameRate), 345, 20);
  
  hint(ENABLE_DEPTH_TEST);  
}
