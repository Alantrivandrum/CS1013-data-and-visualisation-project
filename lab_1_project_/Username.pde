class Username{ 
  String currentUsername;
  String currentStory; 
  
  String  usernameSearch (String usernameInput, ArrayList<String> usernameArray, JSONObject json ){
  for (int i=0; i < usernameArray.size(); i++)
  {
      currentUsername = usernameArray.get(i);
      if (currentUsername == usernameInput)
      {
        currentStory = json.getString("Story");
       
      }
    }  
    return currentStory; 
  }
  }
