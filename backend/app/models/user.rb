class User < ApplicationRecord
  include BCrypt

  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :group_items, dependent: :destroy

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
