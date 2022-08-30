import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/review_provider.dart';
import 'package:restaurant_app/ui/review_form.dart';

class ReviewPage extends StatelessWidget {
  static const routeName = '/review_page';
  final String id;

  const ReviewPage({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReviewProvider>(
      create: (_) => ReviewProvider(apiService: ApiService()),
      child: ReviewForm(id: id),
    );
  }
}
