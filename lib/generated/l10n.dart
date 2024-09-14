// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Funny Baby`
  String get Funny_Baby {
    return Intl.message(
      'Funny Baby',
      name: 'Funny_Baby',
      desc: '',
      args: [],
    );
  }

  /// `Funny`
  String get funny {
    return Intl.message(
      'Funny',
      name: 'funny',
      desc: '',
      args: [],
    );
  }

  /// `Baby`
  String get baby {
    return Intl.message(
      'Baby',
      name: 'baby',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get Sales {
    return Intl.message(
      'Sales',
      name: 'Sales',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Admin Setting`
  String get Admin_Setting {
    return Intl.message(
      'Admin Setting',
      name: 'Admin_Setting',
      desc: '',
      args: [],
    );
  }

  /// `Add Product`
  String get add_product {
    return Intl.message(
      'Add Product',
      name: 'add_product',
      desc: '',
      args: [],
    );
  }

  /// `Error loading products: `
  String get Error_loading_products {
    return Intl.message(
      'Error loading products: ',
      name: 'Error_loading_products',
      desc: '',
      args: [],
    );
  }

  /// `Product Code`
  String get product_code {
    return Intl.message(
      'Product Code',
      name: 'product_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter product code`
  String get enter_product_code {
    return Intl.message(
      'Enter product code',
      name: 'enter_product_code',
      desc: '',
      args: [],
    );
  }

  /// `Product Title`
  String get product_title {
    return Intl.message(
      'Product Title',
      name: 'product_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter product title`
  String get enter_product_title {
    return Intl.message(
      'Enter product title',
      name: 'enter_product_title',
      desc: '',
      args: [],
    );
  }

  /// `Product Price`
  String get product_price {
    return Intl.message(
      'Product Price',
      name: 'product_price',
      desc: '',
      args: [],
    );
  }

  /// `Enter product price`
  String get enter_product_price {
    return Intl.message(
      'Enter product price',
      name: 'enter_product_price',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Enter description`
  String get enter_description {
    return Intl.message(
      'Enter description',
      name: 'enter_description',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `Enter size`
  String get enter_size {
    return Intl.message(
      'Enter size',
      name: 'enter_size',
      desc: '',
      args: [],
    );
  }

  /// `Count`
  String get count {
    return Intl.message(
      'Count',
      name: 'count',
      desc: '',
      args: [],
    );
  }

  /// `Enter count`
  String get enter_count {
    return Intl.message(
      'Enter count',
      name: 'enter_count',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Enter gender`
  String get enter_gender {
    return Intl.message(
      'Enter gender',
      name: 'enter_gender',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Enter discount`
  String get enter_discount {
    return Intl.message(
      'Enter discount',
      name: 'enter_discount',
      desc: '',
      args: [],
    );
  }

  /// `Upload Image`
  String get upload_image {
    return Intl.message(
      'Upload Image',
      name: 'upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `* Please Upload image`
  String get please_upload_image {
    return Intl.message(
      '* Please Upload image',
      name: 'please_upload_image',
      desc: '',
      args: [],
    );
  }

  /// `Add New product Done`
  String get add_new_product_done {
    return Intl.message(
      'Add New product Done',
      name: 'add_new_product_done',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get please_fill_all_fields {
    return Intl.message(
      'Please fill all fields',
      name: 'please_fill_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `Sale Description`
  String get sale_desc {
    return Intl.message(
      'Sale Description',
      name: 'sale_desc',
      desc: '',
      args: [],
    );
  }

  /// `Enter your sale`
  String get enter_sale {
    return Intl.message(
      'Enter your sale',
      name: 'enter_sale',
      desc: '',
      args: [],
    );
  }

  /// `Delete Product`
  String get appBarTitle {
    return Intl.message(
      'Delete Product',
      name: 'appBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Product ID`
  String get productIDLabel {
    return Intl.message(
      'Product ID',
      name: 'productIDLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter product ID`
  String get productIDHint {
    return Intl.message(
      'Enter product ID',
      name: 'productIDHint',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendButton {
    return Intl.message(
      'Send',
      name: 'sendButton',
      desc: '',
      args: [],
    );
  }

  /// `Delete product Done`
  String get deleteSuccess {
    return Intl.message(
      'Delete product Done',
      name: 'deleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `categories`
  String get categories {
    return Intl.message(
      'categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Boys`
  String get boys {
    return Intl.message(
      'Boys',
      name: 'boys',
      desc: '',
      args: [],
    );
  }

  /// `Girls`
  String get girls {
    return Intl.message(
      'Girls',
      name: 'girls',
      desc: '',
      args: [],
    );
  }

  /// `Dresses`
  String get dresses {
    return Intl.message(
      'Dresses',
      name: 'dresses',
      desc: '',
      args: [],
    );
  }

  /// `Evening Wear`
  String get evening_wear {
    return Intl.message(
      'Evening Wear',
      name: 'evening_wear',
      desc: '',
      args: [],
    );
  }

  /// `Shoes`
  String get shoes {
    return Intl.message(
      'Shoes',
      name: 'shoes',
      desc: '',
      args: [],
    );
  }

  /// `Underwear`
  String get underwear {
    return Intl.message(
      'Underwear',
      name: 'underwear',
      desc: '',
      args: [],
    );
  }

  /// `Boys Suits`
  String get boys_suits {
    return Intl.message(
      'Boys Suits',
      name: 'boys_suits',
      desc: '',
      args: [],
    );
  }

  /// `Pajamas`
  String get pajamas {
    return Intl.message(
      'Pajamas',
      name: 'pajamas',
      desc: '',
      args: [],
    );
  }

  /// `Accessories`
  String get accessories {
    return Intl.message(
      'Accessories',
      name: 'accessories',
      desc: '',
      args: [],
    );
  }

  /// `Summer`
  String get summer {
    return Intl.message(
      'Summer',
      name: 'summer',
      desc: '',
      args: [],
    );
  }

  /// `details_page`
  String get details_page {
    return Intl.message(
      'details_page',
      name: 'details_page',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get pay_now {
    return Intl.message(
      'Pay Now',
      name: 'pay_now',
      desc: '',
      args: [],
    );
  }

  /// `Could not launch URL`
  String get error_launching_url {
    return Intl.message(
      'Could not launch URL',
      name: 'error_launching_url',
      desc: '',
      args: [],
    );
  }

  /// `Cannot launch URL`
  String get error_launching_facebook {
    return Intl.message(
      'Cannot launch URL',
      name: 'error_launching_facebook',
      desc: '',
      args: [],
    );
  }

  /// `profile_page`
  String get profile_page {
    return Intl.message(
      'profile_page',
      name: 'profile_page',
      desc: '',
      args: [],
    );
  }

  /// `Admin Setting`
  String get admin_setting {
    return Intl.message(
      'Admin Setting',
      name: 'admin_setting',
      desc: '',
      args: [],
    );
  }

  /// `Add products`
  String get add_products {
    return Intl.message(
      'Add products',
      name: 'add_products',
      desc: '',
      args: [],
    );
  }

  /// `Update products`
  String get update_products {
    return Intl.message(
      'Update products',
      name: 'update_products',
      desc: '',
      args: [],
    );
  }

  /// `Add Sale`
  String get add_sale {
    return Intl.message(
      'Add Sale',
      name: 'add_sale',
      desc: '',
      args: [],
    );
  }

  /// `Delete products`
  String get delete_products {
    return Intl.message(
      'Delete products',
      name: 'delete_products',
      desc: '',
      args: [],
    );
  }

  /// `Profile Setting`
  String get profile_setting {
    return Intl.message(
      'Profile Setting',
      name: 'profile_setting',
      desc: '',
      args: [],
    );
  }

  /// `Update Account`
  String get update_account {
    return Intl.message(
      'Update Account',
      name: 'update_account',
      desc: '',
      args: [],
    );
  }

  /// `Delete My Account`
  String get delete_my_account {
    return Intl.message(
      'Delete My Account',
      name: 'delete_my_account',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get log_out {
    return Intl.message(
      'Log out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `System Setting`
  String get system_setting {
    return Intl.message(
      'System Setting',
      name: 'system_setting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get confirm_dialog_title {
    return Intl.message(
      'Delete Account',
      name: 'confirm_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get confirm_dialog_content {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'confirm_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `search_page`
  String get search_page {
    return Intl.message(
      'search_page',
      name: 'search_page',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_label {
    return Intl.message(
      'Search',
      name: 'search_label',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search_hint {
    return Intl.message(
      'Search...',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `The Product Not Found`
  String get product_not_found {
    return Intl.message(
      'The Product Not Found',
      name: 'product_not_found',
      desc: '',
      args: [],
    );
  }

  /// `sales_page`
  String get sales_page {
    return Intl.message(
      'sales_page',
      name: 'sales_page',
      desc: '',
      args: [],
    );
  }

  /// `No discounts available yet`
  String get no_discounts {
    return Intl.message(
      'No discounts available yet',
      name: 'no_discounts',
      desc: '',
      args: [],
    );
  }

  /// `arabic`
  String get arabic {
    return Intl.message(
      'arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get Create_New_Account {
    return Intl.message(
      'Create New Account',
      name: 'Create_New_Account',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get Username {
    return Intl.message(
      'Username',
      name: 'Username',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get usernameHint {
    return Intl.message(
      'Enter your name',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get registerButton {
    return Intl.message(
      'REGISTER',
      name: 'registerButton',
      desc: '',
      args: [],
    );
  }

  /// `Register With Google`
  String get registerWithGoogleButton {
    return Intl.message(
      'Register With Google',
      name: 'registerWithGoogleButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get loginButton {
    return Intl.message(
      'LOGIN',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forget_password {
    return Intl.message(
      'Forget Password ?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password `
  String get reset_password {
    return Intl.message(
      'Forget Password ',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get user_not_found {
    return Intl.message(
      'No user found for that email.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrong_password {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `The password is weak, please add some chars (!@#%)`
  String get weak_password {
    return Intl.message(
      'The password is weak, please add some chars (!@#%)',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not valid.`
  String get invalid_email {
    return Intl.message(
      'The email address is not valid.',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `The email is already registered.`
  String get email_already_in_use {
    return Intl.message(
      'The email is already registered.',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Select a category`
  String get Select_category {
    return Intl.message(
      'Select a category',
      name: 'Select_category',
      desc: '',
      args: [],
    );
  }

  /// `check your inbox`
  String get check_inbox {
    return Intl.message(
      'check your inbox',
      name: 'check_inbox',
      desc: '',
      args: [],
    );
  }

  /// `price after Discount`
  String get price_after_discount {
    return Intl.message(
      'price after Discount',
      name: 'price_after_discount',
      desc: '',
      args: [],
    );
  }

  /// `New Collections`
  String get New_collection {
    return Intl.message(
      'New Collections',
      name: 'New_collection',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get old_password {
    return Intl.message(
      'Old Password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Old Password`
  String get old_password_hint {
    return Intl.message(
      'Enter Old Password',
      name: 'old_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter Old Password`
  String get new_password_hint {
    return Intl.message(
      'Enter Old Password',
      name: 'new_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Tap to view details`
  String get click_to_view_details {
    return Intl.message(
      'Tap to view details',
      name: 'click_to_view_details',
      desc: '',
      args: [],
    );
  }

  /// `new born`
  String get new_born {
    return Intl.message(
      'new born',
      name: 'new_born',
      desc: '',
      args: [],
    );
  }

  /// `Login With Google`
  String get Login_with_google {
    return Intl.message(
      'Login With Google',
      name: 'Login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Tap on Screen`
  String get tap_statrt {
    return Intl.message(
      'Tap on Screen',
      name: 'tap_statrt',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'invalid-email' key

  // skipped getter for the 'user-disabled' key

  // skipped getter for the 'user-not-found' key

  // skipped getter for the 'wrong-password' key

  // skipped getter for the 'email-already-in-use' key

  // skipped getter for the 'weak-password' key

  // skipped getter for the 'operation-not-allowed' key

  // skipped getter for the 'permission-denied' key

  // skipped getter for the 'not-found' key

  /// `Firestore operation was aborted.`
  String get aborted {
    return Intl.message(
      'Firestore operation was aborted.',
      name: 'aborted',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'already-exists' key

  // skipped getter for the 'resource-exhausted' key

  /// `Firestore service is currently unavailable.`
  String get unavailable {
    return Intl.message(
      'Firestore service is currently unavailable.',
      name: 'unavailable',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'deadline-exceeded' key

  /// `Firestore request was cancelled.`
  String get cancelled {
    return Intl.message(
      'Firestore request was cancelled.',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'unknown-error' key

  // skipped getter for the 'unexpected-auth-error' key

  // skipped getter for the 'unexpected-firestore-error' key

  /// `cart`
  String get cart {
    return Intl.message(
      'cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `An unknown Firebase error occurred.`
  String get unknownError {
    return Intl.message(
      'An unknown Firebase error occurred.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied to access Firestore.`
  String get permissionDenied {
    return Intl.message(
      'Permission denied to access Firestore.',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Document not found in Firestore.`
  String get notFound {
    return Intl.message(
      'Document not found in Firestore.',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Document already exists in Firestore.`
  String get alreadyExists {
    return Intl.message(
      'Document already exists in Firestore.',
      name: 'alreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Firestore resource exhausted.`
  String get resourceExhausted {
    return Intl.message(
      'Firestore resource exhausted.',
      name: 'resourceExhausted',
      desc: '',
      args: [],
    );
  }

  /// `Firestore operation timed out.`
  String get deadlineExceeded {
    return Intl.message(
      'Firestore operation timed out.',
      name: 'deadlineExceeded',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected Firestore error occurred.`
  String get unexpectedFirestoreError {
    return Intl.message(
      'An unexpected Firestore error occurred.',
      name: 'unexpectedFirestoreError',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not valid.`
  String get invalidEmail {
    return Intl.message(
      'The email address is not valid.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The user account has been disabled.`
  String get userDisabled {
    return Intl.message(
      'The user account has been disabled.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `No user found with this email.`
  String get userNotFound {
    return Intl.message(
      'No user found with this email.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password.`
  String get wrongPassword {
    return Intl.message(
      'Incorrect password.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email is already in use.`
  String get emailAlreadyInUse {
    return Intl.message(
      'The email is already in use.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password is too weak.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This operation is not allowed.`
  String get operationNotAllowed {
    return Intl.message(
      'This operation is not allowed.',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected Firebase Auth error occurred.`
  String get unexpectedAuthError {
    return Intl.message(
      'An unexpected Firebase Auth error occurred.',
      name: 'unexpectedAuthError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
