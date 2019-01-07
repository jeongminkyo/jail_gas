# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

find_config = Config.find_by_product_name('10kg')
unless find_config.present?
  Config.create( product_name: '10kg', cost: 0, count: 0)
  Config.create( product_name: '20kg', cost: 0, count: 0)
  Config.create( product_name: '50kg', cost: 0, count: 0)
  Config.create( product_name: 'air', cost: 0, count: 0)
  Config.create( product_name: 'butane', cost: 0, count: 0)
  Config.create( product_name: 'argon', cost: 0, count: 0)
  Config.create( product_name: 'share', cost: 0, count: 0)
  Config.create( product_name: 'per_money', cost: 0, count: 0)
end

Resident.create(dong:'A', ho:101 ,name:'최화출' )
Resident.create(dong:'A', ho:102 ,name:'최화출' )
Resident.create(dong:'A', ho:103 ,name:'최인섭' )
Resident.create(dong:'A', ho:104 ,name:'최광섭' )
Resident.create(dong:'A', ho:105 ,name:'김미옥(2)' )
Resident.create(dong:'A', ho:106 ,name:'김두수' )
Resident.create(dong:'A', ho:107 ,name:'김지수(2)' )
Resident.create(dong:'A', ho:201 ,name:'최병천' )
Resident.create(dong:'A', ho:202 ,name:'김부길' )
Resident.create(dong:'A', ho:203 ,name:'최병택' )
Resident.create(dong:'A', ho:204 ,name:'곽희진(2)' )
Resident.create(dong:'A', ho:205 ,name:'김병기' )
Resident.create(dong:'A', ho:206 ,name:'김기술' )
Resident.create(dong:'A', ho:207 ,name:'곽 휘' )
Resident.create(dong:'A', ho:208 ,name:'정례분' )

Resident.create(dong:'B', ho:101 ,name:'최언섭' )
Resident.create(dong:'B', ho:102 ,name:'신경옥' )
Resident.create(dong:'B', ho:103 ,name:'최경섭(2)' )
Resident.create(dong:'B', ho:104 ,name:'김동웅' )
Resident.create(dong:'B', ho:105 ,name:'이태언' )
Resident.create(dong:'B', ho:106 ,name:'염달선(1.5)' )
Resident.create(dong:'B', ho:107 ,name:'최득섭(1.5)' )
Resident.create(dong:'B', ho:201 ,name:'최순출' )
Resident.create(dong:'B', ho:202 ,name:'김명희' )
Resident.create(dong:'B', ho:203 ,name:'김의호' )
Resident.create(dong:'B', ho:204 ,name:'황순예' )
Resident.create(dong:'B', ho:205 ,name:'최권섭' )
Resident.create(dong:'B', ho:206 ,name:'허보근' )
Resident.create(dong:'B', ho:207 ,name:'박기화' )
Resident.create(dong:'B', ho:208 ,name:'김동완' )
Resident.create(dong:'B', ho:209 ,name:'정남조' )

Resident.create(dong:'C', ho:101 ,name:'박성수' )
Resident.create(dong:'C', ho:102 ,name:'김동걸' )
Resident.create(dong:'C', ho:103 ,name:'박육신' )
Resident.create(dong:'C', ho:104 ,name:'임소영' )
Resident.create(dong:'C', ho:105 ,name:'김서현(2)' )
Resident.create(dong:'C', ho:106 ,name:'최성숙' )
Resident.create(dong:'C', ho:107 ,name:'박삼희' )
Resident.create(dong:'C', ho:108 ,name:'하상주' )
Resident.create(dong:'C', ho:201 ,name:'최명섭(2)' )
Resident.create(dong:'C', ho:202 ,name:'배미숙' )
Resident.create(dong:'C', ho:203 ,name:'최성자' )
Resident.create(dong:'C', ho:204 ,name:'우경애(1.5)' )
Resident.create(dong:'C', ho:205 ,name:'최정웅' )
Resident.create(dong:'C', ho:206 ,name:'최병선' )
Resident.create(dong:'C', ho:207 ,name:'최금란' )

Resident.create(dong:'D', ho:101 ,name:'김남순' )
Resident.create(dong:'D', ho:102 ,name:'김유식' )
Resident.create(dong:'D', ho:103 ,name:'최병돌' )
Resident.create(dong:'D', ho:104 ,name:'최병일(2)' )
Resident.create(dong:'D', ho:105 ,name:'최병화(2)' )
Resident.create(dong:'D', ho:106 ,name:'김영화(2)' )
Resident.create(dong:'D', ho:201 ,name:'최창렬(2)' )
Resident.create(dong:'D', ho:202 ,name:'최수진' )
Resident.create(dong:'D', ho:203 ,name:'김종국(2)' )
Resident.create(dong:'D', ho:204 ,name:'윤성일' )
Resident.create(dong:'D', ho:205 ,name:'김종열(3)' )

Resident.create(dong:'E', ho:101 ,name:'김미애(2.5)' )
Resident.create(dong:'E', ho:102 ,name:'방정식(2.5)' )
Resident.create(dong:'E', ho:103 ,name:'최상태' )
Resident.create(dong:'E', ho:104 ,name:'김형덕' )
Resident.create(dong:'E', ho:105 ,name:'최문곤' )
Resident.create(dong:'E', ho:106 ,name:'최부길' )
Resident.create(dong:'E', ho:201 ,name:'최상원' )
Resident.create(dong:'E', ho:202 ,name:'최경조' )
Resident.create(dong:'E', ho:203 ,name:'윤경리' )
Resident.create(dong:'E', ho:204 ,name:'최규언' )
Resident.create(dong:'E', ho:205 ,name:'김춘자' )
Resident.create(dong:'E', ho:206 ,name:'허만순' )
Resident.create(dong:'E', ho:207 ,name:'곽말순' )
Resident.create(dong:'E', ho:208 ,name:'김영순(2)' )

Resident.create(dong:'F', ho:101 ,name:'이하자' )
Resident.create(dong:'F', ho:102 ,name:'김구희(2)' )
Resident.create(dong:'F', ho:103 ,name:'김동운(2)' )
Resident.create(dong:'F', ho:104 ,name:'오국자' )
Resident.create(dong:'F', ho:105 ,name:'정동일(1.5)' )
Resident.create(dong:'F', ho:106 ,name:'정상봉(1.5)' )
Resident.create(dong:'F', ho:201 ,name:'조성오(2)' )
Resident.create(dong:'F', ho:202 ,name:'정제윤(2)' )
Resident.create(dong:'F', ho:203 ,name:'최봉섭(2)' )
Resident.create(dong:'F', ho:204 ,name:'최지현' )
Resident.create(dong:'F', ho:205 ,name:'최낙훈' )
Resident.create(dong:'F', ho:206 ,name:'정윤선' )

admin_user = User.create( email: 'admin@email.com', password: 'tlsrnd13!@')
admin_user.add_role :admin
