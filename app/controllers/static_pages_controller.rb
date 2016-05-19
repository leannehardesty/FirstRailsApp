class StaticPagesController < ApplicationController
  

   def landing_page
   #def index
     # @products = Product.limit(3) 
      @products = Product.all
   end
   

end




