import 'dart:async';

import '../api/post.dart';
import '../models/models.dart';
import '../requestor.dart';

class SteemPostsApiImpl implements SteemPostsApi {
  static const String _root = '/get_content';

  final Requestor requestor;

  SteemPostsApiImpl(this.requestor);

  @override
  Future<Post> getPost(String author, String permlink) {
    return requestor
        .request('$_root?author=$author&permlink=$permlink')
        .then((r) => new Post.fromJson(r.data));
  }
}