module ApplicationHelper
	def gravitar_for(user)
		gravitar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravitar_url = "https://secure.gravitar.com/avatar/#{gravitar_id}"
		image_tag(gravitar_url,alt: user.username, class: "img-circle" )
	end
end
