pp = Player.where(season = '2022-2023-keeper')
ppa = pp.to_a

ppa.each do |k|
  r = Player.where("name = ? AND season = '2022-2023'", k.name).take
  r.even_strength = k.even_strength
  r.draft_year = k.draft_year
  r.contract = k.contract
  r.info = k.info
  r.save
end 
