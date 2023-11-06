import 'package:rxdart/rxdart.dart';

class CategorySelectionBloc {
  final selectedCategory = BehaviorSubject<String>.seeded("All events");

  void setSelectedCategory(String category) {
    selectedCategory.add(category);
  }

  void dispose() {
    selectedCategory.close();
  }
}