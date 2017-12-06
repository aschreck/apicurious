class Member

  def initialize(attrs = {})
		@name     =  attrs[:name]
		@nickname =  attrs[:nickname]
		@email    =  attrs[:email]
		@token    =  attrs[:token]
  end 


	def self.populate_member
		#return a member object with all the stuff we want 
		github.create_member		
	end
	
	private 

		def self.github
			GithubService.new 
		end 
end 
