seed_users = [{firstName: "albert", lastName:"einstein", email: "ae@relativity.com"},
	           {firstName: "marle", lastName:"curle", email: "ms@radiation.com"},
	           {firstName: "issac", lastName:"newton", email: "in@gravity.com"},
	           {firstName: "galileo", lastName:"galileo", email: "gg@estronomy.com"},
	         ]

seed_users.each do |user|
  User.create(user)
end
