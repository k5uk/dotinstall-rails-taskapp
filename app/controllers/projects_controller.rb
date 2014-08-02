class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all #viewの中でそのまま使える
	end

	def show
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path
		else
			render 'new' #newのviewに戻る
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			redirect_to projects_path
		else
			render 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

		def project_params #project_paramsについてはprivate関数で定義するのが代表的な手法
			params[:project].permit(:title) #projectで渡ってきた中の物のうち、タイトルだけを引っ張ってきてねという意味。セキュリティ上、フォームから渡ってきたものについてプロジェクトとタイトルだけ必要という時はこういうふうにフィルタリングをかけるのが最近のやり方。
		end

		def set_project
			@project = Project.find(params[:id]) #URLで渡ってきた数字はparamsで取ってこれる。シンボルはrake routesで表示されるshowのid。
		end
end
