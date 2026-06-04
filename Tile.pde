class Tile {
  PVector originalPos;
  PVector pos;
  color baseColor; 
  
  float rotZ;
  float scaleOffset;
  
  Tile(float x, float y) {
    originalPos = new PVector(x, y, 0);
    pos = new PVector(x, y, 0);
    
    rotZ = radians(random(-20, 20));
    scaleOffset = random(0.65, 0.95);
    
    // Generación procedural de colores estilo Trencadís de Gaudí
    float r = random(1);
    if (r < 0.6) {
      baseColor = color(random(0, 50), random(100, 150), random(180, 255)); 
    } else if (r < 0.9) {
      baseColor = color(random(0, 100), random(180, 255), random(200, 255)); 
    } else {
      baseColor = color(random(200, 255), random(180, 220), random(50, 100)); 
    }
  }
  
  void update() {
    float mx = mouseX - width/2;
    float my = mouseY - height/2;
    float d = dist(mx, my, originalPos.x, originalPos.y);
    
    // Mapeo de amplitud basado en la distancia
    float distRatio = map(d, 0, 500, 1, 0); 
    distRatio = constrain(distRatio, 0, 1);
    
    float waveAmplitude = pow(distRatio, 3) * 70; 
    
    float waveZ = sin(d * 0.035 - time) * waveAmplitude;
    pos.z = originalPos.z + waveZ;
  }
  
  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    
    rotateZ(rotZ); 
    
    specular(255);
    shininess(15.0);
    
    if (enableLUT && lutTexture != null) {
      float mapX = map(pos.z, -15, 35, 0, lutTexture.width - 1);
      mapX = constrain(mapX, 0, lutTexture.width - 1);
      color finalColor = lutTexture.get(int(mapX), lutTexture.height / 2);
      fill(finalColor);
    } else {
      fill(baseColor);
    }
    
    rect(0, 0, tileSize * scaleOffset, tileSize * scaleOffset); 
    popMatrix();
  }
}
