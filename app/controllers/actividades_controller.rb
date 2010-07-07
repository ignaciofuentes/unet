class ActividadesController < ApplicationController
  # GET /actividades
  # GET /actividades.xml
#skip_before_filter :require_user, :only => [:index, :show]
filter_resource_access

  def index
    @actividades = Actividad.search(params[:search])
  end

  # GET /actividades/1
  # GET /actividades/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @actividad }
    end
  end

  # GET /actividades/new
  # GET /actividades/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @actividad }
    end
  end

  # GET /actividades/1/edit
  def edit
    @actividad = Actividad.find(params[:id])
  end

  # POST /actividades
  # POST /actividades.xml
  def create
    @actividad = Actividad.new(params[:actividad])

    respond_to do |format|
      if @actividad.save
        flash[:notice] = 'Actividad was successfully created.'
        format.html { redirect_to(@actividad) }
        format.xml  { render :xml => @actividad, :status => :created, :location => @actividad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @actividad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /actividades/1
  # PUT /actividades/1.xml
  def update
    @actividad = Actividad.find(params[:id])

    respond_to do |format|
      if @actividad.update_attributes(params[:actividad])
        flash[:notice] = 'Actividad was successfully updated.'
        format.html { redirect_to(@actividad) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @actividad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /actividades/1
  # DELETE /actividades/1.xml
  def destroy
    @actividad = Actividad.find(params[:id])
    @actividad.destroy

    respond_to do |format|
      format.html { redirect_to(actividades_url) }
      format.xml  { head :ok }
    end
  end
end
