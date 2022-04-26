class AuthenticatedUser < ApplicationRecord
  self.abstract_class = true

  encrypts :password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  def authenticated?(provided_password)
    password == provided_password
  end
end
