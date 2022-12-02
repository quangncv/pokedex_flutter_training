import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/theme.dart';

class AppBarSearchWidget extends StatefulWidget {
  const AppBarSearchWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<AppBarSearchWidget> createState() => _AppBarSearchWidgetState();
}

class _AppBarSearchWidgetState extends State<AppBarSearchWidget> {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: PrimaryGradient.defaultGradientBackground,
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 16),
        decoration: const BoxDecoration(
          color: kColorDarkWhite80,
        ),
        child: Column(
          children: [
            Text(widget.title ?? '', style: PrimaryFont.medium(20),),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _textEditingController,
                style: PrimaryFont.book(17).copyWith(
                  color: kColorPrimaryText,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  hintText: 'Search...',
                  hintStyle: PrimaryFont.book(17).copyWith(color: kColorPrimaryText.withOpacity(0.8)),
                  prefixIcon: const Icon(Icons.search, color: kColorPrimaryText,),
                  filled: true,
                  fillColor: Colors.black12,
                ),
              ),
            ),
            Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: PrimaryGradient.defaultGradientBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
