class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages
  validates :username, presence: true, uniqueness: true

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
    user.email = auth['info']['email']
    user.name = auth['info']['name']
    user.username = auth['info']['nickname']
    user.token = auth['credentials']['token']

    user.save
    user
  end
end
