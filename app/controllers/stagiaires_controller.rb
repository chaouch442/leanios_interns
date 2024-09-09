class StagiairesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_stagiaire, only: [:show, :edit, :update, :destroy]

  def index
    @stagiaires = Stagiaire.all
  
    if params[:query].present?
      @stagiaires = @stagiaires.where('last_name ILIKE ? OR first_name ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
    end
  end

  def show
    @internships = @stagiaire.internships
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Stagiaire non trouvé"
    redirect_to stagiaires_path
  end

  def new
    @stagiaire = Stagiaire.new
  end

  def create
    @stagiaire = Stagiaire.new(stagiaire_params)

    if @stagiaire.save
      redirect_to @stagiaire, notice: 'Le stagiaire a été créé avec succès.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @stagiaire.update(stagiaire_params)
      redirect_to @stagiaire, notice: 'Le stagiaire a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @stagiaire.destroy
    redirect_to stagiaires_url, notice: 'Le stagiaire a été supprimé avec succès.'
  end

  # Affiche la liste des stagiaires en cours
  def en_cours
    @stagiaires = Stagiaire.where(status: 'en_cours')
  end

  # Affiche la liste des stagiaires terminés
  def termines
    @stagiaires = Stagiaire.where(status: 'termine')
  end

  def new_en_cours
    @stagiaire = Stagiaire.new
  end

  def create_en_cours
    @stagiaire = Stagiaire.new(stagiaire_params.merge(status: 'en_cours'))

    if @stagiaire.save
      redirect_to en_cours_stagiaires_path, notice: 'Le stagiaire en cours a été ajouté avec succès.'
    else
      render :new_en_cours
    end
  end

  private

  def set_stagiaire
    @stagiaire = Stagiaire.find(params[:id])
  end

  def stagiaire_params
    params.require(:stagiaire).permit(:last_name, :first_name, :cin, :birthdate, :phone_number, :status)
  end
end
