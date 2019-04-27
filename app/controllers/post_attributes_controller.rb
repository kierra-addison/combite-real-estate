class PostAttributesController < ApplicationController
  before_action :require_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_post_attribute, only: [:edit, :update, :destroy]

  # GET /post_attributes/new
  def new
    @post_attribute = PostAttribute.new
  end

  # GET /post_attributes/1/edit
  def edit
  end

  # POST /post_attributes
  # POST /post_attributes.json
  def create
    @post_attribute = PostAttribute.new(post_attribute_params)
    @post_attribute.post_id = params[:post_id]

    respond_to do |format|
      if @post_attribute.save
        format.html { redirect_to edit_post_path(id: @post_attribute.post_id), flash: { success: 'Post attribute was successfully created.' } }
        format.json { render :show, status: :created, location: @post_attribute }
      else
        format.html { render :new }
        format.json { render json: @post_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_attributes/1
  # PATCH/PUT /post_attributes/1.json
  def update
    respond_to do |format|
      if @post_attribute.update(post_attribute_params)
        format.html { redirect_to edit_post_path(id: @post_attribute.post_id), flash: { success: 'Post attribute was successfully updated.' } }
        format.json { render :show, status: :ok, location: @post_attribute }
      else
        format.html { render :edit }
        format.json { render json: @post_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_attributes/1
  # DELETE /post_attributes/1.json
  def destroy
    @post_attribute.destroy
    respond_to do |format|
      format.html { redirect_to edit_post_path(id: params[:post_id]), flash: { info: 'Post attribute was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_attribute
      @post_attribute = PostAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_attribute_params
      params.require(:post_attribute).permit(:attribute_name, :attribute_value)
    end
end
