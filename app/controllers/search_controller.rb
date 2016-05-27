class SearchController < ApplicationController
	include ApplicationHelper
  def index
    url = "https://www.googleapis.com/customsearch/v1?key=#{ENV['IMG_API_KEY']}&cx=002288225112611956124:-wql8cbjghm&q=#{params[:term]}"
    p url
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    image_response = JSON.parse(response.body)
    p image_response
    if items = image_response['items']
	    items.each do |item|
	    	if item.has_key?('pagemap')
          if item['pagemap'].has_key?('cse_image')
            if item['pagemap']['cse_image'][0].has_key?('src')
	    			  @image_jpg ||= item['pagemap']['cse_image'][0]['src']
            end
          end

          # if item['pagemap']['cse_image'][0]['src'].include?('Offer')
          # if /offer/i.match(item['pagemap']['cse_image'][0]['src'])
          # else
	    		# end
	    	end
	    end
  	end
    # p @image_jpg
    articles = Article.matched_articles(params[:term])
    @articles = user_signed_in? ? articles : articles.select(&:published)
    @categories = Category.matched_categories(params[:term])
  end
end
