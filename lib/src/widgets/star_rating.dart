import 'package:book_library/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StarRating extends StatelessWidget {
  final num size;
  final int starCount;
  final num rating;

  StarRating({
    @required this.starCount,
    @required this.rating,
    this.size = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SmoothStarRating(
          size: size,
          // FIXME: Is this an issue in the SmoothStarRating package
          allowHalfRating: false,
          starCount: 5,
          rating: rating,
          color: kYellow,
          borderColor: kYellow.withOpacity(0.5),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            '${rating.toStringAsFixed(1)}',
            style: TextStyle(
              color: kYellow,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
