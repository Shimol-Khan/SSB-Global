class Record < ApplicationRecord
  belongs_to :user

  validates_presence_of :client_name
  validates_presence_of :client_email
  validates_presence_of :client_contact
  validates_presence_of :client_address
  validates_presence_of :service
  validates_presence_of :status
end
