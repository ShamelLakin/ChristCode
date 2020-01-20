class Verse < ActiveRecord::Base
   
    validates :title, presence: true, length: { maximum: 50 }, uniqueness: true
    validates :content, presence: true, length: { maximum: 1000 }
    
    belongs_to :user

end