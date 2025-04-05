import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:uuid/uuid.dart';

class PushNotificationService {
  static Future<String> getAccessToken() async {
    final serviceAcountJson = {
      "type": "service_account",
      "project_id": "caffeine-cafe-47df1",
      "private_key_id": "86a8a8c68d42d36a33f20bb681674f0933cd6929",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQD2e59h++V0y+xr\nJl/G+wzpkXpuEcwGN3o72mgVxsIAoo2PX2AgGZU0S+RnkA3ocjhqVH+j4vrLyGH3\nsAXM3gDMYVl2IEea9Klo2f7bdbRfEtovlGiFG0w4X4D1WDfRy52eIf2LodSYEpgn\nm7iKZpncXNNC+mcAA15eplFAbpydKDmOoAKfDUSluFySURV4z53Db32R2GxQ/ZHX\ndAg5B4oiBIg3XEamygg+J7DsGCUIcgqTB6wl6kaWvlJFM7pkljmp8jcUyaw7lw63\nAG4gIO1R0mZJWqSnOruIXRUBNE12uVh/fk3HAOVCdywDRrZJWP0qGCjYCl2Nc+Fi\n4m+2GzZxAgMBAAECggEABEpIzwhsGSKLBrRBaW8uzXpzzHUTbWjGCthoJHfkDNAy\nK/848boW7x+iizxrnOKvEXJk0dtmVN7JI2nn4fCGcvLp/xdm/lRuRfCkbK626+A3\na2msgOOa9HtnZ9h9c+b/bcm8QL55etz4/cMqZ5X2Aorxk5T+7wtqoeBdzJlYRm0h\n8QY72l28mjPeAerB6PAFjp0r3wjhK7pYniTscISVUudxyAGTzvaxtGNf3VPGXPTG\nPAcWviiHkKaoun8APCoY32bZG7OUqWCPq6r3uSsmTETFXfE40+clXbSceErKexW2\nUHs59NEehvWPz0SSb/57Rwcd/z0CqSUyi2J8aFdCmQKBgQD8pHUy+8hK4//xft1z\nQWZLYasWyLeKDHbSyk3d/F3SR3jzH23seXhz8okwCMTeaeo3PJUIMdMEtKkf4SJP\nfXySUQWVpJ6uJLhpHjEL4+U3D6rpatgjt08XN3gsfA/IrPh/rLy3twK41EfBJ7sd\ndXEi1ZN2vSPFs7ySwu0EfejwmQKBgQD5wjV2FJBN5ohMTcUedKgTta2Dh+fYCq2D\nLfrvhFnvLTGhunG8n6RyXHOlycZ+FXPkszOoTWMXA/LBo9+7Jw+L3+bqO7ayp9Vs\n7PvrI7cyw/eGSNGuxoB3fjRXo9barRPXGyRO9S9/SjrNdr2uYEpZvl3Fimij6mR7\nG38CD4KjmQKBgQDKXrHCdQyrcJbDyut4NxrJpyJ0zbK3UeScVJCrEEvW9Ildtf9H\nPMXPmqdpYpzPy+dg95YpSj/NtSkD8EKbidkPGvduNr8knyVYjmabL6GbyWEOOBeK\nBHvGDRimCXpbNLKZErTYNDBp/SC9CCZKIpjNXmcQ5dCRvLeAl8NjpbfBgQKBgEPM\nAjMhdeKPl6QO4FlaFV30TTuNItQ0YdFgI+Psq3UPcY+TStiHBV691e7FDQqgzCri\nsj0XdLSEr9r8nvjwq3mut8IRn5Bzmq3Mzr2PnmU7aO+cyL6Gx8yoB5FaujH2FZKo\nnXyJdfE5tyia+PZi0Qv3bwD2h10nfUsltZ5bk3zRAoGAJJK8jS8UAOivPZ4Ob39R\nXJk21ECThGmX1AHG2haRKsh5ii6MXXECCfUXXScEh48IceXl+TYpbns0a07E5mk2\ni4BTZbyvKE6isPIP7kQ9GXZ1OhPWGE2LDi3+XRqvKszo2rt94lOiL7IktbgsCl9e\nCxZEdRBjOE7OKmUg3hHqPXU=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-fbsvc@caffeine-cafe-47df1.iam.gserviceaccount.com",
      "client_id": "110338329884062569934",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40caffeine-cafe-47df1.iam.gserviceaccount.com",
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

  static sendNotificationToAllUsers(
    String tripId,
    String messageTitleEn,
    String messageTitleAr,
    String messageBodyEn,
    String messageBodyAr,
  ) async {
    final String serverAccessTokenKey = await getAccessToken();
    String endPointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/caffeine-cafe-47df1/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'topic': 'allUsers', // Use the topic for all users
        'notification': {'title': messageTitleEn, 'body': messageBodyEn},
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
      try {
        CollectionReference notificationAdd = FirebaseFirestore.instance
            .collection('notifications');

        DocumentReference newNotificationRef = notificationAdd.doc();
        var uuid = Uuid();
        await newNotificationRef.set({
          'titleEn': messageTitleEn,
          'titleAr': messageTitleAr,
          'bodyEn': messageBodyEn,
          'bodyAr': messageBodyAr,
          'id': uuid.v4(),
          'date': FieldValue.serverTimestamp(),
        });
      } catch (e) {
        // ignore: avoid_print
        print('Error saving notification: $e');
      }
    } else {
      // ignore: avoid_print
      print('Send notification failed: ${response.statusCode}');
    }
  }
}
