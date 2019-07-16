import 'dart:io';
import 'dart:convert';

List<Map> jsonData = [
  {
    'title': 'The Doe in the Forest',
    'author': 'Laurel Toven',
    'description':
        'In this book, we have a geographical historical and cultural region in the wester, part of the country of Belgium',
    'coverUrl':
        'https://about.canva.com/wp-content/uploads/sites/3/2015/01/children_bookcover.png',
    'category': 'Children',
    'rating': 9.0,
  },
  {
    'title': 'Norse Mythology',
    'author': 'Neil Gaiman',
    'description': 'The immortal #1 New York Times bestseller',
    'coverUrl':
        'https://pro2-bar-s3-cdn-cf3.myportfolio.com/560d16623f9c2df9615744dfab551b3d/e50c016f-b6a8-4666-8fb8-fe6bd5fd9fec_rw_1920.jpeg?h=dc627898fc5eac88aa791fb2b124ecbd',
    'category': 'Religion',
    'rating': 7.0,
  },
  {
    'title': 'The Sun, the Moon, the Stars',
    'author': 'Junot Diaz',
    'description': 'Winner of the Pulitzer Prize',
    'coverUrl':
        'https://pro2-bar-s3-cdn-cf4.myportfolio.com/2e52194b029a65d876d57172b412d63e/5a0ce3f3-5f59-4098-8d45-93a73cf2800c_rw_1200.png?h=40a11543bd7bdc2d8e956150e3a5af2c',
    'category': 'Drama',
    'rating': 6.7,
  },
];

main() async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print("Serving at ${server.address}:${server.port}");

  await for (HttpRequest request in server) {
    request.response.headers.contentType = ContentType.json;
    request.response.write(jsonEncode(jsonData));
    await request.response.close();
  }
}
