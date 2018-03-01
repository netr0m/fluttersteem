import 'dart:async';

import '../api/vote.dart';
import '../models/models.dart';
import '../requestor.dart';

class SteemVotesApiImpl implements SteemVotesApi {
  final Map<String, SteemVotesApiPost> _posts = {};
  final Requestor requestor;

  SteemVotesApiImpl(this.requestor);

  @override
  SteemVotesApiPost forPost(String author, String permlink) {
    Map<String, String> _postData = {"author": author, "permlink": permlink};
    return _posts.putIfAbsent(
        _postData.toString(), () =>
    new _SteemVotesApiPostImpl(author, permlink, requestor));
  }
}

class _SteemVotesApiPostImpl implements SteemVotesApiPost {
  final String author;
  final String permlink;
  final Requestor requestor;
  Map<String, String> queryParameters = {};
  String _votersRoot;
  String _voteRoot;

  _SteemVotesApiPostImpl(this.author, this.permlink, this.requestor) {
    _votersRoot = '/get_active_votes';
    _voteRoot = '/api/broadcast';
  }

  @override
  Future<List<ActiveVote>> getVoters(String author, String permlink) {
    queryParameters['author'] = author;
    queryParameters['permlink'] = permlink;

    return requestor
        .request(_votersRoot, queryParameters: queryParameters)
        .then((r) {
      return r.data.map((m) => new ActiveVote.fromJson(m)).toList();
    });
  }

  @override
  Future<bool> upvote(String voter, String author, String permlink,
      {int weight}) {
    var voteOperation = '[["vote", {'
        '"voter": "$voter",'
        '"author": "$author",'
        '"permlink": "$permlink",'
        '"weight": "$weight"}]]';
    Map<String, String> queryParameters = {};

    if (weight != null)
      queryParameters['weight'] = weight.toString();
    else
      queryParameters['weight'] = "10000"; // 100% as default

    return requestor
        .request(_voteRoot, queryParameters: queryParameters,
        method: 'POST',
        body: {"operations": voteOperation})
        .then((r) {
      return true;
    });
  }

  @override
  Future<bool> unvote(String voter, String author, String permlink) {
    var unvoteOperation = '[["vote", {'
        '"voter": "$voter",'
        '"author": "$author",'
        '"permlink": "$permlink",'
        '"weight": "0"}]]';

    return requestor
        .request(
        _voteRoot, method: 'POST', body: {"operations": unvoteOperation})
        .then((r) {
      return true;
    });
  }
}

