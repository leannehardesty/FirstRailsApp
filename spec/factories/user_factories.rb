

FactoryGirl.define do


#  Theoretically, you would have to write factory :user, class: User 
# do to specify which class (aka model) this factory is using. But FactoryGirl 
# is smart enough to "guess" the User model if you call the factory :user. That's 
# why you don't need to specify the class in this case. Just keep in mind to add class: ... 
# whenever you create a factory that doesn't have the same name as a model.
	
	factory :user do
		sequence(:email) { |n| "user#{n}@example.com" }
		sequence(:password) { |n| "4444#9999"}
	    email
	    password
	    first_name "LeeLee"
	    last_name "Hardesty"
	    admin false
  	end

  	factory :admin, class: User do
  		sequence(:email) { |n| "user#{n}@example.com" }
  		sequence(:password) { |n| "4444#9999"}
  		email  
  		password  
  		admin true
  		first_name "Admin"
  		last_name "User"
	end
	




end
