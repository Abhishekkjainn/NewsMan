// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModal {
  String source;
  String author;
  String title;
  String description;
  String imageURL;
  String newsURL;
  String publishDate;
  String newsContent;
  NewsModal({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.imageURL,
    required this.newsURL,
    required this.publishDate,
    required this.newsContent,
  });

  factory NewsModal.fromMap(Map<String, dynamic> map) {
    return NewsModal(
      source: (map['source']['name'] == null) ? 'None' : map['source']['name'],
      author: (map['author'] == null) ? 'None' : map['author'],
      title: (map['title'] == null) ? 'None' : map['title'],
      description: (map['description'] == null) ? 'None' : map['description'],
      newsURL: (map['url'] == null) ? 'https://assets-prd.ignimgs.com/2024/02/26/eldenring-letmesoloher-interview-blogroll-1708967991633.jpg?width=1280' : map['url'],
      imageURL: (map['urlToImage'] == null)
          ? 'https://assets-prd.ignimgs.com/2024/02/26/eldenring-letmesoloher-interview-blogroll-1708967991633.jpg?width=1280'
          : map['urlToImage'],
      publishDate: (map['publishedAt'] == null) ? 'None' : map['publishedAt'],
      newsContent: (map['content'] == null) ? 'None' : map['content'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'newsURL': newsURL,
      'imageURL': imageURL,
      'publishDate': publishDate,
      'newsContent': newsContent,
    };
  }
}
