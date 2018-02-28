import 'dart:async';
import '../models/models.dart';

/// An abstraction to extract relationship information from Steem
/// https://v2.steemconnect.com/docs/steemjs#api/
abstract class SteemRelationshipsApi {
  /// Get the list of users this user follows
  Future<List<User>> getFollowing();

  /// Get the list of users this user is followed by
  Future<List<User>> getFollowers();

  Future<Relationship> modify(String action);
}