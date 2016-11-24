class CommentsController < ApplicationController
before_filter :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        #ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        #ProductChannel.broadcast_to @product.id, comment: @comment, average_rating: @product.average_rating
        #ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end

    def edit
    end

  end
  
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end
end
