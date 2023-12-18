// import 'package:flutter/material.dart';
// import 'package:loksewa/core/themes/app_color.dart';

// class TextButtonField extends StatefulWidget {
//   String? labeltext;
//   final bool? obscureText;
//   final FormFieldValidator<String>? validator;
//   final TextEditingController controller;
//   final bool isRequired;
//   final GlobalKey<FormState>? formKey;

//   TextButtonField({
//     Key? key,
//     this.labeltext,
//     required this.controller,
//     this.validator,
//     this.obscureText,
//     this.isRequired = false,
//     this.formKey,
//   }) : super(key: key);

//   @override
//   _TextButtonFieldState createState() => _TextButtonFieldState();
// }

// class _TextButtonFieldState extends State<TextButtonField> {
//   late FocusNode focusNode;
//   bool isPasswordVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     focusNode = FocusNode();

//     // Add listener to the text controller
//     widget.controller.addListener(_updateUI);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Text(
//                 // Use '*' to indicate required fields
//                 widget.labeltext ??
//                     'Default Label' + (widget.isRequired ? '*' : ''),
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   color: widget.controller.text.isNotEmpty
//                       ? Colors
//                           .black // Change label text color to black when filled
//                       : (widget.isRequired ? Colors.red : Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 8, right: 8),
//           child: TextFormField(
//             focusNode: focusNode,
//             obscureText: widget.obscureText ?? !isPasswordVisible,
//             cursorColor: AppColor.primaryColor,
//             controller: widget.controller,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: widget.controller.text.isNotEmpty
//                       ? Colors
//                           .black // Change label text color to black when filled
//                       : (widget.isRequired ? Colors.red : Colors.black),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(
//                   color: Colors.black,
//                   //    widget.controller.text.isNotEmpty
//                   //       ? Colors.black // Change border color to black when filled
//                   //       : (widget.isRequired ? Colors.red : AppColor.primaryColor),
//                   // ),
//                 ),
//               ),
//               suffixIcon: widget.obscureText == true
//                   ? IconButton(
//                       icon: Icon(
//                         isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: AppColor.primaryColor,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           isPasswordVisible = !isPasswordVisible;
//                         });
//                       },
//                     )
//                   : null,
//             ),
//             validator: widget.validator,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         )
//       ],
//     );
//   }

//   void _updateUI() {
//     if (mounted) {
//       setState(() {
//         // Update the UI when the text field value changes
//       });
//     }
//   }

//   @override
//   void dispose() {
//     // Remove the listener when the widget is disposed
//     widget.controller.removeListener(_updateUI);
//     focusNode.dispose();
//     super.dispose();
//   }
// }
