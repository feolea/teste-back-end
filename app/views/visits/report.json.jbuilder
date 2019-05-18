# frozen_string_literal: true

json.array! @visits, partial: 'visits/visit', as: :visit
