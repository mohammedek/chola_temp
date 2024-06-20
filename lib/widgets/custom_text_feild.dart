import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
class CustomTextField extends StatelessWidget {
  final String text;
  final bool isReq;
  final bool isGrey;
  final bool isRemark;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final Widget ? suffixIcon;
  final double? width;

  const CustomTextField({
    super.key,
    required this.text,
    this.isReq = false,
    this.isGrey = false,
    this.isRemark = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.suffixIcon, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isRemark ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isReq)
              Text(
                "*",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 12, color: Colors.red.shade400),
              ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
        const Gap(6),
        SizedBox(
          width: width ?? MediaQuery.of(context).size.width * 0.44,
          child: TextFormField(
            cursorColor: Colors.blue,
            controller: controller,
            keyboardType: keyboardType,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 12.0, horizontal: 12.0),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.red),
              ),
              hintText: text,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              fillColor: isGrey ? Colors.grey.shade200 : Colors.transparent,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: isGrey ? Colors.grey.shade700 : Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              errorMaxLines: 2,
            ),
            validator: isReq ? _validateRequiredField : null,
            onChanged: onChanged,
          ),
        ),
        const Gap(6),
      ],
    );
  }

  String? _validateRequiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }
}
