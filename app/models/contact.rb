class Contact
  include ActiveModel::Validations
  attr_accessor :name, :email, :company, :attributes

  validates_presence_of :name, :email, :company

  def initialize(attributes = {})
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end

  def send_email
    ContactMailer.send_mail(self).deliver
  end
end
