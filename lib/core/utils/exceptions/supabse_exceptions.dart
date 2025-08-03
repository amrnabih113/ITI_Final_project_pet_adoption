/// Custom exception class to handle various Supabase-related errors.
class MySupabaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  MySupabaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case '400':
        return 'Bad request. The server could not understand the request due to invalid syntax.';
      case '401':
        return 'Unauthorized. Please check your API key or authentication token.';
      case '403':
        return 'Forbidden. You do not have the necessary permissions to access this resource.';
      case '404':
        return 'Resource not found. Please check the requested URL or resource identifier.';
      case '409':
        return 'Conflict. The request could not be completed due to a conflict with the current state of the target resource.';
      case '429':
        return 'Too many requests. You have exceeded the rate limit. Please try again later.';
      case '500':
        return 'Internal server error. Something went wrong on Supabase\'s end. Please try again later.';
      case '503':
        return 'Service unavailable. The server is temporarily unavailable. Please try again later.';
      case 'invalid-api-key':
        return 'The provided API key is invalid. Please verify your Supabase API key.';
      case 'invalid-auth-token':
        return 'The provided authentication token is invalid or expired. Please log in again.';
      case 'user-not-found':
        return 'No user found with the given credentials. Please check your email or user ID.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-password':
        return 'The password provided is incorrect or does not meet security requirements.';
      case 'network-error':
        return 'A network error occurred. Please check your internet connection and try again.';
      case 'permission-denied':
        return 'You do not have permission to access the requested resource.';
      case 'table-not-found':
        return 'The requested table does not exist in the database.';
      case 'column-not-found':
        return 'The specified column does not exist in the table.';
      case 'duplicate-key':
        return 'A record with the same unique key already exists.';
      case 'foreign-key-violation':
        return 'The operation violates a foreign key constraint.';
      case 'row-not-found':
        return 'The specified row does not exist in the table.';
      case 'invalid-query':
        return 'The query syntax is invalid. Please check your query and try again.';
      case 'missing-auth-header':
        return 'Authentication header is missing. Please include the required authentication information.';
      default:
        return 'An unexpected Supabase error occurred. Please try again.';
    }
  }
}
