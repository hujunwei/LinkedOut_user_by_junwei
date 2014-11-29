module UsersHelper
 # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    gravatar_url = "https://farm9.staticflickr.com/8246/8652642892_9dcff69bd9_s.jpg"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end

