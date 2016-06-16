class ProductsController < ApplicationController
  respond_to :json, :html
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    #logger.debug "@products before conditional: #{@products}"
    
       search_term = params[:q]
        wildcard_search = "%#{search_term}%"

        @products = Product.where("name ILIKE ?", wildcard_search)

       #@products = Product.where("LOWER(name) LIKE ?", "%#{search_term.downcase}%")

       #@products = Product.where("name = ?", search_term)
       #@products = Product.where("name LIKE ?", "%#{search_term}%") 

    
    respond_with @products
  end




def self.search(client, date_start, date_end)
       joins(:customer).where("LOWER(customers.name) LIKE ? AND date >= ? AND date <= ?", "%#{client}%", date_start, date_end)
end
def self.search(search, page = 1 )
  wildcard_search = "%#{search}%"

  where("name ILIKE :search OR postal_code LIKE :search", search: wildcard_search)
    .page(page)
    .per_page(5)
end





  # GET /products/1
  # GET /products/1.json
  def show
      #@comments = @product.comments.order("created_at DESC")
      #Post.paginate(:page => params[:page], :per_page => 2)
      #@comments = Comment.paginate(:page => params[:page])
      #Comment.paginate(:page => params[:page], :per_page => 10)
       ## @comments = Comment.paginate(:page => params[:page])
      @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 2)
  end

  # GET /products/new
  def new
#byebug 
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
         
        #format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.html { redirect_to '/' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update

#byebug 

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :colour, :price)
    end
end
