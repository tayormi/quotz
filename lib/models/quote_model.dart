class QuoteModel {
  Success success;
  Contents contents;
  String baseurl;
  Copyright copyright;

  QuoteModel({this.success, this.contents, this.baseurl, this.copyright});

  QuoteModel.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ? new Success.fromJson(json['success']) : null;
    contents = json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null;
    baseurl = json['baseurl'];
    copyright = json['copyright'] != null
        ? new Copyright.fromJson(json['copyright'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.toJson();
    }
    if (this.contents != null) {
      data['contents'] = this.contents.toJson();
    }
    data['baseurl'] = this.baseurl;
    if (this.copyright != null) {
      data['copyright'] = this.copyright.toJson();
    }
    return data;
  }
}

class Success {
  int total;

  Success({this.total});

  Success.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}

class Contents {
  List<Quotes> quotes;

  Contents({this.quotes});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = new List<Quotes>();
      json['quotes'].forEach((v) {
        quotes.add(new Quotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quotes {
  String quote;
  String length;
  String author;
  Tags tags;
  String category;
  String language;
  String date;
  String permalink;
  String id;
  String background;
  String title;

  Quotes(
      {this.quote,
      this.length,
      this.author,
      this.tags,
      this.category,
      this.language,
      this.date,
      this.permalink,
      this.id,
      this.background,
      this.title});

  Quotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
    length = json['length'];
    author = json['author'];
    tags = json['tags'] != null ? new Tags.fromJson(json['tags']) : null;
    category = json['category'];
    language = json['language'];
    date = json['date'];
    permalink = json['permalink'];
    id = json['id'];
    background = json['background'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quote'] = this.quote;
    data['length'] = this.length;
    data['author'] = this.author;
    if (this.tags != null) {
      data['tags'] = this.tags.toJson();
    }
    data['category'] = this.category;
    data['language'] = this.language;
    data['date'] = this.date;
    data['permalink'] = this.permalink;
    data['id'] = this.id;
    data['background'] = this.background;
    data['title'] = this.title;
    return data;
  }
}

class Tags {
  String s0;
  String s1;
  String s2;
  String s4;
  String s5;

  Tags({this.s0, this.s1, this.s2, this.s4, this.s5});

  Tags.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
    s4 = json['4'];
    s5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['4'] = this.s4;
    data['5'] = this.s5;
    return data;
  }
}

class Copyright {
  int year;
  String url;

  Copyright({this.year, this.url});

  Copyright.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['url'] = this.url;
    return data;
  }
}
