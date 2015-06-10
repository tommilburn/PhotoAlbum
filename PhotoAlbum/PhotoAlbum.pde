void setup() {
  selectFolder("select a folder", "folderSelected");
}

void folderSelected(File selection){
  File dir;
  if(selection == null){
    println("Window was closed or user hit cancel");
    return;
  } 
  if(selection.isDirectory()){
    dir = selection;
  } else {
    dir = selection.getParentFile();
  }
  
  println(dir.getAbsolutePath());
  File[] files = dir.listFiles();
  for(File f : files){
    println(f.getName()); 
  }
}
