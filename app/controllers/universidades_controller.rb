class UniversidadesController < ApplicationController
  # GET /universidades
  # GET /universidades.xml
 # skip_before_filter :require_user, :only => [:index, :show]
filter_resource_access
  def index
    @universidades = Universidad.search(params[:term])
  end

  # GET /universidades/1
  # GET /universidades/1.xml
  def show
    @universidad = Universidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @universidad }
    end
  end

  # GET /universidades/new
  # GET /universidades/new.xml
  def new
    @universidad = Universidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @universidad }
    end
  end

  # GET /universidades/1/edit
  def edit
    @universidad = Universidad.find(params[:id])
  end
  
  # POST /universidades
  # POST /universidades.xml
  def create
    @universidad = Universidad.new(params[:universidad])

    respond_to do |format|
      if @universidad.save
        flash[:notice] = @universidad.nombre+' creada con éxito'
        format.html { redirect_to(@universidad) }
        format.xml  { render :xml => @universidad, :status => :created, :location => @universidad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @universidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /universidades/1
  # PUT /universidades/1.xml
  def update
    @universidad = Universidad.find(params[:id])

    respond_to do |format|
      if @universidad.update_attributes(params[:universidad])
        flash[:notice] =@universidad.nombre+' modificada con éxito'
        format.html { redirect_to(@universidad) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @universidad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /universidades/1
  # DELETE /universidades/1.xml
  def destroy
    @universidad = Universidad.find(params[:id])
    @universidad.destroy

    respond_to do |format|
      format.html { redirect_to(universidades_url) }
      format.xml  { head :ok }
    end
  end
end
