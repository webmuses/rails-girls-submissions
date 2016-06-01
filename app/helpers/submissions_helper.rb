module SubmissionsHelper
  def print_nickname_and_value(rate)
    user = User.find(rate.user_id)
    user.nickname + ": " + rate.value.to_s
  end
end
