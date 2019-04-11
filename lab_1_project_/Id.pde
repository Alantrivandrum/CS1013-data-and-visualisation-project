class ID{ 
  String currentId;
  String currentStory;
  
  String idSearch (String idInput, ArrayList<String> idArray, JSONObject json ){
  for (int i=0; i < idArray.size(); i++)
  {
      currentId = idArray.get(i);
      if (currentId == idInput)
      {
        currentStory = json.getString("Story");
       
      }
    }  
    return currentStory; 
  }
  }
