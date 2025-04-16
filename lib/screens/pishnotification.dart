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
    }
    ;

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

  /*static Future<List<String>> fetchFcmTokens() async {
    // String url = ApiConfig.BASE_URL+'getUserType_FCM.php?status=Employees';
     String url = 'http://183.82.54.222:8080/SunriseInfraProperties/getUserType_FCM.php?status=Employees';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> data = json.decode(response.body);

        // Extract FCMToken values into a list of strings
        List<String> fcmTokens =
            data.map((item) => item['FCMToken'].toString()).toList();
        return fcmTokens;
      } else {
        throw Exception('Failed to load FCM tokens');
      }
    } catch (e) {
      print('Error fetching FCM tokens: $e');
      rethrow;
    }
  }*/

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
          //"token": deviceToken, // Token of the target device
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
       /* QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: "Notification Sent Successfully.",
          onConfirmBtnTap: () async {
            Navigator.pop(context, true);
          },
        );*/
        //return true; // Notification sent successfully
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
/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import "package:googleapis_auth/auth_io.dart" as auth;

import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class PushNotification {
  static Future<String> getAccessToken() async {
    final serviceAccount = {
      "type": "service_account",
      "project_id": "sampangi-reality",
      "private_key_id": "1f2deed9817f2c39c2ed5a6ca45284ed283710ac",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC5bZM5AkhRk4dN\n2pUKYlFCjw5BXG5XEgkuQQ1z+yrhj4gkMo64+dLVXmWOw2mb+hRsYxS2zrjK7y/Y\nvJs89hl7E/XAkaWgwHwkdqO5RvAIiI48Vdml/65g2tY4fvnGpX524bOIEc9HjZlv\ndNRXslOjmJN8tQBEr/BmjmwlPMhTM5xEyxXgejk8qlBHBGhd9bFYYU/+Ynoq+NPf\nJzWeiEqgPMjDHaATFnCBtLLLSuNlRMi4lsdrZr7HHpWCV9QEs3tzJ14sZrxC0iBa\nYawFCFgh2NlcUxdAPSIJXxkYjuXdrNap+pcv6fLd8lDwtdVpC3mkv4vxsn8fAfS2\nkebTwgPBAgMBAAECggEAUX4lRlhI9UUroV0vxFUKVoCtqK8ZNT4Rd9kSMwdPRLuC\nfzoS/Jua+7gVVSVvrCO/xxTSfTckAtgVBKF7blLQRwWyK1Q3YQtHY/UaJmrVQkLV\nlBG86lYQyrNSk5jGaHXCOzgdYW9GVDGYneHQEsymMo9zPksEF6vlMQVl5QWuGtYi\nTcD405KOfnJmfpzhwgE4MXCfoRWXtOlNTUUZwXwmoPuH9UmFuGj0Hs7oviQDaD9h\nEQ7Wp5BEL46LJFgKGH3JBY2ZSpmbUDngs6mUdpBnordgPKu3GF5gLEI55kGlnKJs\neuBE346qUBAh2MkE/CkrPeohaHdonA9PVFuO1IC9awKBgQD3MVBJvsPXcz3/CO2M\nJF50dVR7fD9Cu03Mqp2IhsdXGTtI0Le0sVkh6CkFPhKtmWGP0RE2i6Vh5DIlwIV7\nJzqxFswjsdAL7rRsM+/mBl/PpKCToHh2qCsZeMnHMs+HSzfe4sreTbEHiK/jZlva\n0OcC+O7aW4Ear2/kcvj90aUTBwKBgQDACOVbN3Zy/DukYJ7oSYJ0pkif0nrPkK/2\nrnvPecgWYYTQOLUvAfSD6tKfV/JE5SCWZifyC1R8UiEx1IVJpf0jjM3uVAGXZPrC\nvn2usFeEJW6I5qDlidT55e/QGHVRueydP/uL9vU96jqxC+I2quCRbrpyxOEgpFlS\noVCKnawY9wKBgQDLIGzXjLkl7H8/ebiqdqBflqLLrnfVgFEYJAO70vUvr342Ab1T\n8IBMCpjaw/1ZRjcTlTtN1UcbwActWpzVbJEgQJmTo2RQyeDdIXi7TvWgjameZjlX\nWC3Ciq1U0X4TsU3CDB+kubcFd98BQHWuxAdxO9oa+SKIKS4LTicpfALoNQKBgDoW\ndspQzJObmK7wSyEYm02NvwoZMOz4Z0HHJcxsmgmrFfGmNagyfzQoI+3vPGl6pZDY\n9dxRcQzqCwB3uJm+jAPk46Xj41dYREIEPSBKVy6x4+2lVaYZO0McOp5Hx7Ug+GHY\nqM59tVE1OOu1HIhMyAE17VAqHa8yB5LnGOXVK+mhAoGALzx8u2Q2+KmlSQudrn42\nQYoACxPOBjSrxuLIyGFfQ0oOA53n1KpyPkugLrg+Zh1ywXBnDG/b/tHwGlmP1Xpy\n8n1wAEtrPdyOawaJ8oCBCz7BUnOVoYhQVM9TV8stJeQHBlaP1+BvVhofoofu+BMj\njijwseRFZUCbOpDT6aKFutY=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "sampangi-reality@sampangi-reality.iam.gserviceaccount.com",
      "client_id": "110500237152389010324",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/sampangi-reality%40sampangi-reality.iam.gserviceaccount.com",
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
    String response = '';
    try {
      final String serverKey = await getAccessToken(); // Your server key
      final String endpointFirebaseCloudMessaging =
          'https://fcm.googleapis.com/v1/projects/sampangi-reality/messages:send';

      // Prepare the notification payload for FCM v1
      final Map<String, dynamic> message = {
        "message": {
          "topic": 'all',
          //"token": deviceToken, // Token of the target device
          "notification": {"title": '$tittle', "body": '$body'},
          "data": {
            "trpid": tripID,
            "screen": "AboutUs",
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
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          text: "Notification Sent Successfully.",
          onConfirmBtnTap: () async {
            Navigator.pop(context, true);
          },
        );
        //return true; // Notification sent successfully
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
*/
