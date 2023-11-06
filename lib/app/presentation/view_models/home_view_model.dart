import '../blocs/category_bloc.dart';

class HomeViewModel {
  final CategorySelectionBloc categorySelectionBloc = CategorySelectionBloc();
  final List<String> categories = ["All events", "Startup", "Technology", "Computer"];
}