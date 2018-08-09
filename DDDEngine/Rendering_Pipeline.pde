//  Rendering Pipeline for Quake like 3d game engine
//  By Benjamin Burt
//  8/6/2018
//  MIT License

float RenderDistance = width*2;

class Renderer{
  Object camera;
  PVector rotationVector = new PVector();
  public void render(HashMap<String, Object> objects){
    camera = objects.get("Player");
    for(HashMap.Entry<String, Object> entry : objects.entrySet()){
     String ky = entry.getKey();
     Object object =  entry.getValue();
     if(object.sp != null && ky != "Player"){
       //object.rb.dimensions = this.calcDimensions(object.rb.position);
       object.sp.render(object.rb.position.x, object.rb.position.y, object.rb.dimensions.x, object.rb.dimensions.y);
     }
     else if(ky != "Player"){
       boolean isToBeCalced = this.checkCalculable(object);
       if(isToBeCalced)
         vectorRender(object);
     }
    }
  }   
  
  public boolean checkCalculable(Object object){
    float rotationX = camera.rotation.x * ((float)Math.PI/180);
    float rotationY = camera.rotation.y * ((float)Math.PI/180);
    PVector[] vectors = this.calcVectors(object);
    PVector[] camera_vecs = createFrustum();
    boolean result = false;
    for(int i = 0; i < vectors.length; i++){
      PVector vector = vectors[i];
      for(int j = 0; j < camera_vecs.length; j++){
        camera_vecs[j] = RotationMatrixY(camera_vecs[j], rotationX);
        camera_vecs[j].dot(RotationMatrixX(camera_vecs[j], rotationY));
        rotationVector.x = camera_vecs[j].x;
        rotationVector.y = camera_vecs[j].y;
      }
      
      float z = vector.z;
      PVector[] layer = this.trig_calc(z, camera_vecs);
      if(vector.x > layer[0].x && vector.x < layer[1].x && vector.y > layer[1].y && vector.y < layer[3].y){
        result = true;
      }
    }
    return true;
  }
  
  public PVector[] trig_calc(float z, PVector[] camera_vecs){
    PVector[] result =  new PVector[4];
    float[] toEdgeX = {Math.abs(camera_vecs[4].x - camera_vecs[0].x), camera_vecs[5].x - camera_vecs[1].x};
    float[] toEdgeY = {camera_vecs[4].y-camera_vecs[0].y, camera_vecs[6].y-camera_vecs[2].y};
    float percentage = camera_vecs[0].z/camera_vecs[4].z;
    float line = percentage * toEdgeX[0];
    result[0] = new PVector(camera_vecs[0].x - line, camera_vecs[0].y - line);
    result[1] = new PVector(camera_vecs[1].x + line, camera_vecs[1].y + line);
    result[2] = new PVector(camera_vecs[2].x + line, camera_vecs[2].y + line);
    result[3] = new PVector(camera_vecs[3].x - line, camera_vecs[3].y + line);
    return result;
  }
  
  public PVector RotationMatrixY(PVector point, float rotation){
    PVector result = new PVector();
    float[][] temp = new float[1][3];
    temp[0][0] = point.x - camera.rb.position.x;
    temp[0][1] = point.y - camera.rb.position.y;
    temp[0][2] = point.z - camera.rb.position.z;
    float[][] rotationMatrixY = new float[][]{
                                              {(float) Math.cos(rotation), 0, (float) Math.sin(rotation)},
                                              {0, 1, 0},
                                              {(float) -Math.sin(rotation), 0, (float) Math.cos(rotation)}
                                              };
    float[][] medfloat = GenericFunctions.multiplyMatrices(temp, rotationMatrixY, 1, 3, 3);
    for(int i = 0; i < medfloat.length; i++){
      medfloat[i][0] += camera.rb.position.x;
      medfloat[i][1] += camera.rb.position.y;
      medfloat[i][2] += camera.rb.position.z;
    }
    result.x = medfloat[0][0];
    result.y = medfloat[0][1];
    result.z = medfloat[0][2];
    return result;
  }
  
   public PVector RotationMatrixX(PVector point, float rotation) {
    PVector result = new PVector();
    float[][] temp = new float[1][3];
    temp[0][0] = point.x - camera.rb.position.x;
    temp[0][1] = point.y - camera.rb.position.y;
    temp[0][2] = point.z - camera.rb.position.z;
    float[][] rotationMatrixY = new float[][]{
                                              {1, 0, 0},
                                              {0, (float) Math.cos(rotation), (float) -Math.sin(rotation)},
                                              {0, (float) Math.sin(rotation), (float) Math.cos(rotation)}
                                              };
    float[][] medfloat = GenericFunctions.multiplyMatrices(temp, rotationMatrixY, 1, 3, 3);
    for(int i = 0; i < medfloat.length; i++){
      medfloat[i][0] += camera.rb.position.x;
      medfloat[i][1] += camera.rb.position.y;
      medfloat[i][2] += camera.rb.position.z;
    }
    result.x = medfloat[0][0];
    result.y = medfloat[0][1];
    result.z = medfloat[0][2];
    return result;
  }
  
  public PVector[] createFrustum(){
    PVector[] vecs = new PVector[8];
    vecs[0] = new PVector(camera.rb.position.x, camera.rb.position.y, camera.rb.position.z);
    vecs[1] = new PVector(camera.rb.position.x+camera.rb.dimensions.x, camera.rb.position.y, camera.rb.position.z);
    vecs[2] = new PVector(camera.rb.position.x+camera.rb.dimensions.x, camera.rb.position.y+camera.rb.dimensions.y, camera.rb.position.z);
    vecs[3] = new PVector(camera.rb.position.x, camera.rb.position.y+camera.rb.dimensions.y, camera.rb.position.z);
    
    vecs[4] = new PVector(camera.rb.position.x-RenderDistance, camera.rb.position.y, camera.rb.position.z+RenderDistance);
    vecs[5] = new PVector(camera.rb.position.x+RenderDistance, camera.rb.position.y, camera.rb.position.z+RenderDistance);
    vecs[6] = new PVector(camera.rb.position.x+RenderDistance, camera.rb.position.y+camera.rb.dimensions.y, camera.rb.position.z+RenderDistance);
    vecs[7] = new PVector(camera.rb.position.x-RenderDistance, camera.rb.position.y+camera.rb.dimensions.y, camera.rb.position.z+RenderDistance);
    return vecs;
  }
  
  public PVector calcDimensions(PVector vector){
    PVector result = new PVector(vector.z * 100, vector.z / 100);
    return result;
  }
  
  public void vectorRender(Object object){
    PVector[] new_vectors = this.calcVectors(object);
    new_vectors = this.calcFinalVectors(new_vectors);
    for(int i = 0; i < new_vectors.length/4; i++){
      PVector[] cur_vectors = new PVector[4];
      for(int j = 0; j < 4; j++){
        cur_vectors[j] = new_vectors[i + j];
      }
      beginShape();
      for(int j = 0; j < cur_vectors.length; j++){
        float x = cur_vectors[j].x;
        float y = cur_vectors[j].y;
        vertex(x, y);
      }
     endShape(CLOSE);
     
    }
  }
  
  public PVector[] calcVectors(Object object){
    PVector[] result = new PVector[24];
    //front
    result[0] = new PVector(object.rb.position.x, object.rb.position.y, object.rb.position.z);
    result[1] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y, object.rb.position.z);
    result[2] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z);
    result[3] = new PVector(object.rb.position.x, object.rb.position.y+object.rb.dimensions.y, object.rb.position.z);
    //back
    result[4] = new PVector(object.rb.position.x, object.rb.position.y, object.rb.position.z + object.rb.dimensions.z);
    result[5] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y, object.rb.position.z + object.rb.dimensions.z);
    result[6] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z + object.rb.dimensions.z);
    result[7] = new PVector(object.rb.position.x, object.rb.position.y+object.rb.dimensions.y, object.rb.position.z + object.rb.dimensions.z);
    //left
    result[8] = new PVector(object.rb.position.x, object.rb.position.y, object.rb.position.z);
    result[9] = new PVector(object.rb.position.x, object.rb.position.y, object.rb.position.z+object.rb.dimensions.z);
    result[10] = new PVector(object.rb.position.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z + object.rb.dimensions.z);
    result[11] = new PVector(object.rb.position.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z);
    //right
    result[12] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y, object.rb.position.z);
    result[13] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y, object.rb.position.z+object.rb.dimensions.z);
    result[14] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z + object.rb.dimensions.z);
    result[15] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z);
    //top
    result[16] = new PVector(object.rb.position.x, object.rb.position.y, object.rb.position.z);
    result[17] = new PVector(object.rb.position.x, object.rb.position.y, object.rb.position.z+object.rb.dimensions.z);
    result[18] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y, object.rb.position.z + object.rb.dimensions.z);
    result[19] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y, object.rb.position.z);
    //bottom
    result[20] = new PVector(object.rb.position.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z);
    result[21] = new PVector(object.rb.position.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z+object.rb.dimensions.z);
    result[22] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z + object.rb.dimensions.z);
    result[23] = new PVector(object.rb.position.x+object.rb.dimensions.x, object.rb.position.y + object.rb.dimensions.y, object.rb.position.z + object.rb.dimensions.z);
    return result;
  }
  
  public PVector[] calcFinalVectors(PVector[] vectors){
    PVector[] result = new PVector[vectors.length];
    for(int i = 0; i < vectors.length; i++){
      float f = vectors[i].z - this.camera.rb.position.z;
      float new_x = ((vectors[i].x-this.camera.rb.position.x) * (f/vectors[i].z)) + rotationVector.x;
      float new_y = ((vectors[i].y-this.camera.rb.position.y) * (f/vectors[i].z)) + rotationVector.y;
      result[i] = new PVector(new_x, new_y);
    }
    return result;
  }
}
