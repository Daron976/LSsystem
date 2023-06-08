# require 'rubygems'
# require 'excon'
require 'net/http'

class CoursesController < ApplicationController

  # private
  def fetch
    uri = URI('https://microverse-take-home-api.herokuapp.com/api/v1/courses')
    headers = {Bearer_token: 'tooth.RED.bear.fork'}
    # uri.query = URI.encode_www_form(params)
    # res = RestClient.get('https://microverse-take-home-api.herokuapp.com/api/v1/courses',headers: {Authorization: 'tooth.RED.bear.fork'})
    # req = Net::HTTP::Get.new(url.to_s)
    # res = Net::HTTP.start(url.host, url.port) {|http|
    #   http.request(req)
    # }
    # res = Excon.get('https://microverse-take-home-api.herokuapp.com/api/v1/courses', :header => {'Authorization' => 'tooth.RED.bear.fork'})

    res = Net::HTTP.get(uri, headers);
    render json: res
  end
end
