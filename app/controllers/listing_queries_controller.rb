class ListingQueriesController < ApplicationController

  def create
    query_hash = params[:listing_query]
    listingQ = ListingQuery.new
    listingQ.register_query(query_hash)
    render :json => {:result => "ok"}
  end

end