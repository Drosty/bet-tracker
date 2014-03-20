json.array!(@bets) do |bet|
  json.extract! bet, :id, :description, :value, :init_user, :against_user, :winner
  json.url bet_url(bet, format: :json)
end
