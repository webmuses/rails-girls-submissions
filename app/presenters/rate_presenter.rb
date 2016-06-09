class RatePresenter
  def initialize(rate, user)
    @rate = rate
    @user = user
  end

  def print_user
    @user.nickname
  end

  def print_value
    @rate.value
  end
end
