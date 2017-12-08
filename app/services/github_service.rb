require 'github_repo'

class GithubService

	
	def initialize(token = "") 
		@conn = Faraday.new(url: "https://api.github.com") do |faraday|
			faraday.params[:access_token] = token
      faraday.adapter Faraday.default_adapter
		end 
	end 
	
	def member_data
		user_details = get_json("/users/aschreck")
	end
	
	def get_followers
		response = get_json('/users/aschreck/followers')
		response.map {|follower| [follower[:login], follower[:avatar_url]]}
	end 

	def get_following
		response = get_json('/users/aschreck/following')
		response.map {|follower| [follower[:login], follower[:avatar_url]]}
	end 
	
	def get_repos #return an array of repo objects
		response = get_json('/users/aschreck/repos')
		response.map do |repository| 
			Githubrepo.new(repository[:name])
		end 
	end 

	def get_starred_repos
		response = get_json('/users/aschreck/starred')
		response.map do |repository| 
			Githubrepo.new(repository[:name])
		end 
	end 

	def get_commits(repos)
		#make the API call for a commit 
		#repos is an array of repo objects. 
		#for each repo, call a method on it that gets all of the commits
		repos.each do |repos|
			get_repo_commits(repo.name)
		end 
	end 

	def get_repo_commits(name)
		#this method gathers the commits for a given repo. 
		
	end

	private 
	
	attr_reader :conn
		
		def get_json(url)
			response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
		end 
end 



