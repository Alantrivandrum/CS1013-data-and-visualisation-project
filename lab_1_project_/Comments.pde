public class Comments {
  int score, time, id, parent;
  String username, text;
  int x, y, i;
  ArrayList<Integer> kids;
  JSONArray JSONkids;
  Date date;
  Comments(){
    text = "No comments found for this post.";
    username = "Whoops!";
    
  }
  
  
  
  
  
  
  Comments(JSONObject mySon) {
    //println(mySon);
kids = new ArrayList();
if (mySon.hasKey("kids"))
    {
      JSONkids = mySon.getJSONArray("kids");
      for (int c = 0; c < JSONkids.size(); c++)
      {
        int currentKidValue = JSONkids.getInt(c);
        kids.add(currentKidValue);
      }
    }

    String by = " ";
    if (mySon.hasKey("by"))
    {
      by = mySon.getString("by");
      username = by;
    }
    int postTime = -1;
    if (mySon.hasKey("time")) 
    {
      postTime = mySon.getInt("time");
      time = postTime;
    
    }

    int postId = -1;
    if (mySon.hasKey("id"))
    {
      postId = mySon.getInt("id");
      id = postId;
    }
    
    String body = " ";
    if (mySon.hasKey("text"))
    {
      body = mySon.getString("text");
       StringBuilder formattedString = new StringBuilder(body);
      int i = 0;
      while ((i = formattedString.indexOf(" ", i + 75)) != -1) {
        formattedString.replace(i, i + 1, "\n");
      }
      text = formattedString.toString();
    }
   
    
    
    
    
    
    
    int daddy = -1;
    if (mySon.hasKey("parent")) 
    {
      daddy = mySon.getInt("parent");
      parent = daddy;
    
    }
    
    date = new java.util.Date((postTime)*1000L);
  }








  void draw(int xx, int yy) {
    if (pageType == STORY_OVERVIEW_PAGE){

    x = xx;
    y = yy;
    fill(UI_COLOUR_X, UI_COLOUR_Y, UI_COLOUR_Z);
    rect(x, y, MAIN_BOX_WID, MAIN_BOX_LEN);
    fill(SUB_BOX_COLOUR);
    rect(x+10, y+25, SUB_BOX_WID, SUB_BOX_LEN);
    textSize(FONT_SIZE);
    text("Username: "+username, x+500, y+15);
    text("Post ID: " + id, x+ 700, y+15);
    textSize(STORY_FONT_SIZE);
    fill(0);
    text(text, x+20, y+45);
    }
  }
  
  
  
  String getUsername()
  {
    return username;
  }
}
