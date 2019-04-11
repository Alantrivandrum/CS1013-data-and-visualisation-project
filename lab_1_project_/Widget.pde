abstract class Widget {
  int x, y, width, height;
  String label; 
  int event;
  color labelColor;
  boolean mouseOver;
  PFont widgetFont;

 void draw(){
 }


  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return EVENT_NULL;
  }
}
