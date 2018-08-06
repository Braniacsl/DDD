//  Rendering Pipeline for Quake like 3d game engine
//  By Benjamin Burt
//  8/6/2018
//  MIT License

static class Renderer{
  public static void render(HashMap<String, Object> objects){
    for(HashMap.Entry<String, Object> entry : objects.entrySet()){
     String ky = entry.getKey();
     Object object =  entry.getValue();
     if(object.sp != null){
       object.sp.render(object.rb.position.x, object.rb.position.y, object.rb.dimensions.x, object.rb.dimensions.y);
     }
     else{
       vectorRender(object.Vectors);
     }
    }
  }
  public static void vectorRender(PVector[] vectors){
    PVector[] vects = new PVector[vectors.length];
    for(int i = 0; i < vectors.length; i++){
      System.out.println(vectors[i].x + " " + vectors[i].y + " " + vectors[i].z);
      vects[i] = new PVector(vectors[i].x/vectors[i].z, vectors[i].y/vectors[i].z);
    }
    System.out.println(vects);
    //PShape[] shapes = new PShape[6];
    //for(int i = 0; i < vects.length/6; i++){
      //float x = 
      //PShape shape = createShape(RECT);
      //shapes[i] = ;
    //}
  }
}
