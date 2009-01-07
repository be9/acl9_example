require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PurchasesController do

  def mock_purchase(stubs={})
    @mock_purchase ||= mock_model(Purchase, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all purchases as @purchases" do
      Purchase.should_receive(:find).with(:all).and_return([mock_purchase])
      get :index
      assigns[:purchases].should == [mock_purchase]
    end

    describe "with mime type of xml" do
  
      it "should render all purchases as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Purchase.should_receive(:find).with(:all).and_return(purchases = mock("Array of Purchases"))
        purchases.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested purchase as @purchase" do
      Purchase.should_receive(:find).with("37").and_return(mock_purchase)
      get :show, :id => "37"
      assigns[:purchase].should equal(mock_purchase)
    end
    
    describe "with mime type of xml" do

      it "should render the requested purchase as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Purchase.should_receive(:find).with("37").and_return(mock_purchase)
        mock_purchase.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new purchase as @purchase" do
      Purchase.should_receive(:new).and_return(mock_purchase)
      get :new
      assigns[:purchase].should equal(mock_purchase)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested purchase as @purchase" do
      Purchase.should_receive(:find).with("37").and_return(mock_purchase)
      get :edit, :id => "37"
      assigns[:purchase].should equal(mock_purchase)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created purchase as @purchase" do
        Purchase.should_receive(:new).with({'these' => 'params'}).and_return(mock_purchase(:save => true))
        post :create, :purchase => {:these => 'params'}
        assigns(:purchase).should equal(mock_purchase)
      end

      it "should redirect to the created purchase" do
        Purchase.stub!(:new).and_return(mock_purchase(:save => true))
        post :create, :purchase => {}
        response.should redirect_to(purchase_url(mock_purchase))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved purchase as @purchase" do
        Purchase.stub!(:new).with({'these' => 'params'}).and_return(mock_purchase(:save => false))
        post :create, :purchase => {:these => 'params'}
        assigns(:purchase).should equal(mock_purchase)
      end

      it "should re-render the 'new' template" do
        Purchase.stub!(:new).and_return(mock_purchase(:save => false))
        post :create, :purchase => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested purchase" do
        Purchase.should_receive(:find).with("37").and_return(mock_purchase)
        mock_purchase.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :purchase => {:these => 'params'}
      end

      it "should expose the requested purchase as @purchase" do
        Purchase.stub!(:find).and_return(mock_purchase(:update_attributes => true))
        put :update, :id => "1"
        assigns(:purchase).should equal(mock_purchase)
      end

      it "should redirect to the purchase" do
        Purchase.stub!(:find).and_return(mock_purchase(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(purchase_url(mock_purchase))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested purchase" do
        Purchase.should_receive(:find).with("37").and_return(mock_purchase)
        mock_purchase.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :purchase => {:these => 'params'}
      end

      it "should expose the purchase as @purchase" do
        Purchase.stub!(:find).and_return(mock_purchase(:update_attributes => false))
        put :update, :id => "1"
        assigns(:purchase).should equal(mock_purchase)
      end

      it "should re-render the 'edit' template" do
        Purchase.stub!(:find).and_return(mock_purchase(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested purchase" do
      Purchase.should_receive(:find).with("37").and_return(mock_purchase)
      mock_purchase.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the purchases list" do
      Purchase.stub!(:find).and_return(mock_purchase(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(purchases_url)
    end

  end

end
