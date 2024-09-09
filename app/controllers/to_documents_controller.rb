class ToDocumentsController < ApplicationController
  before_action :set_internship
  before_action :set_stagiaire, only: [:new, :create, :edit, :update, :destroy, :archive]
  before_action :set_to_document, only: [:edit, :update, :destroy, :archive]

  def index
    @to_documents = @internship.to_documents
  end

  def new
    @to_document = @internship.to_documents.new
  end

  def create
    @to_document = @internship.to_documents.new(to_document_params)
    if @to_document.save
      redirect_to stagiaire_internship_to_documents_path(@internship.stagiaire, @internship), notice: 'Document ajouté avec succès.'
    else
      render :new
    end
  end

  def edit
    @to_document = @internship.to_documents.find(params[:id])
  end
  

  def update
    if @to_document.update(to_document_params)
      redirect_to stagiaire_internship_to_documents_path(@internship.stagiaire, @internship), notice: 'Document modifié avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @to_document.destroy
    redirect_to stagiaire_internship_to_documents_path(@internship.stagiaire, @internship), notice: 'Document supprimé avec succès.'
  end

  def archive
    @to_document = @internship.to_documents.find(params[:id])
    if @to_document.update(archived: true)
      redirect_to stagiaire_internship_to_documents_path(@internship.stagiaire, @internship), notice: 'Document archivé avec succès.'
    else
      render :index, alert: 'Impossible d’archiver le document.'
    end
  end
  

  private

  def set_internship
    @internship = Internship.find(params[:internship_id])
  end

  def set_stagiaire
    @stagiaire = @internship.stagiaire
  end

  def set_to_document
    @to_document = @internship.to_documents.find_by(id: params[:id])
    if @to_document.nil?
      redirect_to stagiaire_internship_to_documents_path(@internship.stagiaire, @internship), alert: "Document introuvable"
    end
  end
  

  def to_document_params
    params.require(:to_document).permit(:name, :file, :archived)
  end
end
