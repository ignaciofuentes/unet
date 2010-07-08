class TemasController < ApplicationController
  # GET /temas
  # GET /temas.xml
filter_resource_access
  def index
    @temas = Tema.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @temas }
    end
  end

  # GET /temas/1
  # GET /temas/1.xml
  def show
    @tema = Tema.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tema }
    end
  end

  # GET /temas/new
  # GET /temas/new.xml
  def new
    @tema = Tema.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tema }
    end
  end

  # GET /temas/1/edit
  def edit
    @tema = Tema.find(params[:id])
  end

  # POST /temas
  # POST /temas.xml
  def create
    @tema = Tema.new(params[:tema])

    respond_to do |format|
      if @tema.save
        format.html { redirect_to(@tema, :notice => 'El tema fue añadido exitosamente') }
        format.xml  { render :xml => @tema, :status => :created, :location => @tema }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tema.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /temas/1
  # PUT /temas/1.xml
  def update
    @tema = Tema.find(params[:id])

    respond_to do |format|
      if @tema.update_attributes(params[:tema])
        format.html { redirect_to(@tema, :notice => 'El Tema se actualizo exitosamente') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tema.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /temas/1
  # DELETE /temas/1.xml
  def destroy
    @tema = Tema.find(params[:id])
    @tema.destroy

    respond_to do |format|
      format.html { redirect_to(temas_url) }
      format.xml  { head :ok }
    end
  end
end
