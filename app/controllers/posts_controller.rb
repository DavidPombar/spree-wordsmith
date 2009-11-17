class PostsController < Spree::BaseController  

  resource_controller
  actions :show, :index

  index.response do |wants|
    wants.html
    wants.rss
  end

  show.before do    
    @comment = Comment.new(:post_id => @post.id)  
  end
    
  show.response do |wants|
    wants.html
    wants.rss
  end
    
private
  def collection
    @collection ||= end_of_association_chain.publish.paginate :page => params[:page]
  end
  
  def object
    @object ||= end_of_association_chain.publish.find(param) unless param.nil?
    @object
  end
  

end 