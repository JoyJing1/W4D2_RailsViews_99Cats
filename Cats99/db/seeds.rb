Cat.create!(name: "Sarah", birth_date: "2000-01-01", color: "orange", description: "My name is Sarah.", sex: "M")
Cat.create!(name: "Mike", birth_date: "2001-01-01", color: "orange", description: "My name is Mike.", sex: "M")
Cat.create!(name: "Tabby", birth_date: "2002-01-01", color: "white", description: "My name is Tabby.", sex: "F")
Cat.create!(name: "Gabby", birth_date: "2003-01-01", color: "white", description: "My name is Gabby.", sex: "F")
Cat.create!(name: "Doggy", birth_date: "2004-01-01", color: "black", description: "My name is Doggy.", sex: "F")


CatRentalRequest.create!(cat_id: 1, start_date: "2015-01-01", end_date: "2015-02-01", status: "PENDING")
CatRentalRequest.create!(cat_id: 1, start_date: "2015-02-01", end_date: "2015-03-01", status: "PENDING")
CatRentalRequest.create!(cat_id: 1, start_date: "2015-03-01", end_date: "2015-04-01", status: "PENDING")
CatRentalRequest.create!(cat_id: 2, start_date: "2015-02-01", end_date: "2015-03-01", status: "PENDING")
CatRentalRequest.create!(cat_id: 2, start_date: "2015-03-01", end_date: "2015-04-01", status: "PENDING")
CatRentalRequest.create!(cat_id: 3, start_date: "2015-02-01", end_date: "2015-03-01", status: "PENDING")
