import java.util.Date;
public class Story {

  int score, comments, id, descendants, unixTime;
  String username, headline, text, url, fakeurl, formattedString ;
  int x, y, length;
  JSONArray JSONkids;
  ArrayList<Integer> kids;
  Date time;
  String formattedUrl;

  boolean mouseOver, formattingNecessary;
  int times;
  Story(PImage ht, PImage cmt, JSONObject myBoy) {
    
    kids = new ArrayList();
    if (myBoy.hasKey("kids"))
    {
      JSONkids = myBoy.getJSONArray("kids");
      for (int c = 0; c < JSONkids.size(); c++)
      {
        int currentKidValue = JSONkids.getInt(c);
        kids.add(currentKidValue);
      }
    }

    username="Not found";
    String by = " ";
    if (myBoy.hasKey("by"))
    {
      by = myBoy.getString("by");
      username = by;
    }
    url = "Not found";
    String link = " ";
    if (myBoy.hasKey("url"))
    {
      link = myBoy.getString("url");
     url = link;
     
      }
    
    String title = " ";
    if (myBoy.hasKey("title"))
    {
      String titleun = myBoy.getString("title");
      StringBuilder formattedString = new StringBuilder(titleun);
      int i = 0;
      while ((i = formattedString.indexOf(" ", i + 45)) != -1) {
        formattedString.replace(i, i + 1, "\n");
      }
      title = formattedString.toString();


      headline = title;
      
    }
    
    int postScore = -1;
    if (myBoy.hasKey("score")) 
    {
      postScore = myBoy.getInt("score");
      score = postScore;
    }

    int postDescendants = -1;
    if (myBoy.hasKey("descendants"))
    {
      postDescendants = myBoy.getInt("descendants");
      descendants = postDescendants;
    }

    int postTime = -1;
    if (myBoy.hasKey("time")) 
    {
      postTime = myBoy.getInt("time");
      unixTime = postTime;
    }

    int postId = -1;
    if (myBoy.hasKey("id"))
    {
      postId = myBoy.getInt("id");
      id = postId;
    }
    formattingNecessary = false;
    comments = kids.size();
    times = postTime;
    time = new java.util.Date((postTime)*1000L);
    heart = ht;
    comment = cmt;
    StringBuilder formattedString = new StringBuilder(url);
    int i = 0;
    while ((i = formattedString.indexOf(" ", i + 75)) != -1) {
      formattedString.replace(i, i + 1, "\n");
    }
    url = formattedString.toString();
  }
  Story(){
    score = 0;
    id = 69;
    url = "mynuts.org";
    comments = 420;
    time = new java.util.Date((1) * 1000L);
    descendants =0 ;
    username = "me";
    headline = "Oops! No results";
    
    
    
  }



  void draw(int xx, int yy) {
    if (pageType!= STORY_OVERVIEW_PAGE) {
      textSize(STORY_FONT_SIZE);
      x = xx;
      y = yy;
      fill(UI_COLOUR_X, UI_COLOUR_Y, UI_COLOUR_Z);
      rect(x, y, MAIN_BOX_WID, MAIN_BOX_LEN);
      fill(SUB_BOX_COLOUR);
      rect(x+10, y+25, SUB_BOX_WID, SUB_BOX_LEN);
      image(heart, x+10, y+105);
      image(comment, x+80, y+105);
      if (headline == null){
        headline = "headline not found";
      }

      text(headline, x+10, y+18);
      text("User: "+username, x+600, y+17);
      text(score, x+30, y+118);
      text(comments, x+100, y+118);
      text("" + time, x+ 180, y+118);
      text("Post ID: " + id, x+ 650, y+118);
      fill(0);
      text(url, x+20, y+45);
      
    } 
    else {
      textSize(STORY_FONT_SIZE);
      x = 30;
      y = 170;
      fill(UI_COLOUR_X, UI_COLOUR_Y, UI_COLOUR_Z);
      if (!formattingNecessary) {
        rect(x, y, STORY_MAIN_BOX_LEN, STORY_MAIN_BOX_HT);
        fill(SUB_BOX_COLOUR);
        rect(x+10, y+25, STORY_SUB_BOX_LEN, STORY_SUB_BOX_HT);
        text("Username: "+username, x+600, y+20);
        text("Time: " + time, x+ 180, y+20);
        text(score, x+30, y+142);
        text(comments, x+100, y+142);

        textSize(STORY_BIG_FONT);
        fill(0);
        text(headline, x + 20, y+50);
        // text(url, x+20, y+80);
         image(heart, x+10, y+127);
        image(comment, x+80, y+127);
       
        fill(255);
      }
      //} else if (formattingNecessary) {
      //  rect(x, y, STORY_MAIN_BOX_LEN, STORY_MAIN_BOX_HT);
      //  fill(SUB_BOX_COLOUR);
      //  rect(x+10, y+25, STORY_SUB_BOX_LEN, STORY_SUB_BOX_HT);
      //  text("Username: "+username, x+600, y+20);
      //  text("Time: " + time, x+ 180, y+20);
      //else if (formattingNecessary) {
      //  rect(x, y, STORY_MAIN_BOX_LEN, STORY_MAIN_BOX_HT + (formattedUrl.length * 10));
      //  fill(SUB_BOX_COLOUR);
      //  rect(x+10, y+25, STORY_SUB_BOX_LEN, STORY_SUB_BOX_HT + (formattedUrl.length * 10));
      //  text("Username: "+username, x+600, y+20);
      //  text("Time: " + time, x+ 180, y+20);
      //}
    }

    fill(255);
  }

  int getStoryEvent(int mX, int mY) {
    if (pageType == STORY_OVERVIEW_PAGE) {
      return EVENT_NULL;
    }
    if (mX>x && mX < x+MAIN_BOX_WID && mY >y && mY <y+MAIN_BOX_LEN && pageType != STORY_OVERVIEW_PAGE) {
      return id;
    }
    return EVENT_NULL;
  }
}
