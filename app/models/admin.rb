class Admin < ApplicationRecord
  def authenticated?(provided_password)
    password == provided_password
  end
end
