class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end
  
  def show
    @sample = Sample.find(params[:id])
  end
  
  def new
    @sample = Sample.new
  end
  
  def create
    @sample = Sample.new(params[:sample])
    if @sample.save
      flash[:notice] = "Successfully created sample."
      redirect_to @sample
    else
      render :action => 'new'
    end
  end
  
  def edit
    @sample = Sample.find(params[:id])
  end
  
  def update
    @sample = Sample.find(params[:id])
    if @sample.update_attributes(params[:sample])
      flash[:notice] = "Successfully updated sample."
      redirect_to @sample
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy
    flash[:notice] = "Successfully destroyed sample."
    redirect_to samples_url
  end
end
