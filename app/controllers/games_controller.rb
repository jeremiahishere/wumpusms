class GamesController < ApplicationController
  def play
    @game = Game.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html
    end
  end

  def play_update
    @game = Game.find(params[:id])
    @message = Message.create(params[:message])
    @message.game = @game
    @message.save

    command = @message.parse_message
    message = @game.process_command(command[:value][0], command[:value][1])

    respond_to do |format|
      format.html { redirect_to(game_play_path(@game), :notice => message) }
    end
  end

  def play_over_sms
    text = params["session"]["initialText"]
    from = params["session"]["from"]
    network = from["network"]
    phone_number = from["id"]

    if network == "SMS" && phone_number =~ /^[0-9]+$/ 
      @user = User.find_by_phone_number(phone_number)
      if @user.nil?
        @user = User.create(:phone_number => phone_number)
      end

      @game = Game.where(:user_id => @user.id, :in_progress => true).first
      @game_message = "The game message has not been set correctly."
      # create a new game
      text = ":new" if @game.nil?
      m = Message.create(:game => @game, :user => @user, :message_text => text)
      message = m.parse_message

      message_to_user = ""
      if message[:type] == "help"
        message_to_user = "help"
      elsif message[:type] == "new"
        Game.where(:user_id => @user.id, :in_progress => true).each do |game|
          game.update_attributes(:in_progress => false)
        end
        @game = Game.create(:user_id => @user.id, :in_progress => true).first
        message_to_user = "Hunt The Wumpus"
      elsif message[:type] == "command"
        message_to_user = @game.parse_command(message[:value][0], message[:value][1])
      end
      render :json => Tropo::Generator.say(message_to_user)
    else
      render :json => Tropo::Generator.say("Unsupported operation")
    end
  end

  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end


  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to(@game, :notice => 'Game was successfully created.') }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to(@game, :notice => 'Game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
end
