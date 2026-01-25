import 'package:flutter/widgets.dart';
import 'package:weather_app/widgets/imagePlaceholder.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({super.key, required this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    String? FullImageUrl;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.contains("https:")) {
        FullImageUrl = imageUrl!;
      } else {
        FullImageUrl = "https:$imageUrl";
      }
    } else {
      FullImageUrl = null;
    }
    if (FullImageUrl != null) {
      return SizedBox(
        height: 64,
        width: 64,
        child: Image.network(
          FullImageUrl,
          errorBuilder: (context, error, stackTrace) => ImagePlaceHolder(),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return ImagePlaceHolder();
    }
  }
}
