class BookController < ApplicationController
	# call to layout named 'standard.html.erb'
	layout 'standard'
	# get a list of all the books in db
	def list
		@books = Book.all
	end
# find object by condition: 
# find only book that has the id defined in params[:id]
	def show
		@book = Book.find(params[:id]) #params object is a container 
		# that enables u to pass value between method calls
	end
# lets Rails know that u will create a new object
	def new
		@book = Book.new
		@subjects = Subject.all
	end

	# def create
	# 	# create a new instance variable callled @book
	# 	@book = Book.new(book_params)
		
	# 	# if save is ok, redirect to list method
	# 	if @book.save
	# 		redirect_to :action =>'list'
	# 	else # if not, send back to 'new' method
	# 		@subjects = Subject.all
	# 		render :action => 'new'
			
	# 	end
	# end
def create
   @book = Book.new(book_params)
	
   if @book.save
      redirect_to :action => 'list'
   else
   	  # binding.pry
      @subjects = Subject.all
      render :action => 'new'
   end
   
end

def book_params

   params.require(:book).permit(:title, :price, :subject_id, :description)

end
# book_params : this method is used to collect all the fields from object :books
	# def book_params
	# 	params.require(:books).permit(:title, :price, :subject_id, :decription)		
	# end
# edit method is same as the 'show' method: 
# su dung de goi doi tuong tren co so id va the hien len 1 page.
# diem khac la, 'show' method k co phep edit.
	def edit
		@book = Book.find(params[:id])
		@subjects= Subject.all
	end

# called after 'edit' method
# is similar to 'create' method
	def update
		@book = Book.find(params[:id])
# update_attributes: this method is similar to 'save' method
# but instead of creating a new row, it overwrites the attributes of the existing row.
		if @book.update_attributes(book_params)
			redirect_to :action => 'show', :id => @book
			
		else
			@subjects = Subject.all # required in case it does'nt save successfully
			#  then becomes similar to edit option.
			render :action => 'edit'
		end

		# def book_param
		# 	params.require(:book).permit(:title, :price, :subject_id, :description)
		# end
	end

	def delete
		Book.find(params[:id]).destroy
		redirect_to :action => 'list'
	end

	# addintional methods:
	def show_subjects
		@subject = Subject.find(params[:id])
	end

end
