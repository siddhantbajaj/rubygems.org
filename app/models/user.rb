class User < ActiveRecord::Base
  include Clearance::User

  has_many :rubygems
  before_create :generate_api_key

  protected

    def generate_api_key
      self.api_key = Digest::MD5.hexdigest("#{email}-#{Time.now.to_f}")
    end
end
