class MySocketExceptions implements Exception {
  final String code;

  MySocketExceptions(this.code);

  String get message {
    switch (code) {
      case 'socket-error':
        return 'Network error occurred. Please check your internet connection.';
      case 'connection-timeout':
        return 'The connection timed out. Please try again later.';
      case 'host-not-found':
        return 'The server address could not be found. Please check your network.';
      case 'connection-refused':
        return 'The connection was refused. The server may not be accepting requests.';
      case 'network-unreachable':
        return 'The network is unreachable. Please check your internet connection.';
      case 'address-not-available':
        return 'The address you are trying to reach is not available.';
      case 'no-route-to-host':
        return 'No route to the host. Please check your network settings.';
      case 'failed-to-connect':
        return 'Failed to connect to the server. Please try again.';
      case 'connection-reset':
        return 'The connection was reset. Please try again later.';
      default:
        return 'An unexpected platform error occurred. Please try again.';
    }
  }
}