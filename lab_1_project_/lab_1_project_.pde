 //<>//
import java.util.Collections; //<>// //<>// //<>// //<>//
public static int sortNumber, holdNumber, pageType, queryType, storedQueryType, previousPageType, pageNumber;
String[] lines;
PImage heart, comment, background, search, back, loadDog, loadMore, loadLess, userQuery, user, internet; 
RelevancyFilter myFilter;
Screen theScreen;
ArrayList myWidgets;
TextBox focus;
PFont stdFont, Font1;
ArrayList<JSONObject> jsonCommentArray;
ArrayList<JSONObject>  jsonStoryArray;
ArrayList<Comments> commentsArray; 
ArrayList<Comments> loadedComments;
ArrayList<Comments> commentsOnStory;
ArrayList<Story> storyArray;
ArrayList<Story> loadedStories;
ArrayList<Story> searchResults;
Story theStory;
Story currentStory;
Comments currentComment;
boolean dataLoaded = false ;
boolean pageLoading = true;
boolean clickable = true;
Search mySearch;
boolean firstTime = true;
int event;
String userName;

void setup() {
  // General intialization
  //background(background);
  pageNumber=1;
  size(1500, 1000);
  storyArray = new ArrayList();
  commentsArray = new ArrayList();
  internet = loadImage("internet.png");
  loadDog = loadImage("loadingdog.gif");
  loadMore = loadImage("loadmore.png");
  loadLess = loadImage("loadless.png");
  heart = loadImage("heart.png");
  comment = loadImage("comment2.png");
  background = loadImage("background.png");
  search = loadImage("search.png");
  back = loadImage("back.png");
  userQuery = loadImage("bythisuser.png");
  user = loadImage("defaultuser.png");
  stdFont=loadFont("SimSun-48.vlw");
  loadJsonData();
  mySearch = new Search();

  // Screen initialized here 
  Font1 = createFont("Arial Bold", 16);
  theScreen = new Screen();
  theScreen.setup();
  textFont(stdFont);

  // Pages set up and intial query values are set here 
  myFilter = new RelevancyFilter();
  loadedStories = myFilter.selectStories(storyArray);
  
  pageLoading=false;
  pageType = HOMEPAGE;
  sortNumber = DATE_SORT_DESCENDING;
  queryType = USERNAME_QUERY;
}


void resetPage() {
  pageLoading = true;
  println("check3");
  if (pageType == USER_OVERVIEW_PAGE || pageType == SEARCHPAGE) {
    loadedStories = myFilter.selectStories(searchResults);
    pageLoading = false;
  } else {

    loadedStories = myFilter.selectStories(storyArray);
    pageLoading = false;
  }
}


void loadStoryPage(Story selectedStory) {
  loadedComments=null;
  pageNumber=1;
  previousPageType = pageType;
  pageType = STORY_OVERVIEW_PAGE;
  commentsOnStory = fetchComments(selectedStory);
  loadedComments=myFilter.selectComments(commentsOnStory);
  theStory = selectedStory;
  resetPage();
}

void loadUserPage(String userName) {
  previousPageType = pageType;
  pageType = USER_OVERVIEW_PAGE;
  mySearch.userSearch(userName);
  searchResults = mySearch.userSearchResults;
  resetPage();
}

void loadSearchPage(String input) {
  focus.label="";
  previousPageType = pageType;
  mySearch.keywordResults=new ArrayList<Story>();
  mySearch.userSearchResults=new ArrayList<Story>();
  mySearch.dateSearchResults=new ArrayList<Story>();

  if (queryType == USERNAME_QUERY) {
    println("hi2");
    mySearch.userSearch(input);
    searchResults = mySearch.userSearchResults;
  } else if (queryType == KEYWORD_QUERY) {
    mySearch.keywordSearch(input);
    searchResults = mySearch.keywordResults;
  } else if (queryType == DATE_QUERY) {
    mySearch.dateSearch(input);
    searchResults = mySearch.dateSearchResults;
  }
  loadedStories = myFilter.selectStories(searchResults);
  resetPage();
}


ArrayList<Comments> fetchComments(Story parentStory) {
  print("check");
  ArrayList<Comments> myComments = new ArrayList();
  ArrayList<Integer> kids = parentStory.kids;
  print(kids);
  for (int i=0; i < kids.size(); i++) {
    int kidValue = kids.get(i);
    for(int j=0; j < commentsArray.size();j++){
      int commentValue = commentsArray.get(j).id;
      print(commentValue);
    

    if ((kidValue == commentValue ) && (commentsArray.get(i).kids.size() > 0)) {

      myComments.add(commentsArray.get(i));
      ArrayList<Comments> moreComments = fetchComments(commentsArray.get(i));
      for (int k = 0; k < moreComments.size(); k++) {
      myComments.add(moreComments.get(k));
      }
    }  
        else if (commentValue == kidValue && (commentsArray.get(i).kids.size() == 0)) {
      myComments.add(commentsArray.get(i));
    }
  }
  
}
return myComments;
}

ArrayList<Comments> fetchComments(Comments parentComment) {
  print("check");
  ArrayList<Comments> myComments = new ArrayList();
  ArrayList<Integer> kids = parentComment.kids;
  print(kids);
  for (int i=0; i < kids.size(); i++) {
    int kidValue = kids.get(i);
    for(int j=0; j < commentsArray.size();j++){
      int commentValue = commentsArray.get(j).id;
      print(commentValue);
    

    if (commentValue == kidValue && (commentsArray.get(i).kids.size() == 0)) {
      myComments.add(commentsArray.get(i));
    }
  }
  
}
return myComments;
}





void draw() {


  if (!pageLoading) {
    if (dataLoaded) 
    {
      if (pageType == HOMEPAGE) 
      {
        background(background);
        image(search, 1370, 210);
        image(loadMore, 500, 900);
        if (pageNumber > 1) {
          image(loadLess, 390, 900);
        }
        renderStories(loadedStories);
        theScreen.drawHomepage();
      } else if (pageType == SEARCHPAGE) 

      {
        background(background);
        image(search, 1370, 210);
        image(back, 10, 920);
        renderStories(loadedStories);

        theScreen.drawSearchpage();
      } else if (pageType == STORY_OVERVIEW_PAGE) 

      {
        background(background);
        image(search, 1370, 210);
        image(back, 10, 920);
        //image(userQuery, 600, 890);
        image(internet, 780, 895);
        theScreen.drawStorypage(theStory);
        renderComments(loadedComments);
      } else if (pageType == USER_OVERVIEW_PAGE) {
        background(background);
        image(search, 1370, 210);
        image(back, 10, 920);
        renderStories(loadedStories);
      }
    }
  } else if (pageLoading) {
    background(loadDog);
  }
}








void renderStory(Story myStory) {
  int x=30, y=70;
  myStory.draw(x, y);
}




//Renders all stories in loadedStories
void renderStories(ArrayList <Story> loadedStories) {
  //renders all stories in loadedStories
  if (pageType != STORY_OVERVIEW_PAGE) 
  {
    int x = 45; 
    int y = 170;
    for (int i=0; i < loadedStories.size(); i++) {
      loadedStories.get(i).draw(x, y);
      y=y+150;
    }
  }
}


void renderComments(ArrayList <Comments> loadedComments) {
  int x= 30;
  int y=325;
  for (int i=0; i < loadedComments.size(); i++) {
    loadedComments.get(i).draw(x, y);
    y=y+150;
  }
}


void mouseMoved() {
  int event;
  //Checks if mouse is curently over any widgets
  ArrayList widgetList = theScreen.getWidgets();
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    if (event != EVENT_NULL) 
    {
      aWidget.mouseOver=true;
    } else 
    {
      aWidget.mouseOver=false;
    }
  }
  //Checks if the mouse is currently over any stories
  int postid;
  for (int i=0; i<loadedStories.size(); i++) {
    Story myStory = (Story) loadedStories.get(i);
    postid = myStory.getStoryEvent(mouseX, mouseY);
    if (postid != EVENT_NULL) 
    {
      myStory.mouseOver=true;
    } else 
    {
      myStory.mouseOver=false;
    }
  }
}



void keyPressed() {
  if (focus != null) {
    focus.append(key);
    println("Text is:"+focus.getText());
  }
}


void mousePressed() {
  //sets preferences based on which widget is pressed
  ArrayList widgetList = theScreen.getWidgets();
  for (int c = 0; c < widgetList.size(); c++) {
    Widget theWidget = (Widget)widgetList.get(c);
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {

    case PREF_BUTTON1:
      sortNumber = DATE_SORT_ASCENDING;
      myFilter.Sort(sortNumber, storyArray);
      focus = null;
      //pageType = SEARCHPAGE;
      //renderStories(storyArray);
      resetPage();
      //arrayCopy(myFilter.storiesCopy, storyArray);
      println("check2");
      break;
    case PREF_BUTTON2:
      sortNumber = DATE_SORT_DESCENDING;
      myFilter.Sort(sortNumber, storyArray);
      focus = null;
      //pageType = SEARCHPAGE;
      //renderStories(storyArray);
      resetPage();
      break;
    case PREF_BUTTON3:
      sortNumber = SCORE_SORT_DESCENDING;
      myFilter.Sort(sortNumber, storyArray);
      focus = null;
      //pageType = SEARCHPAGE;
      //renderStories(storyArray);
      resetPage();
      break;
    case PREF_BUTTON4:
      sortNumber = SCORE_SORT_ASCENDING;
      myFilter.Sort(sortNumber, storyArray);
      focus = null;
      //pageType = SEARCHPAGE;
      //renderStories(storyArray);
      resetPage();
      break;
    case PREF_BUTTON5:
      sortNumber = COMMENT_SORT_DESCENDING;
      myFilter.Sort(sortNumber, storyArray);
      focus = null;
      //pageType = SEARCHPAGE;
      //renderStories(storyArray);
      resetPage();
      break;
    case PREF_BUTTON6:
      sortNumber = COMMENT_SORT_ASCENDING;
      myFilter.Sort(sortNumber, storyArray);
      focus = null;
      //pageType = SEARCHPAGE;
      //renderStories(storyArray);
      resetPage();
      break;
    case USERNAME_QUERY:
      queryType = USERNAME_QUERY;
      pageType = SEARCHPAGE;
      focus = null;

      break;
    case KEYWORD_QUERY:
      queryType = KEYWORD_QUERY;
      pageType = SEARCHPAGE;
      focus = null;


      break;
    case DATE_QUERY:
      queryType = DATE_QUERY;
      pageType = SEARCHPAGE;
      focus = null;

      break;
    case SEARCH_QUERY:
    storedQueryType = queryType;
      queryType = SEARCH_QUERY;
      pageType = SEARCHPAGE;
      focus = (TextBox)theWidget;

      break;
    }
  }

  int id = theScreen.getStoryEvent(mouseX, mouseY);
  if (id!=EVENT_NULL) {
    for (int i=0; i<storyArray.size(); i++) {
      if (storyArray.get(i).id == id) 
      {
        loadStoryPage(storyArray.get(i));
      }
    }
  }
  if ((mouseX>780 && mouseX < 880 && mouseY >890 && mouseY <990)&& (pageType == STORY_OVERVIEW_PAGE) && clickable)
  {
    println("url clikced ");
    println("x =" + mouseX);
    println("y =" + mouseY);
    String url =  theStory.url;
    link(url);
    pageNumber=1;
    resetPage();
  }
  if (mouseX>1372 && mouseX < 1422 && mouseY >200 && mouseY <250)
  {
    queryType = storedQueryType;
    pageType = SEARCHPAGE;
    println(focus.getText());
    String input = focus.getText();
    loadSearchPage(input);
    resetPage();
  }

  if (mouseX>0 && mouseX < 1000 && mouseY >0 && mouseY <140)
  {
    println("top pressed");
    println("x =" + mouseX);
    println("y =" + mouseY);
    pageType = HOMEPAGE;
    pageNumber=1;
    myFilter.Sort(sortNumber, storyArray);
    loadedStories = myFilter.selectStories(storyArray);
  }
  if (mouseX>0 && mouseX < 80 && mouseY >900 && mouseY <1000)
  {
    println("colided");
    println("x =" + mouseX);
    println("y =" + mouseY);
    pageType = previousPageType;
  }
  if (mouseX>500 && mouseX < 600 && mouseY >900 && mouseY <1000)
  {
    if (pageType == SEARCHPAGE){
      
    }else{
    println("colided");
    println("x =" + mouseX);
    println("y =" + mouseY);
    pageNumber++;
    resetPage();
    }
  }
  if (mouseX>390 && mouseX < 490 && mouseY >900 && mouseY <1000 && (pageNumber > 1))
  {
    println("colided");
    println("x =" + mouseX);
    println("y =" + mouseY);
    pageNumber--;
    resetPage();
  }
  //if (mouseX>600 && mouseX < 750 && mouseY >920 && mouseY <1000 && (pageType == STORY_OVERVIEW_PAGE))
  //{
  //  println("colided");
  //  println("x =" + mouseX);
  //  println("y =" + mouseY);
  //  loadUserPage(theStory.username);
  //}
}



void loadJsonData()
{
  jsonCommentArray = new ArrayList();
  jsonStoryArray = new ArrayList();



  String[] lines = loadStrings("news.json");

  for (int i = 0; i < lines.length; i++)
  {
    JSONObject json = parseJSONObject(lines[i]);

    if (json.hasKey("type"))
    {
      String type = json.getString("type");
      if (type.equals("story"))
      {
        jsonStoryArray.add(json);
      } else if (type.equals("comment"))
      {
        jsonCommentArray.add(json);
      }
    }
  }
  for (int i=0; i < jsonStoryArray.size(); i++) {
    Story aStory = new Story(heart, comment, jsonStoryArray.get(i));
    storyArray.add(aStory);
  }
  for (int i=0; i < jsonCommentArray.size(); i++) {
    Comments aComment = new Comments(jsonCommentArray.get(i));
    commentsArray.add(aComment);
  }
  dataLoaded = true ;
}
