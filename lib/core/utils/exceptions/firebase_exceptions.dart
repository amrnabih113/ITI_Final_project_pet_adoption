class MyFirebaseException implements Exception {
  final String code;

  MyFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown error occurred. Please try again later.';
      case 'invalid-custom-token':
        return 'The custom token is in the wrong format. Please check your token and try again.';
      case 'custom-token-mismatch':
        return 'The custom token doesn’t match the expected audience.';
      case 'user-disabled':
        return 'Your account has been disabled. Please contact support for help.';
      case 'user-not-found':
        return 'We couldn\'t find an account with that email or ID. Please check and try again.';
      case 'invalid-email':
        return 'The email you entered is not valid. Please check and enter a valid email.';
      case 'email-already-in-use':
        return 'This email is already in use. Please choose a different email.';
      case 'wrong-password':
        return 'Incorrect password. Please check and try again.';
      case 'weak-password':
        return 'Your password is too weak. Choose a stronger one.';
      case 'provider-already-linked':
        return 'This account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'invalid-credential':
        return 'The provided credential is invalid or expired.';
      case 'invalid-verification-code':
        return 'The verification code is incorrect. Please check and try again.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid. Request a new one.';
      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication with the provided API key.';
      case 'keychain-error':
        return 'There was a keychain error. Please check and try again.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'invalid-app-credential':
        return 'The app credential is invalid. Please provide a valid one.';
      case 'user-mismatch':
        return 'The credentials provided don’t match the signed-in user.';
      case 'requires-recent-login':
        return 'This action requires recent login. Please log in again.';
      case 'quota-exceeded':
        return 'You’ve exceeded the usage limit. Please try again later.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with this email but different credentials.';
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template is missing the iframe source.';
      case 'auth-domain-config-required':
        return 'Please configure the auth domain for the verification link.';
      case 'missing-app-credential':
        return 'App credential is missing. Please provide it to continue.';
      case 'session-cookie-expired':
        return 'Your session has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The user ID is already in use by another account.';
      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled in your browser.';
      case 'app-deleted':
        return 'This Firebase app instance has been deleted.';
      case 'user-token-mismatch':
        return 'The provided user token does not match the authenticated user.';
      case 'invalid-message-payload':
        return 'The email template message is invalid. Please check and try again.';
      case 'invalid-sender':
        return 'The sender’s email is invalid. Please verify it and try again.';
      case 'invalid-recipient-email':
        return 'The recipient’s email is invalid. Please provide a valid email address.';
      case 'missing-action-code':
        return 'Action code is missing. Please provide the correct code.';
      case 'user-token-expired':
        return 'Your session token has expired. Please log in again.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please check and try again.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new one.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check and try again.';
      case 'credential-already-in-use':
        return 'This credential is already linked to another account.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}
