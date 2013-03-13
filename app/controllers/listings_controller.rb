class ListingsController < ApplicationController

  def find
    listing = Listing.new(params[:listing])
    matches = listing.percolate_queries
    render :json => {"matches" =>  matches.as_json}
  end
end