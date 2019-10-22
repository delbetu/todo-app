class User < ApplicationRecord
  include BCrypt

  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :group_items, dependent: :destroy

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def has_group?(group_item_id)
    group_items.pluck(:id).include?(group_item_id)
  end
end
