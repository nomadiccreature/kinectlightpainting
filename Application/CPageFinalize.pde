/* --------------------------------------------------------------------------
 * CPageIdle 
 * author:  Gigi Ho
 * date:  15/12/2012 
 * ----------------------------------------------------------------------------
 */

class CPageFinalize extends CScene implements ITimerHandler {

  PImage imgOpen = null;
  float fDiameter = 200;  

  CPageFinalize() {
    super();
  }

  boolean Init() {
    if (!super.Init()) {
      return false;
    }

    CLogger.Debug("[CPageInitialize.Init]");

    imgOpen = loadImage("shutter.png");

    CTimerLabel countdownTimer = new CTimerLabel(this); //count down 6sec
    countdownTimer.Init();
    countdownTimer.fFontSize = 40;
    countdownTimer.SetPosition(width - 75, height/3);
    countdownTimer.bDisplayLabel = false; //uncomment this if dont want to diaply the label
    this.AddChild(countdownTimer);
    countdownTimer.StartTimer(CameraShutterSound.length()/1000);

    CameraShutterSound.rewind();
    CameraShutterSound.play();    


    //Init drawable components inside CLayer
    /* CLabel testLabel = new CLabel("This is PageInitialize");  
     testLabel.fFontSize = 20;
     testLabel.SetPosition(width/2, 20);
     this.AddChild(testLabel);
     */
    return true;
  }

  public void Draw() {
    super.Draw();
    image(imgOpen, width/2, height/2, 600, 600);

    ellipse(width/2, height/2, this.fDiameter-millis(), this.fDiameter-millis());
  }


  //CTimer callback
  public void TimeIsUp(int iTag) {
    g_pageController.GotoPageDisplay();
//    delay(400);
  }
}

