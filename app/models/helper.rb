module Helper 
  def self.current_user(session)
    User.find_by(username: session[:username]) #finding current user
  end
  
  def self.logged_in?(session)
    !!current_user(session) #checking to see who session belongs to
  end 
  
      
end