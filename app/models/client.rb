class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class Client < ApplicationRecord
  belongs_to :user

  before_save { self.email = email.downcase }
  validates :fullname, presence: true
  validates :email, presence: true,
            email: true
            # ,uniqueness: { case_sensitive: false }
  validates :status, presence: true
end
