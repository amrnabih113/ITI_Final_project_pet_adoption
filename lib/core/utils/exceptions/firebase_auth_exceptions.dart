class MyFirebaseAuthException implements Exception {
  final String code;

  MyFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered. Please try another one.';
      case 'invalid-email':
        return 'The email you entered is not valid. Please check and try again.';
      case 'weak-password':
        return 'Your password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'Your account has been disabled. Contact support for help.';
      case 'user-not-found':
        return 'We couldn\'t find an account with those details. Check your information and try again.';
      case 'wrong-password':
        return 'The password you entered is incorrect. Please check and try again.';
      case 'invalid-verification-code':
        return 'The verification code is incorrect. Please check and try again.';
      case 'invalid-verification-id':
        return 'The verification ID is incorrect. Request a new one and try again.';
      case 'quota-exceeded':
        return 'You\'ve reached the limit for this action. Please try again later.';
      case 'email-already-exists':
        return 'This email is already registered. Please use a different email address.';
      case 'provider-already-linked':
        return 'This account is already connected to another provider.';
      case 'requires-recent-login':
        return 'You need to log in again to perform this action.';
      case 'credential-already-in-use':
        return 'This login credential is already used by another account.';
      case 'user-mismatch':
        return 'The credentials don’t match the logged-in user. Please try again.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with this email but different credentials.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new one.';
      case 'invalid-action-code':
        return 'The action code is invalid. Check and try again.';
      case 'missing-action-code':
        return 'Please provide a valid action code.';
      case 'user-token-expired':
        return 'Your session has expired. Please log in again.';
      case 'invalid-credential':
        return 'Wrong Email or Password, Please try again.';
      case 'user-token-revoked':
        return 'Your session has been revoked. Please log in again.';
      case 'invalid-message-payload':
        return 'There\'s an issue with the email message. Contact support for help.';
      case 'invalid-sender':
        return 'The email sender is invalid. Please verify and try again.';
      case 'invalid-recipient-email':
        return 'The recipient’s email address is invalid. Please check and try again.';
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template is missing the iframe source.';
      case 'auth-domain-config-required':
        return 'Please configure the auth domain for verification links.';
      case 'missing-app-credential':
        return 'The app credential is missing. Provide the correct app credentials.';
      case 'invalid-app-credential':
        return 'The app credentials are invalid. Please check and try again.';
      case 'session-cookie-expired':
        return 'Your session cookie has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The user ID you provided is already in use.';
      case 'invalid-cordova-configuration':
        return 'The Cordova configuration is invalid. Please check and try again.';
      case 'app-deleted':
        return 'This app instance has been deleted. Contact support for help.';
      case 'user-token-mismatch':
        return 'The provided token does not match the authenticated user.';
      case 'web-storage-unsupported':
        return 'Web storage is not supported or disabled in your browser.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with this API key.';
      case 'keychain-error':
        return 'There was a keychain error. Please check and try again.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Your login credentials are invalid. Please check and try again.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}
