import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spot_it/core/constants/constants.dart';

class SearchField extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final bool isFilled;
  const SearchField({
    super.key,
    this.text,
    required this.onPressed,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: isFilled,
        fillColor: kAppBarColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        //~~~~ Boredr Style ~~~~~~~
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: isFilled
              ? BorderSide.none
              : const BorderSide(
                  color: k5thColor,
                  width: 2,
                ),
        ),
        // ~~~ hint text style
        hintText: text ?? 'Search Places',
        hintStyle: const TextStyle(
          color: k5thColor,
        ),

        // ~~~~ Search Icon
        suffixIcon: SearchSuffixIcon(
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class SearchSuffixIcon extends StatelessWidget {
  final void Function()? onPressed;
  const SearchSuffixIcon({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        kSearchIcon,
        // ignore: deprecated_member_use
        color: k5thColor,
      ),
    );
  }
}
