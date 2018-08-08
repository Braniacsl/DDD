class SceneManager {
  Scene[] scenes;
  int prevIndex = -1;
  SceneManager(Scene[] scenes){
    this.scenes = scenes;
  }
  Scene LoadScene(int index){
    return scenes[index].DeepCopy();
  }
}
