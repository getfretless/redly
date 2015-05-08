class Notely
  include HTTParty
  include Singleton

  API_BASE = Rails.application.secrets.notely_api_base
  API_KEY = Rails.application.secrets.notely_api_key

  base_uri API_BASE

  def self.find(id)
    get "/notes/#{id}?api_key=#{API_KEY}"
  end

  def self.create_from(redly_post)
    content = redly_post.link.presence || redly_post.body
    post "/notes", body: {
      api_key: API_KEY,
      note: {
        title: redly_post.title,
        body_html: content
      }
    }
  end
end
