//code 1 live
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:googleapis_auth/auth_io.dart" as auth;


class PushNotificationServerKey {
  static Future<String> getAccessToken() async {
    final serviceAccount = {
      "type": "service_account",
      "project_id": "chatapp-9bc9b",
      "private_key_id": "1a5e413657a6a2d6e9fd8b04c395cad1d8dc4e48",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCyhCPklG8QmaEr\nZfDDyI3s+r5RY7snh/WyksHZI6aFaiWuYkZRRJJzKsO9JKJtHZNG+ew7F+Zu/IcR\nt9j3UWvhfAXbJHH3fef1b8KrIr/XH9wUM0+rm4/DLMPCb2ZMIGCRE2hBwSCTx4CW\nalPn6OKvmJldKk/dvwQnzNN0tcNnPt8sTdvqnq6GYlhH7uK8zvgtUOxfo8sYbNio\nr9zfiZ0wXPbmDejUfSvSnLRKC8uHUYC3CWPNLyEertPRSGVpgRKp3S7P7xZwBAoV\nlOqvJ+SJc2+0hLpbCd0sE0f6x3SzvMLlMF1yqiA+8SxcQVraJuvhk8sP42c8aaAR\nA0Xvv4bVAgMBAAECggEAAuV0ieYGtkgILq5GzAjvN6UCFyikjSJvu65ypaegcS13\n0XMk3shyx+v5Z8yhv4z2fq9IO4+qgN76gHxXJbbQoO1C87KkSnI7767qcfr1JYhZ\ngEU4NtmgQHfWnvnCrUpgu815jitfpK+cvehfIi1DFwEz4ihfstmqGntMDuTDyYBb\nW+oPj2F81KpjXGtkGlL6WsPJpRfjRgefDYehB10S0xUjAlTd4tI6Oqtb+pbKuIAz\niRLhF1LiIRoEclPMqIdL9W/D2qLCi6AB+EDMl6YuPkQUaE6MneXRZaa/iO0UWqsA\naVztYCTqOmZ/cClghk4/5xhqBCxI2g66tIIE0A6zyQKBgQDvjoc2ekcAO2cls44B\nHyUEuRiRHWAd/531w5XloWsvpsYqnk63FUgTE5Fl/kJdBFCbELJ2mrPqOE0D46qu\nxTR1dgwm0MtHIzFJqL4JFhzYzaeugZXH5M9fe93beo0RCAzDc003R2qb0vIl2FD8\nTjTO3umZFF6Qd0IGIVf7em+vrQKBgQC+xQMOWRpiM/JjEW/Ume3V28oqGH1s2DM5\ntSQH48gR3lMHcEB/CQAr/mGcPQkFn2poRHlvoTn+9wZh8XxRGTiu6GeL2RrkDLU2\nt97CdB/kYGYNOBv132K1ipI8cYwFmtjZDHprvLOk3tyCeW8JLicQOip/2QG3fijx\nwFl1ezv4yQKBgQDKycagUUaFZcPdYHAXdvvpUZ8ASPOysU5QW28q4khQIEekkDpm\nNbe7nlb5FhGrmBl8CthoGnGvFlXrsvAr3niX7oQ+34UVBS+WAShNnNBynzURPlVC\nz+jUFZErWETOZBgZ5CM7ZlNS8XFWpBV6X+HINV9d3KZoeOwFMHjAQ1cESQKBgDeV\nQYGxtn08c3goAXRpcSGpi2refdTz3WEIBTqDRKzoITr+mtworDMlSB10rydDPoao\nxNUgnbxLD0IEUVtzxM85icn2dN5TUY1i33W6zfwFllZtrb/i2WjZuigAUXLkniAH\ngbfYYGM+R/OAHDkJiHoy6GUdvmFPUfC2QZp4UI35AoGBALhbXD1z4VAWMNNuU06f\nCgrr/GGbrSsCAiWqIfjYw8Eszl4YR6fZSUakRMSGXuyhnXmFYKflfxMmDpHtq6o7\nQA5rufVvFRFCw5SkhlWcr9uoCmu8YSX5rtlSaVFNOyfQUObNVpMWG/VFwf5rqYxI\n7ZYK68NuKZK0vJ9C/svx+XW+\n-----END PRIVATE KEY-----\n",
      "client_email": "chatapp@chatapp-9bc9b.iam.gserviceaccount.com",
      "client_id": "103058815109431064888",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/chatapp%40chatapp-9bc9b.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    final scopes = [
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    var client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccount), scopes);
    auth.AccessCredentials credentials =
    await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccount),
        scopes,
        client);
    client.close();
    return credentials.accessToken.data;
  }

  static Future<String> sendNotificationToMultiple(
      BuildContext context, String tittle, String body, String tripID) async {
    String response='';
    try {
      final String serverKey = await getAccessToken(); // Your server key
      final String endpointFirebaseCloudMessaging =
          'https://fcm.googleapis.com/v1/projects/chatapp-9bc9b/messages:send';

      // Prepare the notification payload for FCM v1
      final Map<String, dynamic> message = {
        "message": {
          "topic": 'all',
          "notification": {"title": '$tittle', "body": '$body'},
          "data": {
            "trpid": tripID,
          },
        }
      };

      // Send the notification via HTTP POST
      final http.Response res = await http.post(
        Uri.parse(endpointFirebaseCloudMessaging),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $serverKey',
          // Using Bearer token for v1 FCM API
        },
        body: jsonEncode(message),
      );

      // Handle response
      if (res.statusCode == 200) {
        print('Notification sent successfully');
        response = "Success";

      } else {
        response = "fail";
        print('Notification failed: ${res.statusCode}');
        print('Error response: ${res.body}');
        // return false; // Notification failed
      }
    } catch (error) {
      print('Error sending notification: $error');
      // return false; // Notification failed
    }
    return response;
  }
}

