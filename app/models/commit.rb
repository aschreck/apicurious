class Commit 

  attr_reader :date, :message, :author

  def initialize(commit_data)
   @date = DateTime.parse(commit_data[:commit][:author][:date]).to_date 
   @message = commit_data[:commit][:message]
   @author = commit_data[:commit][:author][:name]
  end 
end 