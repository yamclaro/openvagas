class HomeController < ApplicationController
  
  def index
    @careers = Career.all
    @q = Position.ransack(params[:q] || {})
    # Realiza a consulta apenas se houver parâmetros de busca
    if params[:q].present? && @q.present?
      @pagy, @positions = pagy(@q.result(distinct: true).order(:id))

    else
      @positions = [] # Inicializa como um array vazio
      @pagy = Pagy.new(count: 0) # Cria um objeto Pagy vazio

      
    end
  end
  
end
