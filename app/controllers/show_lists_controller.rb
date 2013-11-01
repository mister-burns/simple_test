class ShowListsController < ApplicationController
  before_action :set_show_list, only: [:show, :edit, :update, :destroy]

  require 'rubygems'
  require 'json'
  require 'net/http'

  respond_to :json

  # GET /show_lists
  # GET /show_lists.json
  def index
    @show_lists = ShowList.all
  end

  # GET /show_lists/1
  # GET /show_lists/1.json
  def show
  end

  # GET /show_lists/new
  def new
    @show_list = ShowList.new
  end

  # GET /show_lists/1/edit
  def edit
  end

  # POST /show_lists
  # POST /show_lists.json
  def create
    @show_list = ShowList.new(show_list_params)

    respond_to do |format|
      if @show_list.save
        format.html { redirect_to @show_list, notice: 'Show list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @show_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /show_lists/1
  # PATCH/PUT /show_lists/1.json
  def update
    respond_to do |format|
      if @show_list.update(show_list_params)
        format.html { redirect_to @show_list, notice: 'Show list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /show_lists/1
  # DELETE /show_lists/1.json
  def destroy
    @show_list.destroy
    respond_to do |format|
      format.html { redirect_to show_lists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show_list
      @show_list = ShowList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_list_params
      params.require(:show_list).permit(:lable, :number_of_episodes, :number_of_seasons, :release_date, :wiki_page_id, :wiki_page_revision_id, :language, :country, :network, :format)
    end
end
