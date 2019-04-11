class TextBox extends Widget {
  int maxlen;

  TextBox(int in_x, int in_y, int in_width, int in_height, 
    String in_label, PFont in_font, int in_event, int in_max) {
    x=in_x;
    y=in_y; 
    width = in_width;
    height= in_height;
    label=in_label;
    event=in_event; 
    widgetFont=in_font;
    labelColor=0;
    maxlen=in_max;
  }

  String getText() {
    return label;
  }
   void draw() {
    fill(255);
    rect(x, y, width, height);
    fill(0);
    text(label, x+10, y+height-10);
    if (mouseOver) {
      fill(0);
      noStroke();
      rect(x, y, 1, height);
      rect(x, y, width, 1);
      rect(x+width-1, y, 1, height);
      rect(x, y+height-1, width, 1);
    }
  }



  void append(char s) {
    if (s==BACKSPACE)
    {
      if (label != null && label.length() > 0)
        label=label.substring(0, label.length()-1);
    } else if (label.length() < maxlen)
    {
      label=label+str(s);
    } 
  }
}
