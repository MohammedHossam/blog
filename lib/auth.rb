# require 'jwt'

class Auth

  ALGORITHM = 'HS256'
  AUTH_SECRET = ENV.fetch("AUTH_SECRET") { 'defaultsecret' }

  def self.issue(payload)
    JWT.encode(payload, AUTH_SECRET, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token, AUTH_SECRET, true, {algorithm: ALGORITHM} ).first
  end
end