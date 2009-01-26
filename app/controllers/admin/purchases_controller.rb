module Admin
  class PurchasesController < ApplicationController
    access_control do
      allow :admin_0, :admin_1
      allow :admin_2, :except => :destroy
    end

    # GET /purchases
    # GET /purchases.xml
    def index
      @purchases = Purchase.find(:all)

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @purchases }
      end
    end

    # GET /purchases/1
    # GET /purchases/1.xml
    def show
      @purchase = Purchase.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @purchase }
      end
    end

    # GET /purchases/new
    # GET /purchases/new.xml
    def new
      @purchase = Purchase.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @purchase }
      end
    end

    # GET /purchases/1/edit
    def edit
      @purchase = Purchase.find(params[:id])
    end

    # POST /purchases
    # POST /purchases.xml
    def create
      @purchase = Purchase.new(params[:purchase])

      respond_to do |format|
        if @purchase.save
          flash[:notice] = 'Purchase was successfully created.'
          format.html { redirect_to(@purchase) }
          format.xml  { render :xml => @purchase, :status => :created, :location => @purchase }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
        end
      end
    end

    # PUT /purchases/1
    # PUT /purchases/1.xml
    def update
      @purchase = Purchase.find(params[:id])

      respond_to do |format|
        if @purchase.update_attributes(params[:purchase])
          flash[:notice] = 'Purchase was successfully updated.'
          format.html { redirect_to(@purchase) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
        end
      end
    end

    # DELETE /purchases/1
    # DELETE /purchases/1.xml
    def destroy
      @purchase = Purchase.find(params[:id])
      @purchase.destroy

      respond_to do |format|
        format.html { redirect_to(purchases_url) }
        format.xml  { head :ok }
      end
    end
  end
end
