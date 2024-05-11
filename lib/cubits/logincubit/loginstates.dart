
class loginstate{}


class initialstate extends loginstate{}
class loooadingstate extends loginstate{}


class succsesstate extends loginstate{}


class failurestate extends loginstate{
  String message;
  failurestate({required this.message});

}

