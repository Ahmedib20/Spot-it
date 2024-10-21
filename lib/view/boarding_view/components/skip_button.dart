import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spot_it/core/constants/constants.dart';
import 'package:spot_it/core/utils/size_config.dart';

class SkipButton extends StatelessWidget {
  final bool isButtonVisiabl;
  final void Function()? onPressed;
  const SkipButton({
    super.key,
    required this.isButtonVisiabl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = Get.find();
    return AnimatedCrossFade(
      firstChild: CupertinoButton(
        onPressed: onPressed,
        child: const Text(
          'Skip',
          style: TextStyle(
            color: k5thColor,
          ),
        ),
      ),
      secondChild: SizedBox(height: sizeConfig.defaultSize! * 5.2),
      crossFadeState: isButtonVisiabl
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(
        milliseconds: 100,
      ),
    );
  }
}
