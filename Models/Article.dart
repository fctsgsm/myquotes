class Article {
  String? author;
  String? category;
  String? textdata;
  String? language;

  Article({this.author, this.category, this.textdata, this.language});

  Article.fromJson(Map<String, dynamic> json) {
    author = json['Author'];
    category = json['Category'];
    textdata = json['textdata'];
    language = json['Language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Author'] = this.author;
    data['Category'] = this.category;
    data['textdata'] = this.textdata;
    data['Language'] = this.language;
    return data;
  }
}