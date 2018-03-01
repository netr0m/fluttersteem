import '../api/reply.dart';
import '../models/models.dart';
import '../requestor.dart';
import 'dart:async';

class SteemCommentsApiImpl implements SteemCommentsApi {
  final Map<String, SteemCommentsApiPost> _posts = {};
  final Requestor requestor;

  SteemCommentsApiImpl(this.requestor);

  @override
  SteemCommentsApiPost forPost(String author, String permlink) {
    Map<String, String> _postData = {"author": author, "permlink": permlink};
    return _posts.putIfAbsent(
        _postData.toString(), () => new _SteemCommentsApiPostImpl(author, permlink, requestor));
  }
}

class _SteemCommentsApiPostImpl implements SteemCommentsApiPost {
  final String author;
  final String permlink;
  final Requestor requestor;
  String _getRepliesRoot;
  String _createCommentRoot;

  _SteemCommentsApiPostImpl(this.author, this.permlink, this.requestor) {
    _getRepliesRoot = '/get_content_replies?author=$author&permlink=$permlink';
    _createCommentRoot = '/sign/comment';
  }

  @override
  Future<List<Reply>> getReplies() {
    return requestor.request(_getRepliesRoot).then((r) {
      return r.data.map((m) => new Reply.fromJson(m)).toList();
    });
  }

  @override
  Future<bool> createComment(String parentAuthor, String parentPermlink,
      String author, String permlink, String title, String body,
  {String jsonMetadata}) {

    Map<String, String> queryParameters = {};

    if (jsonMetadata != null) queryParameters['json_metadata'] = jsonMetadata.toString();

    return requestor
        .request('$_createCommentRoot?parent_author=$parentAuthor'
        '&parent_permlink=$parentPermlink&author=$author&permlink=$permlink'
        '&title=$title&body=$body', method: 'POST', body: {}).then((r) {
      return true;
    });
  }
}