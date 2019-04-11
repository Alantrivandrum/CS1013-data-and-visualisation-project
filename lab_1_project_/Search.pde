public class Search {

  ArrayList<Comments> matchedComments = new ArrayList<Comments>();
  ArrayList<Story> keywordResults = new ArrayList<Story>();
  ArrayList<Story> userSearchResults = new ArrayList<Story>();
  ArrayList<Story> dateSearchResults = new ArrayList<Story>();
  boolean currentIndex;
  String currentUsername;
  Comments currentComment;


  void setup() {
  }

  void draw() {
  }

  ArrayList <Comments> searchUserComment (String username)
  {
    for (int i = 0; i < commentsArray.size(); i++)
    {
      currentComment = commentsArray.get(i);
      currentUsername = currentComment.getUsername();
      if (currentUsername == username)
      {
        matchedComments.add(currentComment);
      }
    }
    return matchedComments;
  }

  void keywordSearch(String keyword) {



    for (int i = 0; i<storyArray.size(); i++)
    {

      Story myStory = storyArray.get(i);
      String title = myStory.headline;
      if (title!= null) {
        if (title.contains(keyword))
        {
          keywordResults.add(myStory);
        }
      }
    }
  }


  void  userSearch(String username) {
    for (int i = 0; i<storyArray.size(); i++)
    {
      Story myStory = storyArray.get(i);
      String user = myStory.username;
      print(user);

      if (user.contains(username))
      {
        userSearchResults.add(myStory);
      }
    }
  }

  void  dateSearch(String searchedDate) {



    for (int i =0; i<=storyArray.size(); i++)
    {

      Story myStory = storyArray.get(i);
      Date date = myStory.time;
      String Date = date.toString();

      if (Date.contains(searchedDate))
      {
        dateSearchResults.add(myStory);
      }
    }
  }

  //ArrayList <Story> searchStoryTitles(String title) {
  //  Arraylist <Story> matchedStories = new ArrayList (Story);
  //  boolean currentIndex;
  //  for (int i = 0; i<=storyArray.size(); i++){
  //    currentIndex = storyArray.get(i).title.toLowerCase().contains(title.toLowerCase());
  //    if (currentIndex)
  //    {
  //      matchedStories.add(storyArray.get(i));
  //    }
  //  }
  //    return matchedStories;
  //  }
}
