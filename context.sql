

Table: area_code_state
Columns:
  area_code (INTEGER)
  state (varchar(2))


Table: contestants
Columns:
  contestant_number (INTEGER)
  contestant_name (varchar(50))


Table: votes
Columns:
  vote_id (INTEGER)
  phone_number (INTEGER)
  state (varchar(2))
  contestant_number (INTEGER)
  created (timestamp)


Table: museum
Columns:
  Museum_ID (INT)
  Name (TEXT)
  Num_of_Staff (INT)
  Open_Year (TEXT)


Table: visitor
Columns:
  ID (INT)
  Name (TEXT)
  Level_of_membership (INT)
  Age (INT)


Table: visit
Columns:
  Museum_ID (INT)
  visitor_ID (TEXT)
  Num_of_Ticket (INT)
  Total_spent (REAL)


Table: tv_channel
Columns:
  id (TEXT)
  series_name (TEXT)
  Country (TEXT)
  Language (TEXT)
  Content (TEXT)
  Pixel_aspect_ratio_PAR (TEXT)
  Hight_definition_TV (TEXT)
  Pay_per_view_PPV (TEXT)
  Package_Option (TEXT)


Table: tv_series
Columns:
  id (REAL)
  Episode (TEXT)
  Air_Date (TEXT)
  Rating (TEXT)
  Share (REAL)
  18_49_Rating_Share (TEXT)
  Viewers_m (TEXT)
  Weekly_Rank (REAL)
  Channel (TEXT)


Table: cartoon
Columns:
  id (REAL)
  Title (TEXT)
  Directed_by (TEXT)
  Written_by (TEXT)
  Original_air_date (TEXT)
  Production_code (REAL)
  Channel (TEXT)


Table: breeds
Columns:
  breed_code (VARCHAR(10))
  breed_name (VARCHAR(80))


Table: charges
Columns:
  charge_id (INTEGER)
  charge_type (VARCHAR(10))
  charge_amount (DECIMAL(19,4))


Table: sizes
Columns:
  size_code (VARCHAR(10))
  size_description (VARCHAR(80))


Table: treatment_types
Columns:
  treatment_type_code (VARCHAR(10))
  treatment_type_description (VARCHAR(80))


Table: owners
Columns:
  owner_id (INTEGER)
  first_name (VARCHAR(50))
  last_name (VARCHAR(50))
  street (VARCHAR(50))
  city (VARCHAR(50))
  state (VARCHAR(20))
  zip_code (VARCHAR(20))
  email_address (VARCHAR(50))
  home_phone (VARCHAR(20))
  cell_number (VARCHAR(20))


Table: dogs
Columns:
  dog_id (INTEGER)
  owner_id (INTEGER)
  abandoned_yn (VARCHAR(1))
  breed_code (VARCHAR(10))
  size_code (VARCHAR(10))
  name (VARCHAR(50))
  age (VARCHAR(20))
  date_of_birth (DATETIME)
  gender (VARCHAR(1))
  weight (VARCHAR(20))
  date_arrived (DATETIME)
  date_adopted (DATETIME)
  date_departed (DATETIME)


Table: professionals
Columns:
  professional_id (INTEGER)
  role_code (VARCHAR(10))
  first_name (VARCHAR(50))
  street (VARCHAR(50))
  city (VARCHAR(50))
  state (VARCHAR(20))
  zip_code (VARCHAR(20))
  last_name (VARCHAR(50))
  email_address (VARCHAR(50))
  home_phone (VARCHAR(20))
  cell_number (VARCHAR(20))


Table: treatments
Columns:
  treatment_id (INTEGER)
  dog_id (INTEGER)
  professional_id (INTEGER)
  treatment_type_code (VARCHAR(10))
  date_of_treatment (DATETIME)
  cost_of_treatment (DECIMAL(19,4))


Table: players
Columns:
  player_id (INT)
  first_name (TEXT)
  last_name (TEXT)
  hand (TEXT)
  birth_date (DATE)
  country_code (TEXT)


Table: matches
Columns:
  best_of (INT)
  draw_size (INT)
  loser_age (FLOAT)
  loser_entry (TEXT)
  loser_hand (TEXT)
  loser_ht (INT)
  loser_id (INT)
  loser_ioc (TEXT)
  loser_name (TEXT)
  loser_rank (INT)
  loser_rank_points (INT)
  loser_seed (INT)
  match_num (INT)
  minutes (INT)
  round (TEXT)
  score (TEXT)
  surface (TEXT)
  tourney_date (DATE)
  tourney_id (TEXT)
  tourney_level (TEXT)
  tourney_name (TEXT)
  winner_age (FLOAT)
  winner_entry (TEXT)
  winner_hand (TEXT)
  winner_ht (INT)
  winner_id (INT)
  winner_ioc (TEXT)
  winner_name (TEXT)
  winner_rank (INT)
  winner_rank_points (INT)
  winner_seed (INT)
  year (INT)


Table: rankings
Columns:
  ranking_date (DATE)
  ranking (INT)
  player_id (INT)
  ranking_points (INT)
  tours (INT)


Table: aircraft
Columns:
  aircraft_code (varchar(3))
  aircraft_description (varchar(50))
  manufacturer (varchar(30))
  basic_type (varchar(30))
  engines (int(11))
  propulsion (varchar(10))
  wide_body (varchar(3))
  wing_span (int(11))
  length (int(11))
  weight (int(11))
  capacity (int(11))
  pay_load (int(11))
  cruising_speed (int(11))
  range_miles (int(11))
  pressurized (varchar(3))


Table: airline
Columns:
  airline_code (varchar(2))
  airline_name (TEXT)
  note (TEXT)


Table: airport
Columns:
  airport_code (varchar(3))
  airport_name (TEXT)
  airport_location (TEXT)
  state_code (varchar(2))
  country_name (varchar(6))
  time_zone_code (varchar(3))
  minimum_connect_time (int(11))


Table: airport_service
Columns:
  city_code (varchar(4))
  airport_code (varchar(3))
  miles_distant (int(11))
  direction (varchar(2))
  minutes_distant (int(11))


Table: city
Columns:
  city_code (varchar(4))
  city_name (varchar(18))
  state_code (varchar(2))
  country_name (varchar(6))
  time_zone_code (varchar(3))


Table: class_of_service
Columns:
  booking_class (varchar(2))
  rank (int(11))
  class_description (TEXT)


Table: code_description
Columns:
  code (varchar(4))
  description (TEXT)


Table: compartment_class
Columns:
  compartment (varchar(5))
  class_type (varchar(8))


Table: date_day
Columns:
  month_number (int(11))
  day_number (int(11))
  year (int(11))
  day_name (varchar(10))


Table: days
Columns:
  days_code (varchar(20))
  day_name (varchar(10))


Table: dual_carrier
Columns:
  main_airline (varchar(2))
  low_flight_number (int(11))
  high_flight_number (int(11))
  dual_airline (varchar(2))
  service_name (TEXT)


Table: equipment_sequence
Columns:
  aircraft_code_sequence (varchar(12))
  aircraft_code (varchar(3))


Table: fare
Columns:
  fare_id (int(11))
  from_airport (varchar(3))
  to_airport (varchar(3))
  fare_basis_code (TEXT)
  fare_airline (TEXT)
  restriction_code (TEXT)
  one_direction_cost (int(11))
  round_trip_cost (int(11))
  round_trip_required (varchar(3))


Table: fare_basis
Columns:
  fare_basis_code (TEXT)
  booking_class (TEXT)
  class_type (TEXT)
  premium (TEXT)
  economy (TEXT)
  discounted (TEXT)
  night (TEXT)
  season (TEXT)
  basis_days (TEXT)


Table: flight
Columns:
  flight_id (int(11))
  flight_days (TEXT)
  from_airport (varchar(3))
  to_airport (varchar(3))
  departure_time (int(11))
  arrival_time (int(11))
  airline_flight (TEXT)
  airline_code (varchar(3))
  flight_number (int(11))
  aircraft_code_sequence (TEXT)
  meal_code (TEXT)
  stops (int(11))
  connections (int(11))
  dual_carrier (TEXT)
  time_elapsed (int(11))


Table: flight_fare
Columns:
  flight_id (int(11))
  fare_id (int(11))


Table: flight_leg
Columns:
  flight_id (int(11))
  leg_number (int(11))
  leg_flight (int(11))


Table: flight_stop
Columns:
  flight_id (int(11))
  stop_number (int(11))
  stop_days (TEXT)
  stop_airport (TEXT)
  arrival_time (int(11))
  arrival_airline (TEXT)
  arrival_flight_number (int(11))
  departure_time (int(11))
  departure_airline (TEXT)
  departure_flight_number (int(11))
  stop_time (int(11))


Table: food_service
Columns:
  meal_code (TEXT)
  meal_number (int(11))
  compartment (TEXT)
  meal_description (varchar(10))


Table: ground_service
Columns:
  city_code (TEXT)
  airport_code (TEXT)
  transport_type (TEXT)
  ground_fare (int(11))


Table: month
Columns:
  month_number (int(11))
  month_name (TEXT)


Table: restriction
Columns:
  restriction_code (TEXT)
  advance_purchase (int(11))
  stopovers (TEXT)
  saturday_stay_required (TEXT)
  minimum_stay (int(11))
  maximum_stay (int(11))
  application (TEXT)
  no_discounts (TEXT)


Table: state
Columns:
  state_code (TEXT)
  state_name (TEXT)
  country_name (TEXT)


Table: time_interval
Columns:
  period (TEXT)
  begin_time (int(11))
  end_time (int(11))


Table: time_zone
Columns:
  time_zone_code (TEXT)
  time_zone_name (TEXT)
  hours_from_gmt (int(11))


Table: student
Columns:
  StuID (INTEGER)
  LName (VARCHAR(12))
  Fname (VARCHAR(12))
  Age (INTEGER)
  Sex (VARCHAR(1))
  Major (INTEGER)
  Advisor (INTEGER)
  city_code (VARCHAR(3))


Table: has_pet
Columns:
  StuID (INTEGER)
  PetID (INTEGER)


Table: pets
Columns:
  PetID (INTEGER)
  PetType (VARCHAR(20))
  pet_age (INTEGER)
  weight (REAL)


Table: ref_template_types
Columns:
  Template_Type_Code (CHAR(15))
  Template_Type_Description (VARCHAR(255))


Table: templates
Columns:
  Template_ID (INTEGER)
  Version_Number (INTEGER)
  Template_Type_Code (CHAR(15))
  Date_Effective_From (DATETIME)
  Date_Effective_To (DATETIME)
  Template_Details (VARCHAR(255))


Table: documents
Columns:
  Document_ID (INTEGER)
  Template_ID (INTEGER)
  Document_Name (VARCHAR(255))
  Document_Description (VARCHAR(255))
  Other_Details (VARCHAR(255))


Table: paragraphs
Columns:
  Paragraph_ID (INTEGER)
  Document_ID (INTEGER)
  Paragraph_Text (VARCHAR(255))
  Other_Details (VARCHAR(255))


Table: geographic
Columns:
  CITY_NAME (TEXT)
  COUNTY (TEXT)
  REGION (TEXT)


Table: restaurant
Columns:
  ID (INT)
  NAME (TEXT)
  FOOD_TYPE (TEXT)
  CITY_NAME (TEXT)
  RATING (REAL)


Table: location
Columns:
  RESTAURANT_ID (INT)
  HOUSE_NUMBER (INT)
  STREET_NAME (TEXT)
  CITY_NAME (TEXT)


Table: course
Columns:
  Course_ID (INT)
  Staring_Date (TEXT)
  Course (TEXT)


Table: teacher
Columns:
  Teacher_ID (INT)
  Name (TEXT)
  Age (TEXT)
  Hometown (TEXT)


Table: course_arrange
Columns:
  Course_ID (INT)
  Teacher_ID (INT)
  Grade (INT)


Table: business
Columns:
  bid (INT)
  business_id (TEXT)
  name (TEXT)
  full_address (TEXT)
  city (TEXT)
  latitude (TEXT)
  longitude (TEXT)
  review_count (INT)
  is_open (INT)
  rating (REAL)
  state (TEXT)


Table: category
Columns:
  id (INT)
  business_id (TEXT)
  category_name (TEXT)


Table: user
Columns:
  uid (INT)
  user_id (TEXT)
  name (TEXT)


Table: checkin
Columns:
  cid (INT)
  business_id (TEXT)
  count (INT)
  day (TEXT)


Table: neighbourhood
Columns:
  id (INT)
  business_id (TEXT)
  neighbourhood_name (TEXT)


Table: review
Columns:
  rid (INT)
  business_id (TEXT)
  user_id (TEXT)
  rating (REAL)
  text (TEXT)
  year (INT)
  month (TEXT)


Table: tip
Columns:
  tip_id (INT)
  business_id (TEXT)
  text (TEXT)
  user_id (TEXT)
  likes (INT)
  year (INT)
  month (TEXT)


Table: conductor
Columns:
  Conductor_ID (INT)
  Name (TEXT)
  Age (INT)
  Nationality (TEXT)
  Year_of_Work (INT)


Table: orchestra
Columns:
  Orchestra_ID (INT)
  Orchestra (TEXT)
  Conductor_ID (INT)
  Record_Company (TEXT)
  Year_of_Founded (REAL)
  Major_Record_Format (TEXT)


Table: performance
Columns:
  Performance_ID (INT)
  Orchestra_ID (INT)
  Type (TEXT)
  Date (TEXT)
  Official_ratings_(millions) (REAL)
  Weekly_rank (TEXT)
  Share (TEXT)


Table: show
Columns:
  Show_ID (INT)
  Performance_ID (INT)
  If_first_show (bool)
  Result (TEXT)
  Attendance (REAL)


Table: continents
Columns:
  ContId (INTEGER)
  Continent (TEXT)


Table: countries
Columns:
  CountryId (INTEGER)
  CountryName (TEXT)
  Continent (INTEGER)


Table: car_makers
Columns:
  Id (INTEGER)
  Maker (TEXT)
  FullName (TEXT)
  Country (TEXT)


Table: model_list
Columns:
  ModelId (INTEGER)
  Maker (INTEGER)
  Model (TEXT)


Table: car_names
Columns:
  MakeId (INTEGER)
  Model (TEXT)
  Make (TEXT)


Table: cars_data
Columns:
  Id (INTEGER)
  MPG (TEXT)
  Cylinders (INTEGER)
  Edispl (REAL)
  Horsepower (TEXT)
  Weight (INTEGER)
  Accelerate (REAL)
  Year (INTEGER)


Table: author
Columns:
  aid (INT)
  homepage (TEXT)
  name (TEXT)
  oid (INT)


Table: conference
Columns:
  cid (INT)
  homepage (TEXT)
  name (TEXT)


Table: domain
Columns:
  did (INT)
  name (TEXT)


Table: domain_author
Columns:
  aid (INT)
  did (INT)


Table: domain_conference
Columns:
  cid (INT)
  did (INT)


Table: journal
Columns:
  homepage (TEXT)
  jid (INT)
  name (TEXT)


Table: domain_journal
Columns:
  did (INT)
  jid (INT)


Table: keyword
Columns:
  keyword (TEXT)
  kid (INT)


Table: domain_keyword
Columns:
  did (INT)
  kid (INT)


Table: publication
Columns:
  abstract (TEXT)
  cid (TEXT)
  citation_num (INT)
  jid (INT)
  pid (INT)
  reference_num (INT)
  title (TEXT)
  year (INT)


Table: domain_publication
Columns:
  did (INT)
  pid (INT)


Table: organization
Columns:
  continent (TEXT)
  homepage (TEXT)
  name (TEXT)
  oid (INT)


Table: publication_keyword
Columns:
  pid (INT)
  kid (INT)


Table: writes
Columns:
  aid (INT)
  pid (INT)


Table: cite
Columns:
  cited (INT)
  citing (INT)


Table: airlines
Columns:
  uid (INTEGER)
  Airline (TEXT)
  Abbreviation (TEXT)
  Country (TEXT)


Table: airports
Columns:
  City (TEXT)
  AirportCode (TEXT)
  AirportName (TEXT)
  Country (TEXT)
  CountryAbbrev (TEXT)


Table: flights
Columns:
  Airline (INTEGER)
  FlightNo (INTEGER)
  SourceAirport (TEXT)
  DestAirport (TEXT)


Table: poker_player
Columns:
  Poker_Player_ID (INT)
  People_ID (INT)
  Final_Table_Made (REAL)
  Best_Finish (REAL)
  Money_Rank (REAL)
  Earnings (REAL)


Table: people
Columns:
  People_ID (INT)
  Nationality (TEXT)
  Name (TEXT)
  Birth_Date (TEXT)
  Height (REAL)


Table: area
Columns:
  course_id (INTEGER)
  area (varchar(30))


Table: comment_instructor
Columns:
  instructor_id (INTEGER)
  student_id (INTEGER)
  score (INTEGER)
  comment_text (varchar(400))


Table: course
Columns:
  course_id (INTEGER)
  name (varchar(255))
  department (varchar(255))
  number (varchar(255))
  credits (varchar(255))
  advisory_requirement (varchar(255))
  enforced_requirement (varchar(255))
  description (varchar(16384))
  num_semesters (INTEGER)
  num_enrolled (INTEGER)
  has_discussion (varchar(1))
  has_lab (varchar(1))
  has_projects (varchar(1))
  has_exams (varchar(1))
  num_reviews (INTEGER)
  clarity_score (INTEGER)
  easiness_score (INTEGER)
  helpfulness_score (INTEGER)


Table: course_offering
Columns:
  offering_id (INTEGER)
  course_id (INTEGER)
  semester (INTEGER)
  section_number (INTEGER)
  start_time (time)
  end_time (time)
  monday (varchar(1))
  tuesday (varchar(1))
  wednesday (varchar(1))
  thursday (varchar(1))
  friday (varchar(1))
  saturday (varchar(1))
  sunday (varchar(1))
  has_final_project (varchar(1))
  has_final_exam (varchar(1))
  textbook (varchar(30))
  class_address (varchar(30))
  allow_audit (varchar(1))


Table: course_prerequisite
Columns:
  pre_course_id (INTEGER)
  course_id (INTEGER)


Table: course_tags_count
Columns:
  course_id (INTEGER)
  clear_grading (INTEGER)
  pop_quiz (INTEGER)
  group_projects (INTEGER)
  inspirational (INTEGER)
  long_lectures (INTEGER)
  extra_credit (INTEGER)
  few_tests (INTEGER)
  good_feedback (INTEGER)
  tough_tests (INTEGER)
  heavy_papers (INTEGER)
  cares_for_students (INTEGER)
  heavy_assignments (INTEGER)
  respected (INTEGER)
  participation (INTEGER)
  heavy_reading (INTEGER)
  tough_grader (INTEGER)
  hilarious (INTEGER)
  would_take_again (INTEGER)
  good_lecture (INTEGER)
  no_skip (INTEGER)


Table: gsi
Columns:
  course_offering_id (INTEGER)
  student_id (INTEGER)


Table: instructor
Columns:
  instructor_id (INTEGER)
  name (varchar(255))
  uniqname (varchar(255))


Table: offering_instructor
Columns:
  offering_instructor_id (INTEGER)
  offering_id (INTEGER)
  instructor_id (INTEGER)


Table: program
Columns:
  program_id (INTEGER)
  name (varchar(255))
  college (varchar(255))
  introduction (varchar(255))


Table: program_course
Columns:
  program_id (INTEGER)
  course_id (INTEGER)
  workload (INTEGER)
  category (varchar(11))


Table: program_requirement
Columns:
  program_id (INTEGER)
  category (varchar(11))
  min_credit (INTEGER)
  additional_req (varchar(100))


Table: semester
Columns:
  semester_id (INTEGER)
  semester (varchar(4))
  year (INTEGER)


Table: student
Columns:
  student_id (INTEGER)
  lastname (varchar(255))
  firstname (varchar(255))
  program_id (INTEGER)
  declare_major (varchar(255))
  total_credit (INTEGER)
  total_gpa (float(3,2))
  entered_as (varchar(11))
  admit_term (INTEGER)
  predicted_graduation_semester (INTEGER)
  degree (varchar(10))
  minor (varchar(10))
  internship (varchar(10))


Table: student_record
Columns:
  student_id (INTEGER)
  course_id (INTEGER)
  semester (INTEGER)
  grade (varchar(10))
  how (varchar(10))
  transfer_source (varchar(10))
  earn_credit (varchar(1))
  repeat_term (varchar(10))
  test_id (varchar(10))
  offering_id (INTEGER)


Table: stadium
Columns:
  Stadium_ID (INT)
  Location (TEXT)
  Name (TEXT)
  Capacity (INT)
  Highest (INT)
  Lowest (INT)
  Average (INT)


Table: singer
Columns:
  Singer_ID (INT)
  Name (TEXT)
  Country (TEXT)
  Song_Name (TEXT)
  Song_release_year (TEXT)
  Age (INT)
  Is_male (bool)


Table: concert
Columns:
  concert_ID (INT)
  concert_Name (TEXT)
  Theme (TEXT)
  Stadium_ID (TEXT)
  Year (TEXT)


Table: singer_in_concert
Columns:
  concert_ID (INT)
  Singer_ID (TEXT)


Table: actor
Columns:
  aid (INT)
  gender (TEXT)
  name (TEXT)
  nationality (TEXT)
  birth_city (TEXT)
  birth_year (INT)


Table: copyright
Columns:
  id (INT)
  msid (INT)
  cid (INT)


Table: cast
Columns:
  id (INT)
  msid (INT)
  aid (INT)
  role (INT)


Table: genre
Columns:
  gid (INT)
  genre (TEXT)


Table: classification
Columns:
  id (INT)
  msid (INT)
  gid (INT)


Table: company
Columns:
  id (INT)
  name (TEXT)
  country_code (TEXT)


Table: director
Columns:
  did (INT)
  gender (TEXT)
  name (TEXT)
  nationality (TEXT)
  birth_city (TEXT)
  birth_year (INT)


Table: producer
Columns:
  pid (INT)
  gender (TEXT)
  name (TEXT)
  nationality (TEXT)
  birth_city (TEXT)
  birth_year (INT)


Table: directed_by
Columns:
  id (INT)
  msid (INT)
  did (INT)


Table: keyword
Columns:
  id (INT)
  keyword (TEXT)


Table: made_by
Columns:
  id (INT)
  msid (INT)
  pid (INT)


Table: movie
Columns:
  mid (INT)
  title (TEXT)
  release_year (INT)
  title_aka (TEXT)
  budget (TEXT)


Table: tags
Columns:
  id (INT)
  msid (INT)
  kid (INT)


Table: tv_series
Columns:
  sid (INT)
  title (TEXT)
  release_year (INT)
  num_of_seasons (INT)
  num_of_episodes (INT)
  title_aka (TEXT)
  budget (TEXT)


Table: writer
Columns:
  wid (INT)
  gender (TEXT)
  name (INT)
  nationality (INT)
  num_of_episodes (INT)
  birth_city (TEXT)
  birth_year (INT)


Table: written_by
Columns:
  id (INT)
  msid (INT)
  wid (INT)


Table: highschooler
Columns:
  ID (INT)
  name (TEXT)
  grade (INT)


Table: friend
Columns:
  student_id (INT)
  friend_id (INT)


Table: likes
Columns:
  student_id (INT)
  liked_id (INT)


Table: employee
Columns:
  Employee_ID (INT)
  Name (TEXT)
  Age (INT)
  City (TEXT)


Table: shop
Columns:
  Shop_ID (INT)
  Name (TEXT)
  Location (TEXT)
  District (TEXT)
  Number_products (INT)
  Manager_name (TEXT)


Table: hiring
Columns:
  Shop_ID (INT)
  Employee_ID (INT)
  Start_from (TEXT)
  Is_full_time (bool)


Table: evaluation
Columns:
  Employee_ID (TEXT)
  Year_awarded (TEXT)
  Bonus (REAL)


Table: battle
Columns:
  id (INT)
  name (TEXT)
  date (TEXT)
  bulgarian_commander (TEXT)
  latin_commander (TEXT)
  result (TEXT)


Table: ship
Columns:
  lost_in_battle (INT)
  id (INT)
  name (TEXT)
  tonnage (TEXT)
  ship_type (TEXT)
  location (TEXT)
  disposition_of_ship (TEXT)


Table: death
Columns:
  caused_by_ship_id (INT)
  id (INT)
  note (TEXT)
  killed (INT)
  injured (INT)


Table: singer
Columns:
  Singer_ID (INT)
  Name (TEXT)
  Birth_Year (REAL)
  Net_Worth_Millions (REAL)
  Citizenship (TEXT)


Table: song
Columns:
  Song_ID (INT)
  Title (TEXT)
  Singer_ID (INT)
  Sales (REAL)
  Highest_Position (REAL)


Table: city
Columns:
  ID (INTEGER)
  Name (char(35))
  CountryCode (char(3))
  District (char(20))
  Population (INTEGER)


Table: sqlite_sequence
Columns:
  name ()
  seq ()


Table: country
Columns:
  Code (char(3))
  Name (char(52))
  Continent (TEXT)
  Region (char(26))
  SurfaceArea (float(10,2))
  IndepYear (INTEGER)
  Population (INTEGER)
  LifeExpectancy (float(3,1))
  GNP (float(10,2))
  GNPOld (float(10,2))
  LocalName (char(45))
  GovernmentForm (char(45))
  HeadOfState (char(60))
  Capital (INTEGER)
  Code2 (char(2))


Table: countrylanguage
Columns:
  CountryCode (char(3))
  Language (char(30))
  IsOfficial (TEXT)
  Percentage (float(4,1))


Table: venue
Columns:
  venueid (INTEGER)
  venuename (varchar(100))


Table: author
Columns:
  authorid (INTEGER)
  authorname (varchar(50))


Table: dataset
Columns:
  datasetid (INTEGER)
  datasetname (varchar(50))


Table: journal
Columns:
  journalid (INTEGER)
  journalname (varchar(100))


Table: keyphrase
Columns:
  keyphraseid (INTEGER)
  keyphrasename (varchar(50))


Table: paper
Columns:
  paperid (INTEGER)
  title (varchar(300))
  venueid (INTEGER)
  year (INTEGER)
  numciting (INTEGER)
  numcitedby (INTEGER)
  journalid (INTEGER)


Table: cite
Columns:
  citingpaperid (INTEGER)
  citedpaperid (INTEGER)


Table: paperdataset
Columns:
  paperid (INTEGER)
  datasetid (INTEGER)


Table: paperkeyphrase
Columns:
  paperid (INTEGER)
  keyphraseid (INTEGER)


Table: writes
Columns:
  paperid (INTEGER)
  authorid (INTEGER)


Table: field
Columns:
  fieldid (INTEGER)


Table: paperfield
Columns:
  fieldid (INTEGER)
  paperid (INTEGER)


Table: ref_feature_types
Columns:
  feature_type_code (VARCHAR(20))
  feature_type_name (VARCHAR(80))


Table: ref_property_types
Columns:
  property_type_code (VARCHAR(20))
  property_type_description (VARCHAR(80))


Table: other_available_features
Columns:
  feature_id (INTEGER)
  feature_type_code (VARCHAR(20))
  feature_name (VARCHAR(80))
  feature_description (VARCHAR(80))


Table: properties
Columns:
  property_id (INTEGER)
  property_type_code (VARCHAR(20))
  date_on_market (DATETIME)
  date_sold (DATETIME)
  property_name (VARCHAR(80))
  property_address (VARCHAR(255))
  room_count (INTEGER)
  vendor_requested_price (DECIMAL(19,4))
  buyer_offered_price (DECIMAL(19,4))
  agreed_selling_price (DECIMAL(19,4))
  apt_feature_1 (VARCHAR(255))
  apt_feature_2 (VARCHAR(255))
  apt_feature_3 (VARCHAR(255))
  fld_feature_1 (VARCHAR(255))
  fld_feature_2 (VARCHAR(255))
  fld_feature_3 (VARCHAR(255))
  hse_feature_1 (VARCHAR(255))
  hse_feature_2 (VARCHAR(255))
  hse_feature_3 (VARCHAR(255))
  oth_feature_1 (VARCHAR(255))
  oth_feature_2 (VARCHAR(255))
  oth_feature_3 (VARCHAR(255))
  shp_feature_1 (VARCHAR(255))
  shp_feature_2 (VARCHAR(255))
  shp_feature_3 (VARCHAR(255))
  other_property_details (VARCHAR(255))


Table: other_property_features
Columns:
  property_id (INTEGER)
  feature_id (INTEGER)
  property_feature_description (VARCHAR(80))


Table: addresses
Columns:
  address_id (INTEGER)
  line_1 (VARCHAR(255))
  line_2 (VARCHAR(255))
  line_3 (VARCHAR(255))
  city (VARCHAR(255))
  zip_postcode (VARCHAR(20))
  state_province_county (VARCHAR(255))
  country (VARCHAR(255))
  other_address_details (VARCHAR(255))


Table: courses
Columns:
  course_id (INTEGER)
  course_name (VARCHAR(255))
  course_description (VARCHAR(255))
  other_details (VARCHAR(255))


Table: departments
Columns:
  department_id (INTEGER)
  department_name (VARCHAR(255))
  department_description (VARCHAR(255))
  other_details (VARCHAR(255))


Table: degree_programs
Columns:
  degree_program_id (INTEGER)
  department_id (INTEGER)
  degree_summary_name (VARCHAR(255))
  degree_summary_description (VARCHAR(255))
  other_details (VARCHAR(255))


Table: sections
Columns:
  section_id (INTEGER)
  course_id (INTEGER)
  section_name (VARCHAR(255))
  section_description (VARCHAR(255))
  other_details (VARCHAR(255))


Table: semesters
Columns:
  semester_id (INTEGER)
  semester_name (VARCHAR(255))
  semester_description (VARCHAR(255))
  other_details (VARCHAR(255))


Table: students
Columns:
  student_id (INTEGER)
  current_address_id (INTEGER)
  permanent_address_id (INTEGER)
  first_name (VARCHAR(80))
  middle_name (VARCHAR(40))
  last_name (VARCHAR(40))
  cell_mobile_number (VARCHAR(40))
  email_address (VARCHAR(40))
  ssn (VARCHAR(40))
  date_first_registered (DATETIME)
  date_left (DATETIME)
  other_student_details (VARCHAR(255))


Table: student_enrolment
Columns:
  student_enrolment_id (INTEGER)
  degree_program_id (INTEGER)
  semester_id (INTEGER)
  student_id (INTEGER)
  other_details (VARCHAR(255))


Table: student_enrolment_courses
Columns:
  student_course_id (INTEGER)
  course_id (INTEGER)
  student_enrolment_id (INTEGER)


Table: transcripts
Columns:
  transcript_id (INTEGER)
  transcript_date (DATETIME)
  other_details (VARCHAR(255))


Table: transcript_contents
Columns:
  student_course_id (INTEGER)
  transcript_id (INTEGER)


Table: state
Columns:
  state_name (TEXT)
  population (INTEGER)
  area (double)
  country_name (varchar(3))
  capital (TEXT)
  density (double)


Table: city
Columns:
  city_name (TEXT)
  population (INTEGER)
  country_name (varchar(3))
  state_name (TEXT)


Table: border_info
Columns:
  state_name (TEXT)
  border (TEXT)


Table: highlow
Columns:
  state_name (TEXT)
  highest_elevation (TEXT)
  lowest_point (TEXT)
  highest_point (TEXT)
  lowest_elevation (TEXT)


Table: lake
Columns:
  lake_name (TEXT)
  area (double)
  country_name (varchar(3))
  state_name (TEXT)


Table: mountain
Columns:
  mountain_name (TEXT)
  mountain_altitude (INTEGER)
  country_name (varchar(3))
  state_name (TEXT)


Table: river
Columns:
  river_name (TEXT)
  length (INTEGER)
  country_name (varchar(3))
  traverse (TEXT)
