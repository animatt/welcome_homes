class User < AuthenticatedUser
  before_create :set_last_logged_in_default!

  private

  def set_last_logged_in_default!
    self.last_logged_in ||= DateTime.current
  end
end
