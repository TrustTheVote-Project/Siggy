class SignatureSubmission < ApplicationRecord
  class Status
    def self.accepted
      "accepted".freeze
    end
    def self.pending
      "pending".freeze
    end
    def self.rejected
      "rejected".freeze
    end
  end
  class PhoneType
    def self.mobile
      "mobile".freeze
    end
    def self.home
      "home".freeze
    end
    def self.work
      "work".freeze
    end
  end

  scope :accepted, -> { where(status: Status.accepted )}
  scope :pending, -> { where(status: Status.pending )}
  scope :rejected, -> { where(status: Status.rejected )}

  def name
    "#{first_name[0]}. #{last_name} #{suffix}"
  end

end
