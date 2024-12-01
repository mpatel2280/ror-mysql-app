# app/controllers/posts_controller.rb
require 'concurrent-ruby'
require 'httparty'
class PostsController < ApplicationController
    def price_gainers
      # responses = fetch_price_gainers
      # render json: { data: responses }
      responses = fetch_api_data2
      render json: { data: responses }
    end

    def fetch_api_data2
      url = URI('https://api.stockedge.com/Api/trendingstocksapi/GetPriceMovers?relevantListings=10&gainerLosersTypeEnum=1&page=1&pageSize=20&lang=en')
      response = Net::HTTP.get(url)
      parsed_response = JSON.parse(response)
      arr = [];
      insert_sql = ''
      parsed_response.each do |r|       
        insert_sql += "('#{r['Name']}', '#{r['Symbol']}', "
      end
      return insert_sql
    end


    def fetch_price_gainers
      response = HTTParty.get('https://api.stockedge.com/Api/trendingstocksapi/GetPriceMovers?relevantListings=10&gainerLosersTypeEnum=1&page=1&pageSize=20&lang=en')
      return unless response.success?
      return response.parsed_response
    end

    def fetch_api_data
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
      return unless response.success?
      return response.parsed_response
    end

    def get_concurrent_data_without_thread_pool
      urls = ['https://dummyjson.com/posts', 'https://dummyjson.com/comments']
  
      fetch_data = urls.map do |url|
        Concurrent::Future.execute { Net::HTTP.get(URI(url)) }
      end
  
      return fetch_data.map(&:value).map { |response| JSON.parse(response) }
    end
end
  