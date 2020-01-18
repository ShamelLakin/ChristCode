class User < ActiveRecord::Base
    has_secure_password

    validates_uniqueness_of :username, :email
    validates_presence_of :name, :username, :email, :password
    validates :password, length: { :minimum => 8 }


    has_many :verses

end