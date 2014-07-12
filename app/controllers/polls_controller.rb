class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]

  # GET /polls
  # GET /polls.json
  def index
    if !user_signed_in?
      redirect_to splash_path
    else
      poll_users = PollUser.where(user_id: current_user.id)
      @polls = []
      poll_users.each do |pu|
        @poll = Poll.find(pu.poll_id)
        unless @poll.food_time.past?
          @polls << @poll
        end
      end
    end
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @time_left = TimeDifference.between(Time.now, @poll.food_time).in_minutes
    @poll_items = PollItem.where(poll_id: @poll.id)
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        polluser = PollUser.new(user_id: current_user.id, poll_id: @poll.id)
        polluser.save!
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def poll_params
      params.require(:poll).permit(:title, :user_id, :description, :food_time, :active)
    end
end
