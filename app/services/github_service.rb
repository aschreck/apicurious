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
		raw_commits = repos.map do |repo|
			get_repo_commits(repo.name)
		end 
		unsorted_commits = raw_commits.map do |raw_commits| 
			objectize_commits(raw_commits)
		end 
		flattened_commits = unsorted_commits.flatten
		sorted_commits = sort_commits(flattened_commits)
	end 

	def get_repo_commits(name)
		get_json("repos/aschreck/#{name}/commits")
	end

	def objectize_commits(commits)
		commits.flat_map do |commit|
			Commit.new(commit) unless commit.class == Array
		end 
	end 

	def sort_commits(commits)
		one_month = (Date.today - 1.month).to_date
		commits.select { |commit| commit.date > one_month unless commit.nil? }  
	end 

	private 
	
	attr_reader :conn
		
		def get_json(url)
			response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
		end 
end 



