import '../api/user.dart';
import '../models/models.dart';
import '../requestor.dart';
import 'dart:async';

const String _accountsRoot = '/get_accounts';
const String _selfRoot = '/api/me';
const String _blogRoot = '/get_blog';
const String _searchRoot = '/lookup_accounts';
const String _votesRoot = '/get_account_votes';
const String _feedRoot = '/get_feed';
String me = 'amigos';

class SteemUsersApiImpl implements SteemUsersApi {
  _SteemUsersApiSelfImpl _self;
  final Requestor requestor;
  
  SteemUsersApiImpl(this.requestor);
  
  @override
  SteemUsersApiSelf get self =>
      _self ??= new _SteemUsersApiSelfImpl(this, requestor);
  
  @override
  Future<User> getByUsername(String username) {
    return requestor
        .request('$_accountsRoot?names=["$username"]')
        .then((r) => new User.fromJson(r.data));
  }

  @override
  Future<User> getSelf() {
    return requestor
        .request('$_selfRoot')
        .then((r) => new User.fromJson(r.data));
  }

  @override
  Future<List<User>> getUsers(List<String> usernames) {
    return requestor
        .request('$_accountsRoot?names=$usernames')
        .then((r) {
      return r.data.map((m) => new User.fromJson(m)).toList();
    });
  }

  @override
  Future<List<Post>> getRecentPosts(String username, {int entryId, int limit}) {
    Map<String, String> queryParameters = {};

    if (entryId != null) queryParameters['entryId'] = entryId.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    return requestor
        .request('$_blogRoot?account=$username',
    queryParameters: queryParameters)
        .then((r) {
      return r.data.map((m) => new Post.fromJson(m)).toList();
    });
  }

  @override
  Future<List<String>> search(String query, {int limit}) {
    Map<String, String> queryParameters = {};

    if (limit != null) queryParameters['limit'] = limit.toString();

    return requestor
        .request('$_searchRoot/?lowerBoundName=$query', queryParameters: queryParameters)
        .then((r) {
      return r.data.map((m) => new User.fromJson(m)).toList();
    });
  }
}

class _SteemUsersApiSelfImpl implements SteemUsersApiSelf {
  final SteemUsersApiImpl parent;
  final Requestor requestor;

  _SteemUsersApiSelfImpl(this.parent, this.requestor);

  @override
  Future<User> get() => parent.getSelf();

  // TODO: Fix $me
  @override
  Future<List<Post>> getOwnPosts({String entryId, String limit}) {
    Map<String, String> queryParameters = {};

    if (entryId != null) queryParameters['entryId'] = entryId.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    return requestor
        .request('$_blogRoot?account=$me',
    queryParameters: queryParameters)
        .then((r) {
      return r.data.map((m) => new Post.fromJson(m)).toList();
    });
  }

  // TODO: Fix $me
  Future<List<PostVote>> getVotedPosts() {
  return requestor
      .request('$_votesRoot?voter=$me')
      .then((r) {
    return r.data.map((m) => new PostVote.fromJson(m)).toList();
  });
  }

  // TODO: Fix $me
  Future<List<Post>> getFeed(String account, {int limit}) {
    Map<String, String> queryParameters = {};

    if (limit != null) queryParameters['limit'] = limit.toString();

    return requestor
        .request('$_feedRoot?account=$me',
    queryParameters: queryParameters)
        .then((r) {
      return r.data.map((m) => new Post.fromJson(m)).toList();
    });
  }
}