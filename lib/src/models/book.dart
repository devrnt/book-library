class Book {
  String title;
  String author;
  String description;
  String coverUrl;
  String category;
  num rating;

  Book(this.title, this.author, this.description, this.coverUrl, this.category,
      this.rating);
}

final initialBooks = [
  Book(
    'The Doe in the Forest',
    'Laurel Toven',
    'In this book, we have a geographical historical and cultural region in the wester, part of the country of Belgium',
    'https://about.canva.com/wp-content/uploads/sites/3/2015/01/children_bookcover.png',
    'Children',
    9.0,
  ),
  Book(
    'Norse Mythology',
    'Neil Gaiman',
    'The immortal #1 New York Times bestseller',
    'https://pro2-bar-s3-cdn-cf3.myportfolio.com/560d16623f9c2df9615744dfab551b3d/e50c016f-b6a8-4666-8fb8-fe6bd5fd9fec_rw_1920.jpeg?h=dc627898fc5eac88aa791fb2b124ecbd',
    'Religion',
    7.0,
  ),
  Book(
    'The Sun, the Moon, the Stars',
    'Junot Diaz',
    'Winner of the Pulitzer Prize',
    'https://pro2-bar-s3-cdn-cf4.myportfolio.com/2e52194b029a65d876d57172b412d63e/5a0ce3f3-5f59-4098-8d45-93a73cf2800c_rw_1200.png?h=40a11543bd7bdc2d8e956150e3a5af2c',
    'Drama',
    6.7,
  ),
];

final bookToAdd = Book(
  'Harry Potter',
  'JK Rowling',
  'In an age with kings and kings',
  'https://www.harrypotterfanzone.com/article/wp-content/uploads/2018/11/jonny-duddle-goblet-of-fire-cover.png',
  'Fantasy',
  9.2,
);
