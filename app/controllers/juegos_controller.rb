class JuegosController < ApplicationController
  # GET /juegos
  # GET /juegos.xml
  def index
    @juegos = Juego.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @juegos }
    end
  end

  # GET /juegos/1
  # GET /juegos/1.xml
  def show
    @juego = Juego.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @juego }
    end
  end

  # GET /juegos/new
  # GET /juegos/new.xml
  def new
    @juego = Juego.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @juego }
    end
  end

  # GET /juegos/1/edit
  def edit
    @juego = Juego.find(params[:id])
  end

  # POST /juegos
  # POST /juegos.xml
  def create
    @juego = Juego.new(params[:juego])

    respond_to do |format|
      if @juego.save
        format.html { redirect_to(@juego, :notice => 'Juego was successfully created.') }
        format.xml  { render :xml => @juego, :status => :created, :location => @juego }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @juego.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /juegos/1
  # PUT /juegos/1.xml
  def update
    @juego = Juego.find(params[:id])

    respond_to do |format|
      if @juego.update_attributes(params[:juego])
        format.html { redirect_to(@juego, :notice => 'Juego was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @juego.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /juegos/1
  # DELETE /juegos/1.xml
  def destroy
    @juego = Juego.find(params[:id])
    @juego.destroy

    respond_to do |format|
      format.html { redirect_to(juegos_url) }
      format.xml  { head :ok }
    end
  end
end
