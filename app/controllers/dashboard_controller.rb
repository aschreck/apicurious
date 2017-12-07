class DashboardController < ApplicationController
  def index
    member = Member.create_member
    member.add_followers
    @member = member
    
    # repo_names = JSON.parse(repo_response.body).map {|repo| repo["name"]}
    # commits = repo_names.map do |repo|
      #   Faraday.get("https://api.github.com/repos/#{current_user.nickname}/#{repo}/commits")
      # end 
    end 
  end 
  
  # response = Faraday.get("https://api.github.com/users/#{current_user.nickname}")
  # user_info = JSON.parse(response.body, symbolize_names: true)
  # @follower_deets = [user_info[:followers], user_info[:following]]
  # repo_response = Faraday.get("https://api.github.com/users/#{current_user.nickname}/repos")
  # followers_url = user_info[:followers_url]
  # following_url = user_info[:following_url]
  # followers_response = Faraday.get(followers_url) #list of followers.
  # followers = JSON.parse(followers_response.body)
  # @followers = followers.map {|follower| [follower["login"], follower["avatar_url"]]} 