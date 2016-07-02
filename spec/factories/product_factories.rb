

FactoryGirl.define do


 
	
	factory :product do

		sequence(:name) { |n| "Bike#" }
	    sequence(:price) { |n| "$#"}
	    description "An excellent bike!"
	    
	   
		 
  	end

end
