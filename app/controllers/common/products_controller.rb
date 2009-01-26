module Common
  class ProductsController < ApplicationController
    access_control do
      allow :partner, :admin

      actions :index, :show do 
        allow all 
      end

      actions :new, :edit, :create, :update do
        allow :partner_2, :partner_1
        allow :admin_2, :admin_1
      end

      actions :destroy do
        allow :partner_1
        allow :admin_1
      end
    end

    # GET /products
    # GET /products.xml
    def index
      @products = Product.find(:all)

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @products }
      end
    end

    # GET /products/1
    # GET /products/1.xml
    def show
      @product = Product.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @product }
      end
    end

    # GET /products/new
    # GET /products/new.xml
    def new
      @product = Product.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @product }
      end
    end

    # GET /products/1/edit
    def edit
      @product = Product.find(params[:id])
    end

    # POST /products
    # POST /products.xml
    def create
      @product = Product.new(params[:product])

      respond_to do |format|
        if @product.save
          flash[:notice] = 'Product was successfully created.'
          format.html { redirect_to(@product) }
          format.xml  { render :xml => @product, :status => :created, :location => @product }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /products/1
    # PUT /products/1.xml
    def update
      @product = Product.find(params[:id])

      respond_to do |format|
        if @product.update_attributes(params[:product])
          flash[:notice] = 'Product was successfully updated.'
          format.html { redirect_to(@product) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1
    # DELETE /products/1.xml
    def destroy
      @product = Product.find(params[:id])
      @product.destroy

      respond_to do |format|
        format.html { redirect_to(products_url) }
        format.xml  { head :ok }
      end
    end
  end
end
