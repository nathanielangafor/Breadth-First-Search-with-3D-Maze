import java.util.*;


int cubeLayers = 5; // You can change the cubeLayers variable to create a bigger or smaller box. / Ты можешь именить "cubeLayers" функция эсли у тебя болшой или маленкая коробка.
float rotX, rotY; 
int targetZ = 2; // Z axis of the target (depth). / Ось цели "Z" (глубина).
int targetY = 1; // Y axis of the target (up and down). / Ось цели "Y" (под и над).
int targetX = 1; // X axis of the target (left and right). / Ось цели "X" (слева или право).
int frame = 0;
boolean status = false; 


int[][][] cube = new int[cubeLayers][cubeLayers][cubeLayers];
boolean[][][] visited = new boolean[cubeLayers][cubeLayers][cubeLayers];

int[][] directions = {
  {0, 1, 0},
  {0, -1, 0},
  {1, 0, 0},
  {-1, 0, 0},
  {0, 0, 1},
  {0, 0, -1},
};

void buildVisited() {
    boolean previous = false;
    for (int i = 0; i < cubeLayers; i++) {
        for (int j = 0; j < cubeLayers; j++) {
            for (int k = 0; k < cubeLayers; k++) {
                visited[i][j][k] = false;
            }
        }
    }
}

void buildCube() {
    for (int i = 0; i < cubeLayers; i++) {
        for (int j = 0; j < cubeLayers; j++) {
            for (int k = 0; k < cubeLayers; k++) {
                cube[i][j][k] = 0;
            }
        }
    }
}


void setup() {
    size(1200, 800, OPENGL);
    buildVisited();
    buildCube();
}

void path() {
    Queue<Integer> Q = new LinkedList<Integer>();
    
    Q.add(0);
    Q.add(0);
    Q.add(0); 

    while (Q.peek() != null) {
    int currZ = Q.poll();
    int currY = Q.poll();
    int currX = Q.poll();

    if (currZ == targetZ && currY == targetY && currX == targetX) {
      println("TARGET FOUND!");
      visited[currZ][currY][currX] = false;
      break;
    };
    
    for (int d = 0; d < directions.length; d++) {
      int newZ = directions[d][2] + currZ;
      int newY = directions[d][1] + currY;
      int newX = directions[d][0] + currX;
      if (newZ < cubeLayers && newY < cubeLayers && newX < cubeLayers && newZ >= 0 && newY >= 0 && newX >= 0) {  
        if (!visited[newZ][newY][newX]) {
          Q.add(newZ);
          Q.add(newY);
          Q.add(newX);
          visited[newZ][newY][newX] = true;
        }
      }
    } 
  }
}

void draw() {
    if (status == false && frame == 120) {
        path();
        status = true;
    }

    frame++;
    smooth();
    lights();
    fill(#C0C0C0);
    noStroke();
    translate(width/2, height/2);
    background(0);
    rotateX(rotX);
    rotateY(-rotY); 

    
    fill(255, 0, 0, 255);
    for (int x = 0; x < cubeLayers; x++) {
        for (int y = 0; y < cubeLayers; y++) {
            for (int z = 0; z < cubeLayers; z++) {
                if (visited[z][y][x] == true) {
                    fill(0, 250, 0, 255);
                } else if (z == targetZ && y == targetY && x == targetX) {
                    fill(0, 0, 255);
                } else {
                    fill(255, 0, 0, 30);
                }  
                box(50);
                translate(60, 0);
            }
        translate(-60 * cubeLayers, 0);
        translate(0, 60);
        }
    translate(0, -60 * cubeLayers);
    translate(0, 0, 60);
    }
}

void mouseDragged(){
    rotY -= (mouseX - pmouseX) * 0.01;
    rotX -= (mouseY - pmouseY) * 0.01;
}
