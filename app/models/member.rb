require './app/services/github_service.rb'

class Member

	attr_reader :name, :nickname, :email, :followers, :following, :repos

  def initialize(attrs = {})
		@name      = attrs[:name]
		@login     = attrs[:login]
		@email     = attrs[:email] 
		@token     = attrs[:token]
		@image_url = attrs[:avatar_url]
		@followers_url = attrs[:followers_url]
		@following_url = attrs[:following_url]
  end 


	def self.create_member
		#return a member object with basic information 
		parsed_json = github.member_data
		member = Member.new(parsed_json)
		member.add_followers
		member
	end
	
	def add_followers
		@followers = self.github.get_followers
		
		@following = self.github.get_following
	end 	

	def add_repos
		@repos = github.get_repos
	end 

		def github
			GithubService.new 
		end 

		def self.github
			GithubService.new 
		end 

end 
