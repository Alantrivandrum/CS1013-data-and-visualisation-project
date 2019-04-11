class JSON_Object{
  
  
  ArrayList<String> usernameArray = new ArrayList();
  ArrayList<String> urlArray = new ArrayList();
  ArrayList<Integer> idArray = new ArrayList();
  ArrayList<String> scoreArray = new ArrayList();
  ArrayList<String> typeArray = new ArrayList();
  ArrayList<String> kidsArray = new ArrayList();
  ArrayList<String> timeArray = new ArrayList();
  ArrayList<String> descendantsArray = new ArrayList();
  ArrayList<String> titleArray = new ArrayList();
  ArrayList<String> parentArray = new ArrayList();
  ArrayList<String> textArray = new ArrayList();
  
  String lines[] = loadStrings("Dataset.txt");
  String username = " ";
  String url = " ";
  String id = " ";
  String score = " ";
  String title = " ";
  String type = " ";
  String kids = " ";
  String time = " ";
  String descendants = " ";
  String parent = " ";
  String text = " ";
  
  
  void LoadData(String[] lines){
  for (int i=0; i < lines.length; i++)
  {
  JSONObject json = parseJSONObject(lines[i]);
   if (json == null)
   {
      println("JSONObject could not be parsed");
   } 
   else 
   {
      username = json.getString("by");
      usernameArray.add(username);
      
      url = json.getString("url");
      usernameArray.add(url);
      
      id= json.getString("id");
      usernameArray.add(id);
      
      score = json.getString("score");
      scoreArray.add(score);
      
      title = json.getString("title");
      titleArray.add(title);
      
      type = json.getString("type");
      typeArray.add(type);
      
      kids = json.getString("kids");
      kidsArray.add(kids);
   
      time = json.getString("time");
      timeArray.add(time);
      
      descendants = json.getString("descendants");
      descendantsArray.add(descendants);
      
      parent = json.getString("parent");
      parentArray.add(parent);
      
      text = json.getString("text");
      textArray.add(text);
      
   
    }  
  }
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
