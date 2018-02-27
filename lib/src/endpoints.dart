/// The URL to access in order to receive a SteemConnect auth token
final Uri authEndpoint = Uri.parse('https://steemconnect.com/api/oauth2/authorize?');

/// The URL to access to exchange an authorization token for an access token.
final Uri tokenEndpoint = Uri.parse('http://localhost:8000/complete/steemconnect/');