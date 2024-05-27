import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:worklin/gen/assets.gen.dart';
import 'package:worklin/utils/colors.dart';
import 'package:worklin/utils/helpers.dart';
import 'package:worklin/utils/typography.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget? prefix;
  final bool isPassword;
  final bool readOnly;
  final bool showBottomBorder;
  final bool showNoBorders;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final int maxLines;
  final int? maxLength;

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool filled;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefix,
    this.isPassword = false,
    this.readOnly = false,
    this.showBottomBorder = false,
    this.showNoBorders = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
    this.suffixIcon,
    this.filled = false,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void _changeTextVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      enableInteractiveSelection: false,
      onTapOutside: (c) => hideKeyBoard(),
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      enabled: true,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword && obscureText,
      obscuringCharacter: '*',
      cursorColor: Colors.black,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      // style: AppStyles.body2black,
      decoration: InputDecoration(
        hintStyle: AppTypography.bodySmallRegular.copyWith(
          color: AppColors.inactive,
        ),
        // prefix: widget.prefix,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: widget.prefix,
        ),
        prefixIconConstraints:
            const BoxConstraints(maxHeight: 50, maxWidth: 50),
        suffixIcon: widget.isPassword
            ? IconButton(
                splashRadius: 1,
                icon: SvgPicture.asset(
                  obscureText
                      ? Assets.appIcons.svg.eyeSlash
                      : Assets.appIcons.svg.eye,
                  colorFilter: const ColorFilter.mode(
                    AppColors.inactive,
                    BlendMode.srcIn,
                  ),
                  // color: ,
                ),
                onPressed: _changeTextVisibility,
              )
            : widget.suffixIcon,
        hintText: widget.hintText,
        focusedBorder: widget.showNoBorders == true
            ? InputBorder.none
            : widget.showBottomBorder == true
                ? UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: AppColors.secondary,
                      width: 2,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: AppColors.secondary,
                      width: 2,
                    ),
                  ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        focusColor: AppColors.secondary,
        enabledBorder: widget.showNoBorders == true
            ? InputBorder.none
            : widget.showBottomBorder == true
                ? UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: AppColors.inactive,
                      width: 2,
                    ),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: AppColors.inactive,
                      width: 2,
                    ),
                  ),
        fillColor: AppColors.white,
        filled: widget.filled,
        // filled: true,
      ),
    );

    // Container(
    //   height: MediaQuery.of(context).size.height * 0.06635,
    //   decoration: const BoxDecoration(
    //     border: Border(
    //       bottom: BorderSide(color: ColorName.customGrey, width: 0.25),
    //     ),
    //   ),
    //   child: Row(
    //     children: [
    //       TextFormField(
    //         focusNode: widget.focusNode,
    //         controller: widget.controller,
    //         textInputAction: TextInputAction.next,
    //         keyboardType: TextInputType.text,
    //         obscureText: widget.obscureText,
    //         autofillHints: widget.autofillHints,
    //         cursorColor: ColorName.customBlack,
    //         cursorWidth: 1,
    //         style: AppStyles.body2black,
    //         decoration: InputDecoration(
    //           border: InputBorder.none,
    //           hintText: widget.hintText,
    //         ),
    //       ),
    //       // Text("Suff"),
    //     ],
    //   ),
    // );
  }
}
