//<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
public class RelevancyFilter {
  ArrayList<Story> storiesCopy = new ArrayList<Story>();
  public Story[] loadedStories = new Story[4];



  void setup() {
    // arrayCopy(storyArray,storiesCopy);
  }


  void draw() {
  }

  ArrayList<Story> selectStories (ArrayList<Story> array) {
    ArrayList<Story> cool = new ArrayList();
    if (array == null) {
      cool.add(new Story());
      return cool;
    }
    if (array.size() > 4) {
      for (int i=0; i<= 4; i++) {
        cool.add(array.get(i + (5 * (pageNumber-1))));
      }

      return cool;
    } else {
      for (int i=0; i< array.size(); i++) {
        cool.add(array.get(i + (5 * (pageNumber-1))));
      }
      return cool;
    }
  } 
  ArrayList<Comments> selectComments (ArrayList<Comments> array) {
    
    ArrayList<Comments> cool = new ArrayList();
    if (array == null) {
      cool.add(new Comments());
      return cool;
    }
    if (array.size() > 4) {
      for (int i=0; i< 4; i++) {
        cool.add(array.get(i + (5 * (pageNumber-1))));
      }

      return cool;
    } else {
      for (int i=0; i< array.size(); i++) {
        cool.add(array.get(i + (5 * (pageNumber-1))));
      }
      return cool;
    }
  } 




  void Sort(int sortNumber, ArrayList<Story> storyArray) {
    println("check1");


    if (sortNumber == DATE_SORT_DESCENDING)
    {

      int maxIndex= 0;

      for (int i =0; i < storyArray.size(); i++)

      {
        int maxTime = 0;
        for (int j =i; j < storyArray.size(); j++)
          if (storyArray.get(j).times > maxTime) {
            maxIndex = j;

            maxTime = storyArray.get(j).times;
          }
        Story aStory = storyArray.get(i);
        Story theStory = storyArray.get(maxIndex);


        storyArray.set(i, theStory);
        storyArray.set(maxIndex, aStory);
      }
    }


    if (sortNumber == DATE_SORT_ASCENDING)
    {



      int minIndex= 0;

      for (int i =0; i < storyArray.size(); i++)

      {
        int minTime = 1221112321;
        for (int j =i; j < storyArray.size(); j++)
        {
          if (storyArray.get(j).times < minTime) {
            minIndex = j;

            minTime = storyArray.get(j).times;
          }
        }
        Story aStory = storyArray.get(i);
        Story theStory = storyArray.get(minIndex);


        storyArray.set(i, theStory);
        storyArray.set(minIndex, aStory);
      }
    }

    if (sortNumber == SCORE_SORT_DESCENDING)
    {
      int maxIndex= 1;

      for (int i =0; i < storyArray.size(); i++)

      {
        int maxScore = 0;
        for (int j =i; j < storyArray.size(); j++)
          if (storyArray.get(j).score > maxScore) {
            maxIndex= j;
            maxScore = storyArray.get(j).score;
          }
        Story aStory = storyArray.get(i);
        Story theStory = storyArray.get(maxIndex);


        storyArray.set(i, theStory);
        storyArray.set(maxIndex, aStory);
      }
    }

    if (sortNumber == SCORE_SORT_ASCENDING)
    {

      int minIndex= 0;

      for (int i =0; i < storyArray.size(); i++)

      {
        int minScore = 10000;
        for (int j =i; j < storyArray.size(); j++)
        {
          if (storyArray.get(j).score < minScore) {
            minIndex= j;
            minScore = storyArray.get(j).score;
          }
        }
        Story aStory = storyArray.get(i);
        Story theStory = storyArray.get(minIndex);


        storyArray.set(i, theStory);
        storyArray.set(minIndex, aStory);
      }
    }

    if (sortNumber == COMMENT_SORT_DESCENDING)
    {
      int maxIndex = 0;

      for (int i =0; i < storyArray.size(); i++)

      {
        int maxComment = 0;
        for (int j =i; j < storyArray.size(); j++)
        {
          if (storyArray.get(j).comments > maxComment) {
            maxIndex= j;
            maxComment = storyArray.get(j).comments;
          }
        }
        Story aStory = storyArray.get(i);
        Story theStory = storyArray.get(maxIndex);


        storyArray.set(i, theStory);
        storyArray.set(maxIndex, aStory);
      }
    }

    if (sortNumber == COMMENT_SORT_ASCENDING)
    {
      int minIndex = 0;
      for (int i =0; i < storyArray.size(); i++)

      {
        int minComment = 10000;
        for (int j =i; j < storyArray.size(); j++)
          if (storyArray.get(j).comments < minComment) {
            minIndex= j;
            minComment = storyArray.get(j).comments;
          }
        Story aStory = storyArray.get(i);
        Story theStory = storyArray.get(minIndex);


        storyArray.set(i, theStory);
        storyArray.set(minIndex, aStory);
      }
    }
  }
}
