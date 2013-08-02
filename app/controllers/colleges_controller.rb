class CollegesController < ApplicationController  
  
  before_filter :authorize
  layout 'main'
  
  def index
    @colleges = College.list   
    render :layout=>'main'
  end       

  def new
    @college = College.new
  end
  
  def create
    @college = College.new(params[:college])
    if @college.save
      flash[:notice] = 'College was successfully added.'
      redirect_to(colleges_path)
    else
      render :action => "new"
    end
  end
  
  def edit
    @college = College.find_by_permalink(params[:id])
  end
    
  def update
    @college = College.find_by_permalink(params[:id])
    if @college.update_attributes(params[:college])
      flash[:notice] = 'College was successfully updated.'
      redirect_to(colleges_path)
    else
      render :action => "edit"
    end
  end  
  
  def destroy
    @college = College.find_by_permalink(params[:id])
    @college.destroy
    redirect_to(colleges_path)
  end  
    
end
