class InternshipsController < ApplicationController
  before_action :set_stagiaire
  before_action :set_internship, only: [:edit, :update, :destroy]

  def index
    @internships = @stagiaire.internships
  end
  def show
    @internship = Internship.find(params[:id])
    @documents = @internship.to_documents.active
  end

  def new
    @internship = @stagiaire.internships.new
  end

  def create
    @internship = @stagiaire.internships.new(internship_params)
    if @internship.save
      redirect_to stagiaire_path(@stagiaire), notice: 'Le stage a été créé avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @internship.update(internship_params)
      redirect_to stagiaire_path(@stagiaire), notice: 'Le stage a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @internship.destroy
    redirect_to stagiaire_path(@stagiaire), notice: 'Le stage a été supprimé avec succès.'
  end

  private

  def set_stagiaire
    @stagiaire = Stagiaire.find(params[:stagiaire_id])
  end

  def set_internship
    @internship = @stagiaire.internships.find(params[:id])
  end

  def internship_params
    params.require(:internship).permit(:start_date, :end_date, :specialty, :project)
  end
end
