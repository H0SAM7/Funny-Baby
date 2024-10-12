import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:funny_baby/constants.dart';
import 'package:funny_baby/core/utils/custom_alert.dart';
import 'package:funny_baby/core/widgets/custom_button.dart';
import 'package:funny_baby/core/widgets/custom_text_field.dart';
import 'package:funny_baby/features/Notifications/services/send_notifications.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class NotifactionsSendView extends StatefulWidget {
  const NotifactionsSendView({super.key});
  static String id = 'NotifactionsSendView';
  @override
  _NotifactionsSendViewState createState() => _NotifactionsSendViewState();
}

class _NotifactionsSendViewState extends State<NotifactionsSendView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitlecontroller = TextEditingController();

  String accessToken = '';

  getToken() async {
    var mytoken = await FirebaseMessaging.instance.getToken();
    log(mytoken.toString());
  }

  @override
  void initState() {
    getToken();
    super.initState();
    getAccessToken();
  }

  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
          'assets/files/educationapp-842af-firebase-adminsdk-9uxdl-b965004fc3.json');

      final accountCredentials = ServiceAccountCredentials.fromJson(
        json.decode(serviceAccountJson),
      );

      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

      final client = http.Client();
      try {
        final accessCredentials =
            await obtainAccessCredentialsViaServiceAccount(
          accountCredentials,
          scopes,
          client,
        );

        setState(() {
          accessToken = accessCredentials.accessToken.data;
        });

        log('Access Token: $accessToken');
      } catch (e) {
        log('Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      log('Error loading service account JSON: $e');
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    subTitlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Notification'),
        elevation: 0,
        backgroundColor: funnyPinkColor,
      ),
      body: Column(
        children: [
          CustomTextField(
            hint: '',
            label: "title",
            onchage: (value) {
              titleController.text = value;
            },
          ),
          CustomTextField(
            hint: '',
            label: "subtitle",
            onchage: (value) {
              subTitlecontroller.text = value;
            },
          ),
          CustomButton(
            buttonName: 'Send',
            color: mainColor,
            txtcolor: Colors.white,
            onTap: () async {
              try {
                await NotificationsServices().sendNotification(
                  titleController.text,
                  subTitlecontroller.text,
                  accessToken,
                );
                showCustomAlert(
                    context: context,
                    type: AlertType.success,
                    title: '',
                    description: 'Send done',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    actionTitle: 'Ok');

                log('send message done');
                Navigator.pop(context);
              } catch (e) {
                log('send message err:$e');
              }
            },
          ),
          // IconButton(
          //     onPressed: () async {
          //       await NotificationsServices().sendNotification(
          //           'welcome', 'can i help you?', accessToken);
          //       log('send message done');
          //     },
          //     icon: Icon(
          //       Icons.import_contacts,
          //       size: 150,
          //     )),
        ],
      ),
    );
  }
}
