class AuthenticationResponse {
  final String _uid;
  final String _privKey;

  AuthenticationResponse(this._uid, this._privKey);

  String get uid => _uid;
  String get privKey => _privKey;
}
