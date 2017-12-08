class DashboardController < ApplicationController
  def index
    token = current_user.token
    member = Member.create_member(token)
    member.add_followers(token)
    member.add_repos(token)
    member.add_starred_repos(token)
    member.add_commits(token, member.repos)
    @member = member
    end 
  end 
  