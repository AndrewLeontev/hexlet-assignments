# frozen_string_literal: true
require 'forwardable'
require 'uri'

# BEGIN
class Url
  extend Forwardable

  attr_accessor :url

  def_delegators :@url, :scheme, :host, :port, :to_s

  def initialize(url)
    @url = URI(url)
  end

  def query_params
    query = url.query
    return {} if query.nil?

    query.split('&').each_with_object({}) do |param, acc|
      key, value = param.split('=')
      acc[key.to_sym] = value
    end
  end

  def query_param(key, value=nil)
    query_params[key] || value
  end

  def ==(other)
    check_url = url.to_s[/[^\?]+/] == other.to_s[/[^\?]+/]
    return false unless check_url

    query_params == other.query_params
  end
end
# END
