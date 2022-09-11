class ApplicationController < ActionController::Base

def top
  @customer= Customer.find(params[:id])
end


  private

  def customer_params
    params.require(:customer).permit(:name)
  end

end
