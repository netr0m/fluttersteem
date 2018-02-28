import '../models/models.dart';
import 'reply.dart';
import 'user.dart';
import 'post.dart';
import 'vote.dart';
import 'tag.dart';
import 'relationship.dart';
// TODO: Finish importing

/// An abstraction to extract information from Steem
/// https://v2.steemconnect.com/docs/steemjs#api/
abstract class SteemApi {
  /// This is the client's access token
  String get accessToken;

  /// The user who is logged in for this session
  User get user;

  /// An abstraction to extract comment data from Steem
  SteemCommentsApi get replies;

  /// An abstraction to extract post data from Steem
  SteemPostsApi get posts;

  /// An abstraction to extract upvote data from Steem
  SteemVotesApi get votes;

  /// An abstraction to extract relationship data from Steem
  SteemRelationshipsApi get relationships;

  /// An abstraction to extract tag data Steem
  SteemTagsApi get tags;

  /// An abstraction to extract user data from Steem
  SteemUsersApi get users;
}