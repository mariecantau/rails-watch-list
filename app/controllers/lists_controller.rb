class ListsController < ApplicationController
  # récupérer toutes les listes
  def index
    @lists = List.all
  end

  # récupérer une liste existante
  def show
    @list = List.find(params[:id])
  end

  # préparer une nvelle liste vide (form)
  #   méthode ActiveRecord pour créer un objet vide sans le save
  def new
    @list = List.new
  end

  # récupérer les données du form
  # créer une liste en base
  # save / rediriger
  #   méthode ActiveRecord pour créer un objet à partir des params
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
