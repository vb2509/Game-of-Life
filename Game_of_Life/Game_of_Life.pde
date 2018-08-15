boolean[][]cellsLife=new boolean[125][125];
int cellWidth;
void setup(){
  size(500,500);
  for(int i=0;i<125;i++){
    for(int j=0;j<125;j++){
      
      cellsLife[i][j]=false;
      stroke(48);
    }
  }
  for(int i=0;i<125;i++){
    for(int j=0;j<125;j++){
      int seed=(int)random(1,100);
      if(seed<5){
        cellsLife[i][j]=true;
      }
    }
  }
}
void draw(){
  delay(1000);
  for(int i=0;i<125;i++){
    int surroundcount=0;
    for(int j=0;j<125;j++){
      for(int x=-1;x<=1;x++){
        for(int y=-1;y<=1;y++){

            
            int x_index=i+x;
            int y_index=j+y;
            if(x_index<0){
              x_index=124;
            }
            if(x_index>124){
              x_index=0;
            }
          
          
            if(y_index<0){
              y_index=124;
            }
            if(y_index>124){
              y_index=0;
            }
            println(i," ",j," ",cellsLife[x_index][y_index]);
            if(x_index!=x&&y_index!=y){
              if(cellsLife[x_index][y_index]==true)
                surroundcount++;
            }
            
          }
      }  
       
      if(surroundcount<2){
         cellsLife[i][j]=false;
      }
      if(surroundcount==3){
        cellsLife[i][j]=true;
      }
      if(surroundcount>3){
        cellsLife[i][j]=false;
      }
      
      if(cellsLife[i][j]==false)
        fill(0);
      else
        fill(0,100,250);
      rect(i*4,j*4,4,4);
    }
  }  
}
