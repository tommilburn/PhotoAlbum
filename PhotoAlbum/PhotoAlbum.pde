import java.util.*;

File dir;
ArrayList<File> photos;

void setup() {
  selectFolder("select a folder", "folderSelected");
  size(500, 450);
  background(0);
}

void draw(){
  
}

void mouseClicked(){
  displayPhoto();
}

void displayPhoto(){
  clear();
  if(photos == null || photos.size() == 0){
    photos = loadPhotos();
  }
  File f = photos.remove(0);
  PImage p = loadImage(f.getAbsolutePath());
  float xScale = (p.width > width) ? (float)width / (float)p.width: 1;
  float yScale = (p.height > height) ? (float)height / (float)p.height : 1;

  float scaleFactor = (float)(Math.min(xScale, yScale));
  println("scale factor: " + scaleFactor);
  if(scaleFactor != 100){
     p.resize((int)(p.width * scaleFactor), (int)(p.height * scaleFactor));
  }
  image(p, width/2 - p.width/2, height/2 - p.height/2); 

}

void folderSelected(File selection){
  if(selection == null){
    println("Window was closed or user hit cancel");
    return;
  } 
  if(selection.isDirectory()){
    dir = selection;
  } else {
    dir = selection.getParentFile();
  }
}

ArrayList<File> loadPhotos(){
  File[] files = dir.listFiles();
  ArrayList<File> p = new ArrayList<File>(Arrays.asList(files));
  return p;
}
