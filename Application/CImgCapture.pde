public class CImgCapture extends CScene {
  protected SimpleOpenNI imgCapture;

  CImgCapture() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CImgCapture.Init]");
    // enable ir generation
    this.imgCapture.enableRGB();

    // setup the recording 
    this.imgCapture.enableRecorder("test1.oni");

    // select the recording channels
    this.imgCapture.addNodeToRecording(SimpleOpenNI.NODE_DEPTH, true);
    this.imgCapture.addNodeToRecording(SimpleOpenNI.NODE_IMAGE, true);

    return true;
  }

  void Draw() {   
    super.Draw();

    this.Update();
    if ((this.imgCapture.nodes() & SimpleOpenNI.NODE_DEPTH) != 0)
    {
      if ((this.imgCapture.nodes() & SimpleOpenNI.NODE_IMAGE) != 0)
      {
        tint(100);
        //      image(context.depthImage(), 0, 0);
        //   filter(GRAY);   
        image(this.imgCapture.rgbImage(), this.imgCapture.depthWidth() + 10, 0);
      }
      else
        image(this.imgCapture.depthImage(), 0, 0);
    }
  }

  //CTimer callback
  public void CapturePhoto() {
    //    this.imgCapture.stop();
        saveFrame(Configs.SAVED_PHOTO_FILEPATH);
    //this.canvas.SaveDrawing();
  }
}

