void keyPressed() {
  if (key == '3') {
    mode3D = !mode3D; // Alternar vista 3D
  }
  if (key == 'l' || key == 'L') {
    enableLUT = !enableLUT; // Alternar efecto LUT
  }
}

void drawUI() {
  hint(DISABLE_DEPTH_TEST);
  fill(255);
  textSize(14);
  text("Trencadis Liquido - Arquitectura Modular", 20, 30);
  text("Modo 3D [3]: " + (mode3D ? "ON" : "OFF"), 20, 50);
  text("Efecto LUT [L]: " + (enableLUT ? "ACTIVADO" : "DESACTIVADO"), 20, 70);
  hint(ENABLE_DEPTH_TEST);  
}
