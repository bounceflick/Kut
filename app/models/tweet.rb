require "SecureRandom"

class Url < ActiveRecord::Base
before_save :url_shortener, :http_prefixer

  def url_shortener
    self.short_url = SecureRandom.urlsafe_base64(6)
  end

  def http_prefixer
    self.url = "http://"+self.url unless self.url =~ %r{http://} or %r{https://}
  end

end
