class Admin::UploadsController < Admin::BaseController

  def new; end

  def create
    puts "file: #{params[:file]}"
    if Product.import_file params[:file]
      flash[:success] = "Imported successfully"
      redirect_to admin_products_path
    else
      flash[:danger] = "Failed to import"
      render :new
    end
  end
end
