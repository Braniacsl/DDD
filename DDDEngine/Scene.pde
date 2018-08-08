class Scene{
  HashMap<String, Object> objects;
  HashMap<String, Object> immutableObject;
  Scene(HashMap<String, Object> objects){
    this.objects = objects;
  }

  public Scene DeepCopy(){
   HashMap<String, Object> newObjs = new HashMap<String, Object>();
   for(String k : objects.keySet()){
     newObjs.put(k, objects.get(k).DeepCopy());
   }
   return new Scene(newObjs);
  }

}
