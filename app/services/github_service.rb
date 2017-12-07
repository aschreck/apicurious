class GithubService

	
	def initialize 
		@conn = Faraday.new(url: "https://api.github.com") do |faraday|
			faraday.headers["X-API-Key"] = ENV["GITHUB_API_KEY"]
      faraday.adapter Faraday.default_adapter
		end 
	end 
	
	def member_data
		user_details = get_json("/users/aschreck")
	end
	
	def get_followers
		#appended_url = url + "access_token=#{token}"
		response = get_json('/users/aschreck/followers')
		response.map {|follower| [follower[:login], follower[:avatar_url]]}
	end 

	def get_following
#		token = User.first.token
#		appended_url = url + "access_token=#{token}"
		response = get_json('/users/aschreck/following')
		response.map {|follower| [follower[:login], follower[:avatar_url]]}
	end 
	
	private 
	
	attr_reader :conn
		
		def get_json(url)
			response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
		end 
end 



