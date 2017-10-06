module ApplicationHelper
  def avatar_url(user)
    default_url = "#{root_url}images/guest.jpg"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
  #  "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
     "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?s=150&d=#{CGI.escape(default_url)}"
  end
end
