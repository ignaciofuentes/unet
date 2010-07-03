class UniversidadesController < ApplicationController
filter_resource_access

  def index
    @universidades = Universidad.search(params[:term])
  end

  
  def show
    @universidad = Universidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @universidad }
    end
  end

  def new
    @universidad = Universidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @universidad }
    end
  end

  def edit
    @universidad = Universidad.find(params[:id])
  end
  
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

  def destroy
    @universidad = Universidad.find(params[:id])
    @universidad.destroy

    respond_to do |format|
      format.html { redirect_to(universidades_url) }
      format.xml  { head :ok }
    end
  end
end
