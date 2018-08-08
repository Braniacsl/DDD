class SceneManager {
  Scene[] scenes;
  int loadedScene = -1;
  SceneManager(Scene[] scenes) {
    this.scenes = scenes;
  }
  Scene LoadScene(int index) {
    loadedScene = index;
    return scenes[index].DeepCopy();
  }
  Scene switchSceneWithKey(char k) {
    int kNum = Character.getNumericValue(k);
    println(kNum);
    if (kNum < 0 || kNum > 9 || kNum >= scenes.length) return null;
    return LoadScene(kNum);
  }
}
