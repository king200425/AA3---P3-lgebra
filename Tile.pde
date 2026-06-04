class Tile {
  PVector originalPos;
  PVector pos;
  color baseColor; 
  
  float rotZ;        
  PVector[] corners; // Almacena los 4 vértices irregulares
  
  Tile(float x, float y) {
    float offsetX = random(-tileSize * 0.05, tileSize * 0.05);
    float offsetY = random(-tileSize * 0.05, tileSize * 0.05);
    
    originalPos = new PVector(x + offsetX, y + offsetY, 0);
    pos = new PVector(x + offsetX, y + offsetY, 0);
    
    rotZ = radians(random(-10, 10)); 
    
    corners = new PVector[4];
    
    float s = tileSize * random(0.85, 1.05); 
    float j = tileSize * 0.2;
    
    corners[0] = new PVector(-s/2 + random(-j, j), -s/2 + random(-j, j));
    corners[1] = new PVector( s/2 + random(-j, j), -s/2 + random(-j, j));
    corners[2] = new PVector( s/2 + random(-j, j),  s/2 + random(-j, j));
    corners[3] = new PVector(-s/2 + random(-j, j),  s/2 + random(-j, j));
    
    float r = random(1);
    if (r < 0.85) {
      baseColor = color(random(0, 60), random(100, 190), random(180, 255)); // Azul
    } else if (r < 0.90) {
      baseColor = color(random(220, 255), random(220, 255), random(220, 255)); // Blanco
    } else if (r < 0.94) {
      baseColor = color(random(220, 255), random(200, 230), random(0, 100)); // Amarillo
    } else if (r < 0.97) {
      baseColor = color(random(50, 150), random(180, 230), random(50, 120)); // Verde
    } else {
      baseColor = color(random(200, 255), random(50, 120), random(0, 50)); // Rojo
    }
  }
  
  void update() {
    float ambientWave = sin(originalPos.x * 0.01 + time * 0.5) * cos(originalPos.y * 0.01 + time * 0.4) * 3.5;
    
    float mx = mouseX - width/2;
    float my = mouseY - height/2;
    float dMouse = dist(mx, my, originalPos.x, originalPos.y);
    
    float distRatioMouse = map(dMouse, 0, 400, 1, 0); 
    distRatioMouse = constrain(distRatioMouse, 0, 1);
    float waveAmplitudeMouse = pow(distRatioMouse, 3) * 35; 
    
    float mouseWave = sin(dMouse * 0.035 - time) * waveAmplitudeMouse;
    
    float zTotal = ambientWave + mouseWave; 
    
    for (Wave w : waves) {
      float dWave = dist(w.x, w.y, originalPos.x, originalPos.y);
      float age = time - w.birthTime; 
      
      float distRatioWave = map(dWave, 0, 600, 1, 0);
      distRatioWave = constrain(distRatioWave, 0, 1);
      
      float lifeRatio = map(age, 0, w.maxAge, 1, 0);
      lifeRatio = constrain(lifeRatio, 0, 1);
      
      float waveAmplitudeClic = pow(distRatioWave, 3) * 80 * lifeRatio; 
      
      zTotal += sin(dWave * 0.05 - (time * 1.5)) * waveAmplitudeClic;
    }
    
    pos.z = originalPos.z + zTotal;
  }
  
  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);

    float tiltX = pos.z * 0.015;
    float tiltY = pos.z * 0.015;
    
    rotateX(tiltX);
    rotateY(tiltY);
    rotateZ(rotZ + pos.z * 0.008); 
    
    specular(120);   
    shininess(10.0); 
    
    if (enableLUT && lutTexture != null) {
      float mapX = map(pos.z, -15, 35, 0, lutTexture.width - 1);
      mapX = constrain(mapX, 0, lutTexture.width - 1);
      color finalColor = lutTexture.get(int(mapX), lutTexture.height / 2);
      fill(finalColor);
    } else {
      fill(baseColor);
    }
    
    // Dibujar cuadrilátero irregular
    quad(corners[0].x, corners[0].y, 
         corners[1].x, corners[1].y, 
         corners[2].x, corners[2].y, 
         corners[3].x, corners[3].y);
    
    popMatrix();
  }
}
