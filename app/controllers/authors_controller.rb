class AuthorsController < ApplicationController
      def new
            @author = Author.new
      end

      def create
            puts params
            @author = Author.new(params.require(:author).permit(:first_name, :last_name, :homepage))
            if @author.save
                  redirect_to root_path, notice: 'Success!'
            else
                  render 'new'
            end
      end

      def show
            @author = Author.find(params[:id])
      end

      def index
            @authors = Author.all
      end

      private
      def author_params
            params.require(:author).permit(:last_name, :first_name, :homepage)
      end

end
