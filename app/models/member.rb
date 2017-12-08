require './app/services/github_service.rb'

class Member

	attr_reader :name, :nickname, :email, :token, :followers, :following, :repos, :starred_repos

  def initialize(attrs = {})
		@name      = attrs[:name]
		@login     = attrs[:login]
		@email     = attrs[:email] 
		@token     = attrs[:token]
		@image_url = attrs[:avatar_url]
		@followers_url = attrs[:followers_url]
		@following_url = attrs[:following_url]
  end 


	def self.create_member(token)
		parsed_json = github(token).member_data
		member = Member.new(parsed_json)
		member.add_followers(token)
		member
	end
	
	def add_followers(token)
		@followers = self.github(token).get_followers
		
		@following = self.github(token).get_following
	end 	

	def add_repos(token)
		@repos = github(token).get_repos
	end 

	def add_starred_repos(token)
		@starred_repos = github(token).get_starred_repos
	end 

	def add_commits(token, repos)
		@commits = github(token).get_commits(repos)
	end

	
		def github(token)
			GithubService.new(token)
		end 

		def self.github(token)
			GithubService.new(token) 
		end 

end 
