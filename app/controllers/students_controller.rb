
class StudentsController < ApplicationController

  before_filter :authenticate, :only => [:admin, :admin_all, :destroy, :su_edit]
  
  # GET /students
  # GET /students.xml
  def index
    #hitting DB way too many times, should optimize
    @groups = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 0")
    @committees = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 1")
    
    @students = Student.find(:all)
    @students_count = @students.length
    @recent_students = Student.find(:all, :order => "created_at DESC", :limit => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end
  
  def message
    
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new
    @student.option_id = params[:id] if params[:id]
    
    @groups = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 0")
    @committees = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 1")


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @student.password = "";

    @groups = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 0")
    @committees = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 1")

  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student was successfully created.'
        format.html { redirect_to(students_url) }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if (params[:student][:password] && (@student.password == params[:student][:password]) && @student.update_attributes(params[:student]))
          flash[:notice] = 'Student was successfully updated.'
          format.html { redirect_to(students_url) }
          format.xml  { head :ok }
        else
          flash[:notice] = 'Incorrect Password. Try Again.'
          format.html { redirect_to(edit_student_path(@student)) }
          format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
        end
    end
  end
  

def admin
  @students = Student.find(:all) 
  @added = Student.find(:all, :order => "created_at DESC", :limit => 10)
  @updated = Student.find(:all, :order => "updated_at DESC", :limit => 10)
end

def admin_all
  @students = Student.find(:all, :order => "id DESC")
  
  @options = Option.all
  
  @options.each do |option|
      Option.update_counters option.id, :students_count => -option.students_count
      Option.update_counters option.id, :students_count => option.students.length
  end
end

def su_edit
    @student = Student.find(params[:id])

    @groups = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 0")
    @committees = Option.find(:all, :order => "id ASC", :conditions=> "option_type = 1")
end

def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      flash[:notice] = 'Student was successfully destroyed.'
      format.html { redirect_to(:action => "admin") }
      format.xml  { head :ok }
    end
end

protected

def authenticate
  authenticate_or_request_with_http_basic do |username, password|
    username == "admin" && password == "fuckyouall"
  end
end

end
