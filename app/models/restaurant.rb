class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews


#     Restaurant.fanciest
# returns one restaurant instance for the restaurant that has the highest price

    def self.fanciest
        Restaurant.all.order(price: :asc).first
    end


    # Restaurant#all_reviews
    # should return an Array of strings with all the reviews 
    # for this restaurant formatted as fo    

#     "Review for {insert restaurant name} by {insert customer's full name}: {insert review star_rating} stars.",
#   "Review for {insert restaurant name} by {insert customer's full name}: {insert review star_rating} stars.",
# ]
    def all_reviews
        Review.all.each do |review|
        "Review for #{review.restaurant.name}} by #{review.customer.full_name}: #{review.star_rating} stars."
        end
    end


end