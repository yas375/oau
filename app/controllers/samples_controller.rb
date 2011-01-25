# -*- coding: utf-8 -*-
class SamplesController < ApplicationController
  def index
    @samples = Sample.all
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(params[:sample])
    if @sample.save
      redirect_to edit_sample_path(@sample)
    else
      render :action => 'edit'
    end
  end

  def edit
    @sample = Sample.find(params[:id])
    @data = Data::Table.new(@sample)
  end

  def update
    @sample = Sample.find(params[:id])
    if @sample.update_attributes(params[:sample])
      redirect_to edit_sample_path(@sample)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy
    flash[:notice] = "Выборка удалена"
    redirect_to samples_url
  end
end
