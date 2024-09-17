import 'dart:developer';
import 'dart:io';

import 'package:taxicash/exceptions/auth_exceptions.dart';
import 'package:taxicash/repository/authentication_repository.dart';
import 'package:taxicash/services/secure_storage.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';

class Web3AuthenticationRepository implements AuthenticationRepository {
  // initialize secure storage
  final SecureStorage _secureStorage = SecureStorage();
  @override
  Future<void> clearSecureStorage() async {
    /// delete all in secure storage
    await _secureStorage.deleteAll();
  }

  @override
  Future<void> login({required String email}) async {
    try {
      /// initialize [Web3AuthFlutter]
      await _init();

      // login with email passwordless
      await Web3AuthFlutter.login(
        LoginParams(
          loginProvider: Provider
              .email_passwordless, // login provider option => email with no password required
          extraLoginOptions:
              ExtraLoginOptions(login_hint: email), // login email address
        ),
      );

      // get use info
      TorusUserInfo info = await Web3AuthFlutter.getUserInfo();

      // uid from info
      String uid = info.idToken!;

      // get private key
      String privKey = await Web3AuthFlutter.getPrivKey();

      // persist uid and private key in secure storage
      await _secureStorage.persist(uid: uid, privKey: privKey);
    } on UserCancelledException {
      log("User cancelled.");
      throw LoginException("user cancelled");
    } on UnKnownException {
      log("Unknown exception occurred");
      throw LoginException("unknown exception occurred");
    }
  }

  /// check if secure storage has private key
  @override
  Future<bool> hasPrivKey() async {
    // check secure storage for priv key
    return await _secureStorage.hasPrivKey();
  }

  /// [Web3AuthFlutter] initializer helper function
  _init() async {
    Uri redirectUrl;

    // TODO: get client id from environment variables
    String clientId =
        'BPi5PB_UiIZ-cPz1GtV5i1I2iOSOHuimiXBI0e-Oe_u6X3oVAbCiAZOTEBtTXw4tsluTITPqA8zMsfxIKMjiqNQ';
    if (Platform.isAndroid) {
      /// if platform is android set redirect url to : [w3a://com.example.taxicash/auth]
      redirectUrl = Uri.parse('w3a://com.example.taxicash/auth');
    } else if (Platform.isIOS) {
      /// else if ios set to : [com.example.taxicash://auth]
      redirectUrl = Uri.parse('com.example.taxicash://auth');
    } else {
      /// else unsupported platform | throw [UnKnownException]
      throw UnKnownException('Unknown platform');
    }

    // set initializer configuration
    await Web3AuthFlutter.init(Web3AuthOptions(
      clientId: clientId, // web3auth client id
      network: Network
          .sapphire_devnet, // network | dev for development | set to mainnet in production
      redirectUrl: redirectUrl, // redirect ur
      buildEnv: BuildEnv
          .testing, // build environent in dev | set to production for production build
      // 259200 allows user to stay authenticated for 3 days with Web3Auth.
      // Default is 86400, which is 1 day.
      sessionTime: 259200, // session token expiry duration
    ));

    await Web3AuthFlutter.initialize(); // initialize
  }
}
