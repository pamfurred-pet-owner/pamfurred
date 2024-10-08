import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pamfurred/models/review.dart';

const List<Reviews> allReviews = [
  Reviews(
      id: 1,
      content: "I loved their clinic! Will come back again, for sure.",
      date: "09/10/2024"),
  Reviews(
      id: 2,
      content:
          "The staff was friendly, and the service was quick. Highly recommend!",
      date: "09/12/2024"),
  Reviews(
      id: 3,
      content:
          "The clinic was clean, but the wait time was too long for my appointment.",
      date: "09/14/2024"),
  Reviews(
      id: 4,
      content:
          "Not satisfied with the service. My issue wasn’t resolved, and the staff seemed uninterested.",
      date: "09/15/2024"),
  Reviews(
      id: 5,
      content:
          "Great experience! The doctor was very knowledgeable and took time to explain everything.",
      date: "09/16/2024"),
  Reviews(
      id: 6,
      content:
          "The clinic was not up to the mark. I had a disappointing experience.",
      date: "09/18/2024"),
];

final reviewsProvider = Provider<List<Reviews>>((ref) {
  return allReviews;
});
