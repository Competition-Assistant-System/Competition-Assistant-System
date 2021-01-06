require 'test_helper'

class ScoreResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @base_score = 160
    @grant = Grant.find_or_create_by(group_name: "test", sys_admin: true, sys_read: true, sys_download: true, sys_upload: true)
    @user = User.create(username: "User1", email: "name@ucas.ac.cn", grant_id: @grant.id, password: "12345")
    @score_base = ScoreBase.find_or_create_by(base_name:"base1", base_score:@base_score, weight:2.0)
  end

  test "caculate the result score automatically" do
    @score_result = ScoreResult.create(user_id:@user.id, score_base_id: @score_base.id, score_origin: 300)
    assert_in_delta @score_result.score_result, 300*1.0/@base_score, 0.1
  end

end
