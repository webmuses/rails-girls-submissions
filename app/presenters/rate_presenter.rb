class RatePresenter
  def initialize(rate, user)
    @rate = rate
    @user = user
  end

  def user_nickname
    @user.nickname
  end

  def value
    @rate.value
  end
end
