
class HomeModel {

  int rank = 0;
  String imageURL = '';
  String title = '';
  String playDate = '';
  double rating = 0;
  String originalTitle = '';
  String type = '';
  String director = '';
  String actor = '';

  HomeModel.fromJson(Map<String, dynamic> json){

    this.rank = json['rank'];
    this.imageURL = json["imageName"];
    this.title = json["title"];
    this.playDate = json["playDate"];
    this.rating = json["rating"];
    this.originalTitle = json["originalTitle"];
    this.type = json['type'];
    this.director = json['director'];
    this.actor = json['actor'];

  }
}

