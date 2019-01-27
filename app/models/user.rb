class User < ApplicationRecord
  has_many :reservations

  def self.find_or_create_user(params)
    user = User.find_by(email: params[:email])
    user = User.create(email: params[:email], name: params[:name]) if !user.present?
    user
  end
end
