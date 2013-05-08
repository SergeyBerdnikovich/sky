class StaticPagesController < InheritedResources::Base

  def welcome
    respond_to do |format|
     format.html { render action: 'welcome' }
    end
  end

  def myaccount

  end
end
