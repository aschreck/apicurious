class GithubService

	def initialize 
		@conn = Faraday.new(url: "https://api.github.com") do |faraday|
			faraday.headers["X-API-Key"] = ENV["GITHUB_API_KEY"]
      faraday.adapter Faraday.default_adapter
		end 
	end 

	def create_member(user_nickname)
		#I want to send a request to the address of the user who uses the app,
		#this 
		get_json("/#{user_nickname}")

		#this method needs to return a hash of information that I want to use
		#to populate the Member object. 
	end

	private 

		def get_json
			response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
		end 
end 



#what does a member need? 