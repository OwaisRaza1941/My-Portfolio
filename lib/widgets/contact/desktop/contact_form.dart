import 'package:flutter/material.dart';

import '../../../models/contact_message.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/text_style.dart';
import '../../buttons/primary_button.dart';
import 'contact_field.dart';

/// The right column of the contact section: a glass panel holding the message
/// form.
///
/// The form only validates and collects — delivery is the owning screen's job,
/// which receives the finished [ContactMessage] through [onSend].
class ContactForm extends StatefulWidget {
  const ContactForm({
    super.key,
    required this.onSend,
    this.padding = AppDimensions.contactFormPadding,
    this.titleFontSize = AppDimensions.contactFormTitleFontSize,
    this.labelFontSize = AppDimensions.contactFieldLabelFontSize,
    this.fontSize = AppDimensions.contactFieldFontSize,
    this.buttonHeight = AppDimensions.buttonHeight,
    this.messageLines = AppDimensions.contactMessageLines,
  });

  /// Fired once every field validates.
  final ValueChanged<ContactMessage> onSend;

  final double padding;
  final double titleFontSize;
  final double labelFontSize;
  final double fontSize;
  final double buttonHeight;

  /// Lines the message box shows before it starts scrolling.
  final int messageLines;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  /// Deliberately permissive — enough to catch a typo'd address, not enough to
  /// reject the unusual-but-valid ones.
  static final RegExp _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value, String error) {
    return (value == null || value.trim().isEmpty) ? error : null;
  }

  String? _emailValidator(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return AppStrings.contactEmailRequiredError;
    if (!_emailPattern.hasMatch(text)) {
      return AppStrings.contactEmailInvalidError;
    }
    return null;
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    widget.onSend(
      ContactMessage(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        subject: _subjectController.text.trim(),
        body: _messageController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.contactFormRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.card.withValues(alpha: 0.65),
            AppColors.surface.withValues(alpha: 0.45),
          ],
        ),
        border: Border.all(
          color: AppColors.border.withValues(alpha: 0.9),
          width: AppDimensions.borderThin,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.contactFormTitle,
              style: AppTextStyle.withColor(
                AppTextStyle.h2,
                AppColors.textPrimary,
              ).copyWith(fontSize: widget.titleFontSize, height: 1.3),
            ),
            const SizedBox(height: AppDimensions.contactFormTitleGap),

            _NameAndEmailRow(
              nameField: ContactField(
                label: AppStrings.contactNameLabel,
                hint: AppStrings.contactNameHint,
                controller: _nameController,
                textInputAction: TextInputAction.next,
                labelFontSize: widget.labelFontSize,
                fontSize: widget.fontSize,
                validator: (value) =>
                    _requiredValidator(value, AppStrings.contactNameError),
              ),
              emailField: ContactField(
                label: AppStrings.contactEmailFieldLabel,
                hint: AppStrings.contactEmailFieldHint,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                labelFontSize: widget.labelFontSize,
                fontSize: widget.fontSize,
                validator: _emailValidator,
              ),
            ),
            const SizedBox(height: AppDimensions.contactFieldGap),

            ContactField(
              label: AppStrings.contactSubjectLabel,
              hint: AppStrings.contactSubjectHint,
              controller: _subjectController,
              textInputAction: TextInputAction.next,
              labelFontSize: widget.labelFontSize,
              fontSize: widget.fontSize,
              validator: (value) =>
                  _requiredValidator(value, AppStrings.contactSubjectError),
            ),
            const SizedBox(height: AppDimensions.contactFieldGap),

            ContactField(
              label: AppStrings.contactMessageLabel,
              hint: AppStrings.contactMessageHint,
              controller: _messageController,
              keyboardType: TextInputType.multiline,
              maxLines: widget.messageLines,
              labelFontSize: widget.labelFontSize,
              fontSize: widget.fontSize,
              validator: (value) =>
                  _requiredValidator(value, AppStrings.contactMessageError),
            ),
            const SizedBox(height: AppDimensions.contactSendTopGap),

            // The button sizes itself to its label, so it needs a row to sit in
            // rather than the column's stretched cross axis.
            Row(
              children: [
                PrimaryButton(
                  label: AppStrings.contactSendAction,
                  icon: Icons.send_rounded,
                  onPressed: _submit,
                  height: widget.buttonHeight,
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spaceMD),

            Text(
              AppStrings.contactFormNote,
              style: AppTextStyle.withColor(
                AppTextStyle.bodySmall,
                AppColors.textDisabled,
              ).copyWith(
                fontSize: AppDimensions.contactFormNoteFontSize,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Puts the name and email fields side by side while the panel is wide enough,
/// and stacks them below [AppDimensions.contactFieldRowBreakpoint].
class _NameAndEmailRow extends StatelessWidget {
  const _NameAndEmailRow({required this.nameField, required this.emailField});

  final Widget nameField;
  final Widget emailField;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < AppDimensions.contactFieldRowBreakpoint) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              nameField,
              const SizedBox(height: AppDimensions.contactFieldGap),
              emailField,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: nameField),
            const SizedBox(width: AppDimensions.contactFieldRowGap),
            Expanded(child: emailField),
          ],
        );
      },
    );
  }
}
