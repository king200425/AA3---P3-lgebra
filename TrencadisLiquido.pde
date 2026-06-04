boolean mode3D = false; //Interruptor modo 3D
boolean enableLUT = false; //Interruptor efecto LUT
boolean showUI = true; //Interruptor para mostrar/ocultar UI
float time = 0; //Variable de tiempo para animar las olas

int tileSize = 20;
int cols, rows;
Tile[] tiles; 

PImage lutTexture;

// Lista dinámica para almacenar múltiples ondas
ArrayList<Wave> waves = new ArrayList<Wave>();

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
  //Blanco
  background(255, 255, 255); 
  
  ambientLight(100, 100, 110); 
  lightSpecular(150, 150, 150); 
  directionalLight(110, 110, 110, 0.3, 0.8, -1); 
  
  time += 0.08; 
  
  for (int i = waves.size() - 1; i >= 0; i--) {
    Wave w = waves.get(i);
    if (time - w.birthTime > w.maxAge) {
      waves.remove(i); 
    }
  }
  
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

// Añadir una nueva ola independiente al hacer clic
void mousePressed() {
  waves.add(new Wave(mouseX - width/2, mouseY - height/2, time));
}
