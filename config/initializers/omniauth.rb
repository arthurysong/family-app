Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '1b9c43f746de6b2e0856', '93e75a502bfdd5e57b34b6c6b89c0b605e44ab95', { 
        :redirect_uri => "http://localhost:3000/auth/github/callback" 
    }
end