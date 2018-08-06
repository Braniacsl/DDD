//  Rendering Pipeline for Quake like 3d game engine
//  By Benjamin Burt
//  8/6/2018
//  MIT License

static class Renderer{
  public static void render(HashMap<String, Object> objects){
    for(HashMap.Entry<String, Object> entry : objects.entrySet()){
     String ky = entry.getKey();
     Object object =  entry.getValue();
     object.sp.render(object.rb.position.x, object.rb.position.y, object.rb.dimensions.x, object.rb.dimensions.y);
    }
  }
}
