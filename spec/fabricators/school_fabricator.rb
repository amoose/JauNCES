Fabricator(:school) do
  nces_school_id  12345678
	state_school_id  456
	nces_district_id  67
	nces_state_district_id  78
	low_grade  'KG'
	high_grade  6
	name  'SUPER MAN GRADE SCHOOL'
	district  'UNDERGROUND ICE CASTLES'
	county  'SUPER COUNTY'
	street  '344 WILSHIRE BLVD'
	city  'NEW YORK'
	state  'NY'
	zip  10458
	zipfour  nil
	phone  '555-555-1234'
	locale_code  22
	locale  'District 9'
	charter  true
	magnet  false
	title_i  false
	title_i_wide  true
	students  500
	teachers  10
	st_ratio  '50'.to_f
	free_lunch  120
	reduced_lunch  90
end
