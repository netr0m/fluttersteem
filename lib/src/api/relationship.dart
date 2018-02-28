import 'dart:async';
import '../models/models.dart';

/// An abstraction to extract relationship information from Steem
/// https://v2.steemconnect.com/docs/steemjs#api/
abstract class SteemRelationshipsApi {
  /// Get the list of users this user follows
  ///
  /// follower - Name of the target
  /// startFollowing - Used for pagination
  /// followType - Usually 'blog'
  /// limit - Limit the number of matches returned
  ///
  /// https://api.steemjs.com/get_following?follower=NAME&startFollowing=NULL&followType=TYPE&limit=LIMIT
  Future<List<User>> getFollowing(String follower, int limit, {String startFollowing, String followType});

  /// Get the list of users this user is followed by
  ///
  /// following - Name of the target
  /// startFollower - Used for pagination
  /// followType - Usually 'blog'
  /// limit - Limit the number of matches returned
  ///
  /// https://api.steemjs.com/get_followers?following=NAME&startFollower=NULL&followType=TYPE&limit=LIMIT
  Future<List<User>> getFollowers(String following, int limit, {String startFollower, String followType});

  Future<Relationship> modify(String action);
}