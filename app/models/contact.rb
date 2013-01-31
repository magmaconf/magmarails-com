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

  def add_to_list
    Gibbon.throws_exceptions = false
    Gibbon.list_subscribe({:id => '6dd138846b',
                           :email_address => self.attributes[:email],
                           :merge_vars => {:FNAME => self.first_name,
                                           :LNAME => self.last_name,
                                           :COMPANY => self.attributes[:company]},
                           :double_optin => false})
  end

  def first_name
    self.attributes[:name].blank? ? "" : self.attributes[:name].split(" ")[0]
  end

  def last_name
    unless self.attributes[:name].blank?
      name = self.attributes[:name].split(" ")
      name.shift
      name.join(' ')
    else
      ""
    end

  end
end
