boolean mode3D = false; // Interruptor modo 3D
boolean enableLUT = false; // Interruptor efecto LUT
float time = 0; // Variable de tiempo para animar las olas

int tileSize = 20; // Tamaño de cada mosaico 
int cols, rows;
Tile[] tiles; 

PImage lutTexture; //Textura externa para el LUT

void setup() {
  size(1024, 768, P3D); 
  smooth(8);
  rectMode(CENTER); 
  noStroke(); 
  
  // Cargar la textura LUT externa desde la carpeta 'data'
  lutTexture = loadImage("lut.png"); 
  
  cols = width / tileSize + 2; 
  rows = height / tileSize + 2;
  tiles = new Tile[cols * rows];
  
  int index = 0;
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * tileSize - width/2 + tileSize/2;
      float y = j * tileSize - height/2 + tileSize/2;
      tiles[index] = new Tile(x, y);
      index++;
    }
  }
}

void draw() {
  background(10, 20, 35); 
  
  ambientLight(80, 120, 180);
  lightSpecular(255, 255, 255);
  directionalLight(150, 150, 150, 0.5, 0.5, -1); 
  
  time += 0.08; 
  
  if (mode3D) {
    pushMatrix();
    translate(width/2, height/2, -100); 
    rotateX(radians(30)); 
    renderTiles(); 
    popMatrix();
  } else {
    pushMatrix();
    translate(width/2, height/2, 0); 
    renderTiles(); 
    popMatrix();
  }
  
  drawUI(); 
}

void renderTiles() {
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].update();
    tiles[i].display();
  }
}
