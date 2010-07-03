class EstudiantesController < ApplicationController
  # GET /estudiantes
  # GET /estudiantes.xml
  def index
    @estudiantes = Estudiante.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @estudiantes }
    end
  end

  # GET /estudiantes/1
  # GET /estudiantes/1.xml
  def show
    @estudiante = Estudiante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @estudiante }
    end
  end

  # GET /estudiantes/new
  # GET /estudiantes/new.xml
  def new
    @estudiante = Estudiante.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @estudiante }
    end
  end

  # GET /estudiantes/1/edit
  def edit
    @estudiante = Estudiante.find(params[:id])
  end

  # POST /estudiantes
  # POST /estudiantes.xml
  def create
    @estudiante = Estudiante.new(params[:estudiante])

    respond_to do |format|
      if @estudiante.save
        format.html { redirect_to(@estudiante, :notice => 'Estudiante was successfully created.') }
        format.xml  { render :xml => @estudiante, :status => :created, :location => @estudiante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @estudiante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /estudiantes/1
  # PUT /estudiantes/1.xml
  def update
    @estudiante = Estudiante.find(params[:id])

    respond_to do |format|
      if @estudiante.update_attributes(params[:estudiante])
        format.html { redirect_to(@estudiante, :notice => 'Estudiante was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @estudiante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /estudiantes/1
  # DELETE /estudiantes/1.xml
  def destroy
    @estudiante = Estudiante.find(params[:id])
    @estudiante.destroy

    respond_to do |format|
      format.html { redirect_to(estudiantes_url) }
      format.xml  { head :ok }
    end
  end
end
