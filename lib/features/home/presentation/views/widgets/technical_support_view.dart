import 'package:flutter/material.dart';
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:funny_baby/services/technical_support_messages.dart';
import 'package:go_router/go_router.dart';

class TechnicalSupportView extends StatefulWidget {
  const TechnicalSupportView({super.key});
  static String id = 'TechnicalSupportView';

  @override
  _TechnicalSupportViewState createState() => _TechnicalSupportViewState();
}

class _TechnicalSupportViewState extends State<TechnicalSupportView> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the text controllers when the widget is disposed
    phoneController.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'اذا كنت تواجه مشكلة في التطبيق او لديك شكوي ',
                    style: TextStyle(
                      color: blueColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'رقم هاتفك ',
                hint: '',
                controller: phoneController,
                onchage: (value) {
                  phoneController.text = value;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'عنوان الشكوي',
                hint: '',
                controller: titleController,
                onchage: (value) {
                  titleController.text = value;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'الشكوي',
                hint: '',
                controller: contentController,
                maxline: 10,
                onchage: (value) {
                  contentController.text = value;
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                buttonName: 'ارسال',
                color: blueColor,
                txtcolor: Colors.white,
                onTap: () async {
                  // Get the input data
                  String phone = phoneController.text.trim();
                  String title = titleController.text.trim();
                  String content = contentController.text.trim();

                  await TechnicalSupportMessages().technicalSupportMessage(
                    context: context,
                      title: title, content: content, phoneNumber: phone);
                  phoneController.clear();
                  titleController.clear();
                  contentController.clear();
        
                  // Provide feedback to the user (e.g., show a snackbar)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم إرسال الشكوى بنجاح')),
                  );
                  GoRouter.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
