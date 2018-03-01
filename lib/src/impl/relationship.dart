import 'dart:async';
import '../api/relationship.dart';
import '../models/models.dart';
import '../requestor.dart';

class SteemRelationshipsApiImpl implements SteemRelationshipsApi {
  static const String _followingRoot = '/get_following';
  static const String _followersRoot = '/get_followers';

  final Map<String, SteemRelationshipsApiUser> _users = {};
  final Requestor requestor;

  SteemRelationshipsApiImpl(this.requestor);

  @override
  SteemRelationshipsApiUser toUser(String username) {
    return _users.putIfAbsent(username,
    () => new _SteemRelationshipsApiUserImpl(requestor, username));
  }

  @override
  Future<List<Relationship>> getFollowing(String follower, int limit, {String startFollowing, String followType}) {
    var req = '$_followingRoot?follower=$follower';
    if (startFollowing == null) startFollowing = "NULL";
    if (followType == null) followType = "blog";
    if (limit == null) limit = 16;
    return requestor
        .request('$req&startFollowing=$startFollowing&followType=$followType&limit=$limit')
        .then((r) {
      return r.data.map((m) => new Relationship.fromJson(m)).toList();
    });
  }

  @override
  Future<List<Relationship>> getFollowers(String following, int limit, {String startFollower, String followType}) {
    var req = '$_followersRoot?following=$following';
    if (startFollower == null) startFollower = "NULL";
    if (followType == null) followType = "blog";
    if (limit == null) limit = 16;
    return requestor
        .request('$req&startFollower=$startFollower&followType=$followType&limit=$limit')
        .then((r) {
      return r.data.map((m) => new Relationship.fromJson(m)).toList();
    });
  }


}