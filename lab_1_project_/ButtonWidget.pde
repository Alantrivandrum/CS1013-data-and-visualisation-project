class ButtonWidget extends Widget{
  
  
  ButtonWidget(int x, int y, int width, int height, String label, 
    PFont widgetFont, int event) {
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.label=label; 
    this.event=event;
    this.widgetFont=widgetFont;
    labelColor= color(0);
    mouseOver=false;
  }
   void draw() {
     
    fill(UI_COLOUR_X, UI_COLOUR_Y, UI_COLOUR_Z);
    rect(x, y, width, height);
    fill(255);
    textSize(STORY_BIG_FONT);
    text(label, x+20, y+height-10);
    if (mouseOver) {
      fill(255);
      noStroke();
      rect(x, y, 5, height);
      rect(x, y, width, 5);
      rect(x+width-5, y, 5, height);
      rect(x, y+height-5, width, 5);
    }
  }
}
