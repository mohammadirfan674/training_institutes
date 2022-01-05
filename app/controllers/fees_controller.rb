class FeesController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @fee = @course.fees.create(fee_params)
      redirect_to course_path(@course)

  end

  def destroy
   @fee = Fee.find (params[:id])
   @fee.destroy
    redirect_to root_path
  end


  private
  def fee_params
   params.require(:fee).permit(:name, :duration, :amount,
      :certificate)
  end

end
