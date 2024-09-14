import 'package:flutter/material.dart';
import 'package:funny_baby/core/widgets/custom_widgets.dart';
import 'package:funny_baby/generated/l10n.dart';

void showErrorSnackbar(BuildContext context, String errorCode) {
  final s = S.of(context); 

  String localizedErrorMessage;

  switch (errorCode) {
    case 'Permission denied to access Firestore.':
      localizedErrorMessage = s.permissionDenied;
      break;
    case 'Document not found in Firestore.':
      localizedErrorMessage = s.notFound;
      break;
    case 'Firestore operation was aborted.':
      localizedErrorMessage = s.aborted;
      break;
    case 'Document already exists in Firestore.':
      localizedErrorMessage = s.alreadyExists;
      break;
    case 'Firestore resource exhausted.':
      localizedErrorMessage = s.resourceExhausted;
      break;
    case 'Firestore service is currently unavailable.':
      localizedErrorMessage = s.unavailable;
      break;
    case 'Firestore operation timed out.':
      localizedErrorMessage = s.deadlineExceeded;
      break;
    case 'Firestore request was cancelled.':
      localizedErrorMessage = s.cancelled;
      break;
    case 'The email address is not valid.':
      localizedErrorMessage = s.invalidEmail;
      break;
    case 'The user account has been disabled.':
      localizedErrorMessage = s.userDisabled;
      break;
    case 'No user found with this email.':
      localizedErrorMessage = s.userNotFound;
      break;
    case 'Incorrect password.':
      localizedErrorMessage = s.wrongPassword;
      break;
    case 'The email is already in use.':
      localizedErrorMessage = s.emailAlreadyInUse;
      break;
    case 'The password is too weak.':
      localizedErrorMessage = s.weakPassword;
      break;
    case 'This operation is not allowed.':
      localizedErrorMessage = s.operationNotAllowed;
      break;
    default:
      localizedErrorMessage = s.unknownError;
      break;
  }

  showSnackbar(context, localizedErrorMessage);
}
