class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :admin, :posts_attributes, :certificates_attributes

  attr_accessor :tmp_certificates
  has_many :posts
  accepts_nested_attributes_for :posts

  has_and_belongs_to_many :certificates

  accepts_nested_attributes_for :posts

  accepts_nested_attributes_for :certificates

  before_save :get_certificates


  def get_certificates
    self.certificates = self.certificates.collect do |certificate|
      Certificate.find_or_create_by_name(certificate.name)
    end
  end

end
