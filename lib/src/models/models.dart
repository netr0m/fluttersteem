import 'package:owl/annotation/json.dart';

@JsonClass()
class AccessTokenResponse {
  @JsonField(key: 'access_token')
  String accessToken;

  User user;

  AccessTokenResponse({this.accessToken, this.user});
  factory AccessTokenResponse.fromJson(Map map) =>
      AccessTokenResponseMapper.parse(map);
  Map<String, dynamic> toJson() => AccessTokenResponseMapper.map(this);
}

@JsonClass()
class User {
  String id, proxy, balance;
  DateTime created;
  bool mined;
  int withdrawn;

  @JsonField(key: 'name')
  String username;
  @JsonField(key: 'memo_key')
  String memoKey;
  @JsonField(key: 'json_metadata')
  String jsonMetadata;
  @JsonField(key: 'last_owner_update')
  DateTime lastOwnerUpdate;
  @JsonField(key: 'last_account_update')
  DateTime lastAccountUpdate;
  @JsonField(key: 'owner_challenged')
  bool ownerChallenged;
  @JsonField(key: 'active_challenged')
  bool activeChallenged;
  @JsonField(key: 'last_owner_proved')
  DateTime lastOwnerProved;
  @JsonField(key: 'last_active_proved')
  DateTime lastActiveProved;
  @JsonField(key: 'recovery_account')
  String recoveryAccount;
  @JsonField(key: 'last_account_recovery')
  DateTime lastAccountRecovery;
  @JsonField(key: 'reset_account')
  String resetAccount;
  @JsonField(key: 'comment_count')
  int commentCount;
  @JsonField(key: 'lifetime_vote_count')
  int lifetimeVoteCount;
  @JsonField(key: 'post_count')
  int postCount;
  @JsonField(key: 'can_vote')
  bool canVote;
  @JsonField(key: 'voting_power')
  int votingPower;
  @JsonField(key: 'last_vote_time')
  DateTime lastVoteTime;
  @JsonField(key: 'savings_balance')
  String savingsBalance;
  @JsonField(key: 'sbd_balance')
  String sbdBalance;
  @JsonField(key: 'sbd_seconds')
  String sbdSeconds;
  @JsonField(key: 'sbd_seconds_last_update')
  DateTime sbdSecondsLastUpdate;
  @JsonField(key: 'sbd_last_interest_payment')
  DateTime sbdLastInterestPayment;
  @JsonField(key: 'savings_sbd_balance')
  String savingsSbdBalance;
  @JsonField(key: 'savings_sbd_seconds')
  String savingsSbdSeconds;
  @JsonField(key: 'savings_sbd_seconds_last_update')
  DateTime savingsSbdSecondsLastUpdate;
  @JsonField(key: 'savings_sbd_last_interest_payment')
  DateTime savingsSbdLastInterestPayment;
  @JsonField(key: 'savings_withdraw_requests')
  int savingsWithdrawRequests;
  @JsonField(key: 'reward_sbd_balance')
  String rewardSbdBalance;
  @JsonField(key: 'reward_steem_balance')
  String rewardSteemBalance;
  @JsonField(key: 'reward_vesting_balance')
  String rewardVestingBalance;
  @JsonField(key: 'reward_vesting_steem')
  String rewardVestingSteem;
  @JsonField(key: 'vesting_shares')
  String vestingShares;
  @JsonField(key: 'delegated_vesting_shares')
  String delegatedVestingShares;
  @JsonField(key: 'received_vesting_shares')
  String receivedVestingShares;
  @JsonField(key: 'vesting_withdraw_rate')
  String vestingWithdrawRate;
  @JsonField(key: 'next_vesting_withdrawal')
  DateTime nextVestingWithdrawal;
  @JsonField(key: 'to_withdraw')
  int toWithdraw;
  @JsonField(key: 'withdraw_routes')
  int withdrawRoutes;
  @JsonField(key: 'curation_rewards')
  int curationRewards;
  @JsonField(key: 'posting_rewards')
  int postingRewards;
  @JsonField(key: 'proxied_vsf_votes')
  List<int> proxiedVsfVotes;
  @JsonField(key: 'witnesses_voted_for')
  int witnessesVotedFor;
  @JsonField(key: 'average_bandwith')
  int averageBandwith;
  @JsonField(key: 'lifetime_bandwith')
  String lifetimeBandwith;
  @JsonField(key: 'last_bandwith_update')
  DateTime lastBandwithUpdate;
  @JsonField(key: 'average_market_bandwith')
  int averageMarketBandwith;
  @JsonField(key: 'lifetime_market_bandwith')
  int lifetimeMarketBandwith;
  @JsonField(key: 'last_market_bandwith_update')
  DateTime lastMarketBandwithUpdate;
  @JsonField(key: 'last_post')
  DateTime lastPost;
  @JsonField(key: 'last_root_post')
  DateTime lastRootPost;
  @JsonField(key: 'vesting_balance')
  String vestingBalance;
  @JsonField(key: 'reputation')
  int reputation; // TODO: Fix this, need to handle this data
  @JsonField(key: 'transfer_history')
  List<dynamic> transferHistory;
  @JsonField(key: 'market_history')
  List<dynamic> marketHistory;
  @JsonField(key: 'post_history')
  List<dynamic> postHistory;
  @JsonField(key: 'vote_history')
  List<dynamic> voteHistory;
  @JsonField(key: 'other_history')
  List<dynamic> otherHistory;
  @JsonField(key: 'witness_votes')
  List<dynamic> witnessVotes;
  @JsonField(key: 'tags_usage')
  List<String> tagsUsage;
  @JsonField(key: 'guest_bloggers')
  List<String> guestBloggers;

  User(
  {this.id,
    this.username,
  this.memoKey,
  this.jsonMetadata,
  this.proxy,
  this.lastOwnerUpdate,
  this.lastAccountUpdate,
  this.created,
  this.mined,
  this.ownerChallenged,
  this.activeChallenged,
  this.lastOwnerProved,
  this.lastActiveProved,
  this.recoveryAccount,
  this.lastAccountRecovery,
  this.resetAccount,
  this.commentCount,
  this.lifetimeVoteCount,
  this.postCount,
  this.canVote,
  this.votingPower,
  this.lastVoteTime,
  this.balance,
  this.savingsBalance,
  this.sbdBalance,
  this.sbdSeconds,
  this.sbdSecondsLastUpdate,
  this.sbdLastInterestPayment,
  this.savingsSbdBalance,
  this.savingsSbdSeconds,
  this.savingsSbdSecondsLastUpdate,
  this.savingsSbdLastInterestPayment,
  this.savingsWithdrawRequests,
  this.rewardSbdBalance,
  this.rewardSteemBalance,
  this.rewardVestingBalance,
  this.rewardVestingSteem,
  this.vestingShares,
  this.delegatedVestingShares,
  this.receivedVestingShares,
  this.vestingWithdrawRate,
  this.nextVestingWithdrawal,
  this.withdrawn,
  this.toWithdraw,
  this.withdrawRoutes,
  this.curationRewards,
  this.postingRewards,
  this.proxiedVsfVotes,
  this.witnessesVotedFor,
  this.averageBandwith,
  this.lifetimeBandwith,
  this.lastBandwithUpdate,
  this.averageMarketBandwith,
  this.lifetimeMarketBandwith,
  this.lastMarketBandwithUpdate,
  this.lastPost,
  this.lastRootPost,
  this.vestingBalance,
  this.reputation,
  this.transferHistory,
  this.marketHistory,
  this.postHistory,
  this.voteHistory,
  this.otherHistory,
  this.witnessVotes,
  this.tagsUsage,
  this.guestBloggers
  });
  factory User.fromJson(Map map) => UserMapper.parse(map);
  Map<String, dynamic> toJson() => UserMapper.map(this);
}

@JsonClass()
class Followers {
  String follower, following, what;

  Followers({this.follower, this.following, this.what});
  factory Followers.fromJson(Map map) => FollowersMapper.parse(map);
  Map<String, dynamic> toJson() => FollowersMapper.map(this);
}

@JsonClass()
class Post {
  String id, author, permlink, category, title, body, blog;
  DateTime created, active;
  int depth, children;
  bool vote, flag, isNSFW;
  List<String> tags;

  @JsonField(key: 'parent_author')
  String parentAuthor;
  @JsonField(key: 'parent_permlink')
  String parentPermlink;
  @JsonField(key: 'json_metadata')
  String jsonMetadata;
  @JsonField(key: 'last_update')
  DateTime lastUpdate;
  @JsonField(key: 'last_payout')
  DateTime lastPayout;
  @JsonField(key: 'net_rshares')
  String netRShares;
  @JsonField(key: 'abs_rshares')
  String absRShares;
  @JsonField(key: 'vote_rshares')
  String voteRShares;
  @JsonField(key: 'children_abs_rshares')
  String childrenAbsRShares;
  @JsonField(key: 'cashout_time')
  DateTime cashoutTime;
  @JsonField(key: 'max_cashout_time')
  DateTime maxCashoutTime;
  @JsonField(key: 'total_vote_weight')
  int totalVoteWeight;
  @JsonField(key: 'reward_weight')
  int rewardWeight;
  @JsonField(key: 'total_payout_value')
  String totalPayoutValue;
  @JsonField(key: 'curator_payout_value')
  String curatorPayoutValue;
  @JsonField(key: 'author_rewards')
  int authorRewards;
  @JsonField(key: 'net_votes')
  int netVotes;
  @JsonField(key: 'root_comment')
  int rootComment;
  @JsonField(key: 'max_accepted_payout')
  String maxAcceptedPayout;
  @JsonField(key: 'percent_steem_dollars')
  int percentSteemDollars;
  @JsonField(key: 'allow_replies')
  bool allowReplies;
  @JsonField(key: 'allow_votes')
  bool allowVotes;
  @JsonField(key: 'allow_curation_rewards')
  bool allowCurationRewards;
  @JsonField(key: 'beneficiaries')
  List<String> beneficiaries;
  @JsonField(key: 'reblog_on')
  DateTime reblogOn;
  @JsonField(key: 'entry_id')
  int entryId;

  Post(
  {this.id,
  this.author,
  this.permlink,
  this.category,
  this.parentAuthor,
  this.parentPermlink,
  this.title,
  this.body,
  this.jsonMetadata,
  this.lastUpdate,
  this.created,
  this.active,
  this.lastPayout,
  this.depth,
  this.children,
  this.netRShares,
  this.absRShares,
  this.voteRShares,
  this.childrenAbsRShares,
  this.cashoutTime,
  this.maxCashoutTime,
  this.totalVoteWeight,
  this.rewardWeight,
  this.totalPayoutValue,
  this.curatorPayoutValue,
  this.authorRewards,
  this.netVotes,
  this.rootComment,
  this.maxAcceptedPayout,
  this.percentSteemDollars,
  this.allowReplies,
  this.allowVotes,
  this.allowCurationRewards,
  this.beneficiaries,
  this.blog,
  this.reblogOn,
  this.entryId
  });

  factory Post.fromJson(Map map) => PostMapper.parse(map);
  Map<String, dynamic> toJson() => PostMapper.map(this);
}