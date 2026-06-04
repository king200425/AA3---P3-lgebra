class Wave {
  float x, y;       // Centro de la ola (Epicentro)
  float birthTime;  // Momento en que se creó la ola
  float maxAge = 15; // Tiempo de vida antes de desaparecer
  
  Wave(float _x, float _y, float _time) {
    x = _x;
    y = _y;
    birthTime = _time;
  }
}
