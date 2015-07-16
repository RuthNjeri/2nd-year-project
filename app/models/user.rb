# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  salt               :string
#  encrypted_password :string
#  admin              :boolean          default(FALSE)
#

class User < ActiveRecord::Base
 has_many :microposts, dependent: :destroy
 has_many :user_requests, dependent: :destroy
 has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
 has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

 has_many :following, through: :active_relationships, source: :followed
 has_many :followers, through: :passive_relationships,source: :follower
 
email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
attr_accessor :password,:remember_token,:activation_token,:reset_token
before_save   :downcase_email
before_create :create_activation_digest


validates :name, :presence=> true,
                 :length=>{:maximum=> 50}
validates :surname,:presence=> true,
                 :length=>{:maximum=> 50}
validates :email,:presence=>true,
                 :format=> { :with => email_regex},
                 :uniqueness=> {:case_sensitive=> false}
validates :password, :presence=> true,
                     :confirmation=>true,
                     :length=>{:within=>6..40}
    
before_save :encrypt_password
 def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end


 def has_password?(submitted_password)
   encrypted_password==encrypt(submitted_password)
 end

class << self
   def authenticate(email,submitted_password)
   user=find_by_email(email)
   (user && user.has_password?(submitted_password))? user : nil
  end

  def authenticate_with_salt(id,cookie_salt)
  user = find_by_id(id)
  (user&& user.salt == cookie_salt) ? user:nil
  end
end
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
    def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:rest_digest,  User.digest(reset_token))
    update_attribute(:rest_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def feed
      following_ids_subselect = "SELECT followed_id FROM relationships
                               WHERE  follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids_subselect})
                     OR user_id = :user_id", user_id: id)
  end
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
private
  def encrypt_password
   self.salt=make_salt if new_record?
   self.encrypted_password=encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
   secure_hash("#{Time.now.utc}--#{password}") 
  end

  def secure_hash(string)
   Digest::SHA2.hexdigest(string)
  end

   def downcase_email
      self.email = email.downcase
    end
    def User.digest(string)
    end
    def User.new_token
        SecureRandom.urlsafe_base64 
    end
 
    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
