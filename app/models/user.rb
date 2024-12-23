class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :posts
  has_one :profile, dependent: :destroy
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id", dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id", dependent: :destroy

  # Alias for User.messages -> messages the user received
  has_many :messages, -> { distinct }, class_name: "Message", foreign_key: "recipient_id"


  after_create :build_default_profile

  def build_default_profile
    create_profile
  end
end


# before_save :normalize_email, if: :email_changed?

# private

# def normalize_email
#   self.email = email.downcase.strip
# end
