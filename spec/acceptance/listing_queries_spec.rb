require 'spec_helper'

resource "ListingQueries" do
  let(:raw_post) {params.to_json}

  post '/listing_queries/create' do
    parameter :listing_query, "Register a simple listing query"

    let(:listing_query) {
      {query:
          [{beds: ["long", [1]]},
           {baths: ["long", [1]]},
           {zip: ["string", ["38119"]]},
           {price:  ["long", [140000]]}
          ],
        resource_type: "listing",
        query_id: "memberID1-a1simple"
      }
    }


    example "1. Create a simple listing query" do
      do_request
      status.should == 200
    end

  end

  post '/listing_queries/create' do
    parameter :listing_query, "Register a listing query"

    let(:listing_query) {
      {query:
          [{beds: ["long", [1,3]]},
           {zip: ["string", ["38119", "38125"]]},
           {location: ["geopoint", [40, -70, "120km"]]},
           {price:  ["long", [140000, 200000]]}
          ],
        resource_type: "listing",
        query_id: "memberID1-q1"
      }
    }


    example "2. Create a new listing query" do
      do_request
      status.should == 200
    end

  end

end
