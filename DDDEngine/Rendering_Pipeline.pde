//  Rendering Pipeline for Quake like 3d game engine
//  By Benjamin Burt
//  8/6/2018
//  MIT License

class Renderer{
  Object camera;
  public void render(HashMap<String, Object> objects){
    camera = objects.get("Player");
    for(HashMap.Entry<String, Object> entry : objects.entrySet()){
     String ky = entry.getKey();
     Object object =  entry.getValue();
     if(object.sp != null){
       object.rb.dimensions = this.calcDimensions(object.rb.position);
       object.sp.render(object.rb.position.x, object.rb.position.y, object.rb.dimensions.x, object.rb.dimensions.y);
     }
     else{
       vectorRender(object.Vectors);
     }
    }
  }
  
  public PVector calcDimensions(PVector vector){
    PVector result = new PVector(vector.z * 100, vector.z / 100);
    return result;
  }
  
  public void vectorRender(PVector[] vectors){
    PVector[] new_vectors = this.calcVectors(vectors);
    for(int i = 0; i < new_vectors.length/6; i++){
      PVector[] cur_vectors = new PVector[4];
      for(int j = 0; j < 4; j++){
        cur_vectors[j] = new_vectors[i + j];
      }
      beginShape();
      for(int j = 0; j < cur_vectors.length; j++){
        vertex(cur_vectors[j].x, cur_vectors[j].y);
      }
      endShape();
    }
  }
  
  public PVector[] calcVectors(PVector[] vectors){
    PVector[] result = new PVector[vectors.length];
    for(int i = 0; i < vectors.length; i++){
      float f = vectors[i].z - this.camera.rb.position.z;
      float new_x = ((vectors[i].x-this.camera.rb.position.x) * (f/this.camera.rb.position.z)) + this.camera.rb.position.x;
      float new_y = ((vectors[i].y-this.camera.rb.position.y) * (f/this.camera.rb.position.z)) + this.camera.rb.position.y;
      result[i] = new PVector(new_x, new_y);
    }
    return result;
  }
}
