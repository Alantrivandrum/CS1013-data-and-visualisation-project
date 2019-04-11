
public class Screen {
  
  PFont stdFont;
  ArrayList <Widget> screenWidgets;
  ArrayList <Story> myStories;
  Widget w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11;
  
  
  
  
  
  
  void setup(){
    
    stdFont=loadFont("AgencyFB-Reg-20.vlw");
    screenWidgets =  new ArrayList <Widget>();
    w1 = new ButtonWidget(1000, 550,PREF_BOX_WIDTH, PREF_BOX_LEN, "Oldest", stdFont, PREF_BUTTON1);
    w2 = new ButtonWidget(1200, 550,PREF_BOX_WIDTH, PREF_BOX_LEN, "Newest", stdFont, PREF_BUTTON2);
    w3 = new ButtonWidget(1000, 700,PREF_BOX_WIDTH, PREF_BOX_LEN, "Most", stdFont, PREF_BUTTON3);
    w4 = new ButtonWidget(1200, 700,PREF_BOX_WIDTH, PREF_BOX_LEN, "Least", stdFont,  PREF_BUTTON4);
    w5 = new ButtonWidget(1000, 850,PREF_BOX_WIDTH, PREF_BOX_LEN, "Most", stdFont, PREF_BUTTON5);
    w6 = new ButtonWidget(1200, 850,PREF_BOX_WIDTH, PREF_BOX_LEN, "Least", stdFont,  PREF_BUTTON6);
    w7 = new ButtonWidget(930, 300,PREF_BOX_WIDTH, PREF_BOX_LEN, "User", stdFont,  USERNAME_QUERY);
    w8 = new ButtonWidget(1105, 300,PREF_BOX_WIDTH, PREF_BOX_LEN, "Keyword", stdFont,  KEYWORD_QUERY);
    w9 = new ButtonWidget(1280, 300,PREF_BOX_WIDTH, PREF_BOX_LEN, "Date", stdFont,  DATE_QUERY);
    w10 = new TextBox(972,197, 400, 60, "", stdFont, SEARCH_QUERY, 50);
    screenWidgets.add(w1);
    screenWidgets.add(w2);
    screenWidgets.add(w3);
    screenWidgets.add(w4);
    screenWidgets.add(w5);
    screenWidgets.add(w6);
    screenWidgets.add(w7);
    screenWidgets.add(w8);
    screenWidgets.add(w9);
    screenWidgets.add(w10);
  }
  
  void drawHomepage() {
    
    
    
    
    
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget myWidget = screenWidgets.get(i);
      myWidget.draw();
    }
    
    
    
    
  }
  void drawSearchpage() {
    
    
    
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget aWidget = (Widget)screenWidgets.get(i);
      aWidget.draw();
    }
  }
  void drawStorypage(Story myStory) {
    
    renderStory(myStory);
    
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget aWidget = (Widget)screenWidgets.get(i);
      aWidget.draw();
    }
    
    
    
    
  }
  int getEvent(int mx, int my) {
    for (int i = 0; i<screenWidgets.size(); i++) {
      Widget aWidget = (Widget) screenWidgets.get(i);
      int event = aWidget.getEvent(mouseX, mouseY);
      if (event != EVENT_NULL) {
        return event;
      }
    }
    return EVENT_NULL;
  }
  
  int getStoryEvent(int mx, int my) {
    for (int i = 0; i<loadedStories.size(); i++) {
      Story aStory = (Story) loadedStories.get(i);
      int postid = aStory.getStoryEvent(mouseX, mouseY);
      if (postid != EVENT_NULL) {
        return postid;
      }
    }
    return EVENT_NULL;
  }
  
  ArrayList<Widget> getWidgets(){
    return screenWidgets;
  }
}
