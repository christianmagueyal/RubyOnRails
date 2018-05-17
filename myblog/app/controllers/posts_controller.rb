class PostsController < ApplicationController
    http_basic_authenticate_with name: "Christian", password: "1234", except: [:index, :show]
	def index
		#Gets all the posts
		@posts = Post.all

	end
	def show
		# finds the post using the :id
        @post = Post.find(params[:id])
	end
	def new
		@post = Post.new
	end
    def create
    	#render plain: params[:post].inspect
    	@post = Post.new(post_params)

    	# save must be called for changes to be commited.
    	# this redirects back to the show view
    	if(@post.save)
	    	redirect_to @post
    	else
    		render 'new'
    	end

    end
    def update
    	@post = Post.find(params[:id])
    	if(@post.update(post_params))
	    	redirect_to @post
    	else
    		render 'edit'
    	end
    end

    def edit
        @post = Post.find(params[:id])

    end
    def destroy
    	@post = Post.find(params[:id])
    	@post.destroy

    	redirect_to posts_path
    end


    private def post_params
    	# this fixed the forbidden attributes error. allows only title and body
    	params.require(:post).permit(:title, :body)
    end

end
