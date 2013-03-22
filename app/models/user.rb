class User < ActiveRecord::Base
  include BCrypt
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/ }
  validates :email, :presence => true
  validates :name, :presence => true
  validates :password_hash, :presence => true
  has_many :albums

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
