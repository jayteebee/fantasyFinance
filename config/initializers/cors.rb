# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins   '*'  
     # 'https://fantasy-finance-fe-416b523c0162.herokuapp.com/'  # Heroku frontend URL 
    else
      origins 'http://localhost:4000'  # localhost URL for development
    end

    resource(
      '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
      methods: [:get, :patch, :put, :delete, :post, :options, :show, :head]
    )
  end
end