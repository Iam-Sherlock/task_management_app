import 'package:googleapis_auth/auth_io.dart';

class get_server_key {
  Future<String> server_token() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "task-management-app-c3f75",
          "private_key_id": "61a5996e7289c0eea3cec0c0bb3eb0bbd42afc30",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDB8trGsXs1YkFz\nwHtEoyFsI8NJ3eZjwZy0TalwfDcyLALtaZwy0lse2r/zeH1rHoQbX3bMYOVf3xQU\nb/LsAMAB2v8JS3yMdVb4j5Uc1AZgFLdj0zcmB1yKu233l4+waGgNFxS/hzS9mZsa\n7T211ObtAhlMoWer4B9Ea0t9YJDQmZ6gzr31e+1empNvtqlwjafzBqkLFVELGhRq\n+QBJwSWveU8x0lf/kOLwsUCFUYMDBYQ093DaXeje455+5dLmrE4OCO/fMRuLCaTX\ncl22kXa5jAicBhSEhMJFTO4cnuiIPu1HD6yrvR89hybHayjIByXSYr0Z1XsztnVP\ntZwG+GzJAgMBAAECgf9PtLP0XubOVEhR1GjUbGDv8EKcY3VWHzDSE0NEgcgCoSkS\n017orp/ZWPefN4VTiyxU6NwJt53h00E3+kn7Hikf72r13EVInsXUoNgcYNu94MWo\nC3A+pgfXe++q276m4Ow3dPox5tQ7QfAHFjimNuOFw7cMpx3T+jzfVrj6GGrApFO+\ntUtRjczkB79V/v88uZ+/mzuUk8goqy0DZgAVt2HJAj8uSCcnSubxdMhEzklHsTR6\nOArz+r+v8UY/MOL1LwVwlfAKlpdp18a5FnJM0CozCUlVEAnPyKAzOe1L3COEHZp+\nWSmsmAH/2BivIVLSVO54WRf85oLFYwLwQg/pXsECgYEA+c5YCEuS7fiHidhKJVI9\n/Y0P5iv+Iau6GVaKyhLeS8o1lIc8/VkS4NwxI9vAHm1HyqGv+lMhRIQ1RH1eHksg\nsI7oFy/a0AMHfEvEDlu02ImS/lE3kCh2CBEZybCdRiWRbHEwQCo9JRIAPqatpdjY\nPJb+mHwToHoiEv1Rg1rxVYkCgYEAxsH0B2rP3mFQ2dwt9jftqKM/tB8fOb9oFp6k\nUaEeWB4alwYqseX9uIIjtRtPw3npj2Q35tnp7UAo0WI8QPg+gu/p46EubmdrpTER\nj2ZleSapsHrTSvoLbrXtsBO19JtxfvKUujbdHR/SgqxN99k1zDXyIZGA+GtbH4cq\nZ/LbzUECgYEA7Q5TnAubsxhWBwmp0yDokuR6YgL9dxZv0/u8WWbubR3HGtv7lLAi\nqiBKwayX9EfgCPrG9NZOi6aqpgQSfMzuiJ4UwWw4SY2WXO3Jb5a3V4W2aIDKKZM7\n7wvLXQqtNRQRnMcM8tcijzs14D5sKyZMjbL8h9e3CGLeUwbxg6WZv4ECgYBMcMme\nlKjPeRP0RebzW/0uL2LPrmx+9CtfD7JYpqOZ9jH5xWhkNPUIohyDibZ6koeOG1gY\nk9SQ520LYkGUJyU7jHOilRnbYjEXPjDnutTp7EG02vgqTNJayONaJaqEIchbr4Yd\nu/38NoHqucPev44eNN0jpec5I2jPTlez1MZOQQKBgQCjRVXYxbl9Zq92RGOg14Sj\njyrruN/fYZR0cVR1UlMg6HD2PdH5hQSI+d+YJp7XQMDc2H0BXMyhN2ojTR8SZ0ai\nPvkXun18omNQTLtEI/xg0zZ3o2RNvJ0ZxYZ6Eh/HVxwdryCsZGtA+IvJQAZe0QEt\naOyWeTnHQlmeXxdanb5C8Q==\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-fbsvc@task-management-app-c3f75.iam.gserviceaccount.com",
          "client_id": "117266505445554190643",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40task-management-app-c3f75.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes);
    final accessserverkey = client.credentials.accessToken.data;
    return accessserverkey;
  }
}
