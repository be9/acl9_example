require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProductsController do

  def mock_product(stubs={})
    @mock_product ||= mock_model(Product, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all products as @products" do
      Product.should_receive(:find).with(:all).and_return([mock_product])
      get :index
      assigns[:products].should == [mock_product]
    end

    describe "with mime type of xml" do
  
      it "should render all products as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Product.should_receive(:find).with(:all).and_return(products = mock("Array of Products"))
        products.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested product as @product" do
      Product.should_receive(:find).with("37").and_return(mock_product)
      get :show, :id => "37"
      assigns[:product].should equal(mock_product)
    end
    
    describe "with mime type of xml" do

      it "should render the requested product as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Product.should_receive(:find).with("37").and_return(mock_product)
        mock_product.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new product as @product" do
      Product.should_receive(:new).and_return(mock_product)
      get :new
      assigns[:product].should equal(mock_product)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested product as @product" do
      Product.should_receive(:find).with("37").and_return(mock_product)
      get :edit, :id => "37"
      assigns[:product].should equal(mock_product)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created product as @product" do
        Product.should_receive(:new).with({'these' => 'params'}).and_return(mock_product(:save => true))
        post :create, :product => {:these => 'params'}
        assigns(:product).should equal(mock_product)
      end

      it "should redirect to the created product" do
        Product.stub!(:new).and_return(mock_product(:save => true))
        post :create, :product => {}
        response.should redirect_to(product_url(mock_product))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved product as @product" do
        Product.stub!(:new).with({'these' => 'params'}).and_return(mock_product(:save => false))
        post :create, :product => {:these => 'params'}
        assigns(:product).should equal(mock_product)
      end

      it "should re-render the 'new' template" do
        Product.stub!(:new).and_return(mock_product(:save => false))
        post :create, :product => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested product" do
        Product.should_receive(:find).with("37").and_return(mock_product)
        mock_product.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :product => {:these => 'params'}
      end

      it "should expose the requested product as @product" do
        Product.stub!(:find).and_return(mock_product(:update_attributes => true))
        put :update, :id => "1"
        assigns(:product).should equal(mock_product)
      end

      it "should redirect to the product" do
        Product.stub!(:find).and_return(mock_product(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(product_url(mock_product))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested product" do
        Product.should_receive(:find).with("37").and_return(mock_product)
        mock_product.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :product => {:these => 'params'}
      end

      it "should expose the product as @product" do
        Product.stub!(:find).and_return(mock_product(:update_attributes => false))
        put :update, :id => "1"
        assigns(:product).should equal(mock_product)
      end

      it "should re-render the 'edit' template" do
        Product.stub!(:find).and_return(mock_product(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested product" do
      Product.should_receive(:find).with("37").and_return(mock_product)
      mock_product.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the products list" do
      Product.stub!(:find).and_return(mock_product(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(products_url)
    end

  end

end
