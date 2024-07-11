class PositionsController < ApplicationController
  before_action :set_company
  before_action :set_position, only: %i[ show edit update ]

  def index
    @positions = @company.positions
  end

  def new
    @position = @company.positions.new
  end

  def create
    @position = @company.positions.new(positions_params)
    if @position.save
      flash[:notice] = "Vaga cadastrada com sucesso"
      redirect_to root_path
    else
      flash[:error] = "Falha ao cadastrar vaga"
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @position.update(positions_params)
        format.html { redirect_to position_url(@position), notice: "Position was successfully updated." }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def set_company
    redirect_to new_company_path if current_user.company.nil?
    @company = current_user.company
  end

  def positions_params
    params.require(:position).permit(:name, :position_type_id, :city, :state, :sumary, :description, :career_id, :status)
  end
end
