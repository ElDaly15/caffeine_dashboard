import 'dart:convert';
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class PushNotificationServiceForOneUser {
  static Future<String> getAccessToken() async {
    final serviceAcountJson = {
      "type": "service_account",
      "project_id": "demons-c7b11",
      "private_key_id": "d1960665d34b22eee07ec0f230e4f96de8e68bb9",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDEwzC+XvifSzEk\nzuRqWfDJ0cr1SUtQKz4Z1S+P/tCDegAX4yvAKorW61HW5ZBT9oXqcDoMDdmv4/qx\nu3FeREAbR0tPpD866MfMEPDPUWY53kz4SDFHu1w7/kv2l1bz3f0rTQPehevsh4r/\nNBrGgt7qvziyA+gPeF4cPoKGbE0afDv988jdwFBo8FKzf6wlOOIBa9Z6rSORVIfh\nJyhLCeU8fdkVHh0hXriisMBcZ1t35Allqztqd8enhm434PFmk2YhLLQeQM/8NEuf\nA2dLs+OvVeJzNTGux/fz8m2OflHiQMFtatw5OLyC+qbS0Pkkrdauj7UJgcUZHGSr\nEcSP8ynzAgMBAAECggEACN/UK886amt97hmQuW/mCXbiBFnHwPgPpyLzhWHqQ0vL\ng52g2bFxgqD+whunfJ9NSetsNXf4c1OWeSapmyVRON8TI/vrSCZl6yvGbgCkr4PP\nDTxVpf/AI1/kSt0SNGc05cY69ZyCWAWC/OCmO9bSOVyM25E2ibVq6ojdN9/cQw9M\nDuGjAa1ct70IRkW9g21iyhDsHyUc0eET19ZX/cwJ0EuWyh9YfPXI0Q7pkHuB8veU\n2e4kzS9FRkTSv12C8FHqSSMXOx61roWtOcaSAHUWWXLuRBZ4pqIUEVDEBpPIzLGQ\noQr6Ae1OajbgGhK2WxosCl9iPv0XOX+RQXwKgth40QKBgQD0iQcsBSYkrnXFDL5d\naB+hbYHGAh5JQhlUQybY1/qubWZAIXOXj1GmmpJbWHeZKzwaxlr7WB0Z982/fuZK\nrvrptQsLBzu9H7sTqkEDSHoHTP/7hRydKK/jJ9UqrD3pDgQfrMf6Fyt9ahljFCrK\n1VEiVlHSP0IinYaTJO0/zS1JwwKBgQDN/MgS2grqSX2n2lfz24V3ErSCeHrgzktv\nliHt4ygw57Y6VAj8zcXXBY7yLob3/7Onh73y2Kb/maC4LOkwEFau8H6H1BdSaWXL\n/Qie2J8UW9+XP6zN4N5h9c1DZxFOIG9iom39d2CMb8uSGdXDkRhx1wsB84Rl0f7A\nW0oBh7FsEQKBgQDYdwxwPUacpgr+md9SFEAbyDJes7VXqDl/y8nxno78JT+keXg3\nq9jdoGr6jX+hiRI1qW0UndV1DVWGtLDrX6Yhh+/0nTyWmCYkrEvMujW7jL/1SMoh\nnMjGTpZ2pe5QBeZEm9CSZDxNUsSSXmHbF6YwvTTE5taGied9De0u01PJvQKBgFU7\n2dXjH00ep74C3Q3ssec5eDPcgovvEMvVhaiXrBPAbWjpSObChrCYfjO8COEpjz8t\nLe4Es+Vjvls3Si43NIciwFiX7CaPsi2cQCrqW7ji4zwEfw6Zk6tZOFxBk6mORki8\nCWMuOGckA0orIobPzRud7dIa35f6Mr2JiK/lZAbhAoGBAIMTMZvgN2imrvTegrgV\nFwQOMBVVZgpZu3j2SkLjTRnwLE9q1bj5xlQspjUe1FGV7bdxs8nxAFUCTsiyPIpL\nTRhpOJDGal2nfnmz4oE4BHNs63qyeq5DbWpmpp/u7Gh7jGvxOurpvQoS14Pz0oh+\nN1tyrGOu7xeplXxw/SXLcz2U\n-----END PRIVATE KEY-----\n",
      "client_email": "bytehive@demons-c7b11.iam.gserviceaccount.com",
      "client_id": "115912525646103320231",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/bytehive%40demons-c7b11.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAcountJson),
      scopes,
    );
    // get the access  token
    auth.AccessCredentials credentials = await auth
        .obtainAccessCredentialsViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAcountJson),
          scopes,
          client,
        );
    client.close();
    return credentials.accessToken.data;
  }

  static sendNotificationToAdmin(
    String deviceToken,
    BuildContext context,
    String tripId,
    String messageSender,
    String messageBody,
  ) async {
    final String serverAccessTokenKey = await getAccessToken();
    String endPointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/demons-c7b11/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {'title': messageSender, 'body': messageBody},
        'data': {'tripId': tripId},
      },
    };

    final http.Response response = await http.post(
      Uri.parse(endPointFirebaseCloudMessaging),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey',
      },
      body: jsonEncode(message),
    );
    if (response.statusCode == 200) {
    } else {}
  }
}
