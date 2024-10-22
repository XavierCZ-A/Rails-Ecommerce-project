# app/helpers/pagy_helper.rb
module PagyHelper
  include Pagy::Frontend

  def pagy_custom_nav(pagy)
    pagy_nav_html = pagy_nav(pagy)

    # Reemplaza las clases por defecto de Pagy con clases de Tailwind
    pagy_nav_html.gsub!('class="', 'class="flex justify-center items-center space-x-2 my-4 bg-blue-200 ') # Agregar clases a la lista
    pagy_nav_html.gsub!('class="pagy-selected"', 'class="bg-blue-600 text-white px-4 py-2 rounded-lg shadow-md"') # Estilo para el elemento seleccionado
    pagy_nav_html.gsub!('class="pagy-disabled"', 'class="opacity-50 cursor-not-allowed"') # Estilo para los elementos deshabilitados

    pagy_nav_html
  end
end
