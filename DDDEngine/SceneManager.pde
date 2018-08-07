class SceneManager {
  Scene[] scenes;
  int prevIndex = -1;
  SceneManager(Scene[] scenes){
    this.scenes = scenes;
  }
  HashMap<String, Object> LoadScene(int index){
    return scenes[index].objects;
    if(prevIndex != -1){
      scenes[index].objects = scenes[index].
    }
  }
}
