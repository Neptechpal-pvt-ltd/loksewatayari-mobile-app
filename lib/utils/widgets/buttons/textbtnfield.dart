import 'package:flutter/material.dart';
import 'package:loksewa/core/themes/app_color.dart';

class TextButtonField extends StatefulWidget {
  final String? labeltext;
  final bool? obscureText;
  final TextEditingController controller;
  final bool isRequired;
  final GlobalKey<FormState>? formKey;
  final bool showText;

  const TextButtonField({
    Key? key,
    this.labeltext,
    required this.controller,
    this.obscureText,
    this.isRequired = false,
    this.formKey,
    this.showText = true,
  }) : super(key: key);

  @override
  _TextButtonFieldState createState() => _TextButtonFieldState();
}

class _TextButtonFieldState extends State<TextButtonField> {
  late FocusNode focusNode;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    // Add listener to the text controller
    widget.controller.addListener(_updateUI);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 10),
          child: Row(
            children: [
              Text.rich(
                TextSpan(
                  text: (widget.labeltext ?? 'Default Label'),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: widget.controller.text.isNotEmpty
                        ? Colors.black
                        : Colors.black,
                  ),
                  children: [
                    if (widget.isRequired && widget.controller.text.isEmpty)
                      const TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextFormField(
            focusNode: focusNode,
            obscureText: widget.obscureText == true && !isPasswordVisible,

            cursorColor: AppColor.primaryColor,
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.controller.text.isNotEmpty
                      ? Colors.black
                      : Colors.black, // Use black for other text
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              suffixIcon: widget.obscureText == true
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.primaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )
                  : null,
            ),
            validator: (value) {
              if (widget.isRequired && (value == null || value.isEmpty)) {
                return 'This field is required';
              }
              if (widget.labeltext == 'Email Address' && !isValidEmail(value)) {
                return 'Enter a valid email address';
              }
              if (widget.labeltext == 'Password' && !isValidPassword(value)) {
                return 'Password must be at least 8 characters long and contain 1 special character';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  void _updateUI() {
    if (mounted) {
      setState(() {});
    }
  }

  bool isValidEmail(String? email) {
    return email != null &&
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email);
  }

  bool isValidPassword(String? password) {
    return password != null &&
        RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}|:"<>?~`])[\w!@#$%^&*()_+{}|:"<>?~`]{8,}$')
            .hasMatch(password);
  }

  @override
  void dispose() {
    // Remove the listener when the widget is disposed
    widget.controller.removeListener(_updateUI);
    focusNode.dispose();
    super.dispose();
  }
}
