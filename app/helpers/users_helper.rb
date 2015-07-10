module UsersHelper
    def gravatar_for(user,options = {:size => 10})

    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "http://www.gravatar.com/avatar/c196bf50ac056e01fd5a773af2820d7a?s=48&d=identicon"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  
  end
end
