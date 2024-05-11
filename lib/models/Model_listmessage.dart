

class modelmessage{
  final String text;
  final String id;
  modelmessage(this.text, this.id);

  
   

factory modelmessage.fromjson(jsondata){
  return modelmessage(jsondata['message'],jsondata['id']);
}

}