import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_durations.dart';
import '../../../utils/text_style.dart';

/// A labelled text input styled for the dark glass surface: a small caption
/// above a translucent box that warms toward the brand blue while focused.
///
/// Wraps [TextFormField], so it plugs straight into the form's [Form] and
/// reports validation errors under the box like any Material field.
class ContactField extends StatefulWidget {
  const ContactField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.maxLines = 1,
    this.labelFontSize = AppDimensions.contactFieldLabelFontSize,
    this.fontSize = AppDimensions.contactFieldFontSize,
  });

  final String label;
  final String hint;
  final TextEditingController controller;

  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  /// Greater than one turns the field into the multi-line message box.
  final int maxLines;

  final double labelFontSize;
  final double fontSize;

  @override
  State<ContactField> createState() => _ContactFieldState();
}

class _ContactFieldState extends State<ContactField> {
  /// Owned here rather than passed in, so callers only deal with controllers.
  final FocusNode _focusNode = FocusNode();

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_isFocused == _focusNode.hasFocus) return;
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimensions.contactFieldRadius),
    borderSide: BorderSide(color: color, width: AppDimensions.borderThin),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedDefaultTextStyle(
          duration: AppDurations.fast,
          style: AppTextStyle.withColor(
            AppTextStyle.labelMedium,
            _isFocused ? AppColors.accentGlow : AppColors.textTertiary,
          ).copyWith(fontSize: widget.labelFontSize, letterSpacing: 0.6),
          child: Text(widget.label),
        ),
        const SizedBox(height: AppDimensions.contactFieldLabelGap),

        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          cursorColor: AppColors.primaryLight,
          style: AppTextStyle.withColor(
            AppTextStyle.bodyMedium,
            AppColors.textPrimary,
          ).copyWith(fontSize: widget.fontSize, height: 1.5),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyle.withColor(
              AppTextStyle.bodyMedium,
              AppColors.textDisabled,
            ).copyWith(fontSize: widget.fontSize, height: 1.5),
            filled: true,
            fillColor: _isFocused
                ? AppColors.surface.withValues(alpha: 0.85)
                : AppColors.scaffoldBackground.withValues(alpha: 0.55),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.contactFieldHorizontalPadding,
              vertical: AppDimensions.contactFieldVerticalPadding,
            ),
            border: _border(AppColors.border),
            enabledBorder: _border(AppColors.border),
            focusedBorder: _border(AppColors.primary),
            errorBorder: _border(AppColors.error.withValues(alpha: 0.8)),
            focusedErrorBorder: _border(AppColors.error),
            errorStyle: AppTextStyle.withColor(
              AppTextStyle.bodySmall,
              AppColors.error,
            ).copyWith(fontSize: AppDimensions.contactFormNoteFontSize),
          ),
        ),
      ],
    );
  }
}
