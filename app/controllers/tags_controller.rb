class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tagged = Tagging.where(tag_id: @tag.id).map do |tagging|
      if !tagging.tutor_id.nil?
        Tutor.find(tagging.tutor_id)
      else
        Student.find(tagging.student_id)
      end
    end
  end

  def new
    @tag = Tag.new
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to @tag, notice: 'Tag was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'Tag was successfully deleted.'
  end

  def create
    @tag = Tag.create(tag_params)
    render json: @tag
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
