module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] =
    OmniAuth::AuthHash.new (  
   {"provider"=>"github",
      "uid"=>"29213917",
      "info"=>
      {"nickname"=>"aschreck",
        "email"=>nil,
        "name"=>"Aaron Schreck",
        "image"=>"https://avatars2.githubusercontent.com/u/22850330?v=4",
        "urls"=>
        {"GitHub"=>"https://github.com/aschreck", "Blog"=>""}},
        "credentials"=>{"token"=>ENV["TOKEN"], "expires"=>false},
        "extra"=>
        {"raw_info"=>
          {"login"=>"aschreck"
      }}})
  end 

end 