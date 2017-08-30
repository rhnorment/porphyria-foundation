def admin_user_attributes(overrides={})
  {
      bio:  'I am an Admin User an this is my bio.',
      email:  'admin@example.com',
      name:  'Admin User',
      password:   'password',
      password_confirmation:  'password',
  }.merge(overrides)
end

def contact_attributes(overrides={})
  {
    address_1:  '123 Main Street',
    address_2:  'Unit 9',
    business_phone: x_number,
    cell_phone: x_number,
    city: 'Any Town',
    cme:  'CME',
    company: 'Company Name',
    country: 'USA',
    date_of_birth:  Date.new(2000, 2, 3),
    doctor_packet_sent: 'Y',
    doctor_packet_sent_on: Date.new(2000, 2, 3),
    doctor_specialty: 'specialty',
    email_address: 'contact@example.com',
    fax_number: x_number,
    first_name: 'Example',
    gift_amount: 100.00,
    gift_given_on: Date.new(2002, 2, 3),
    home_phone: x_number,
    keep: false,
    last_name: 'User',
    middle_name: 'Test',
    miscellaneous: 'This is some miscellaneous text.',
    name_prefix: 'Mr.',
    name_suffix: 'III',
    patient_packet_sent: 'Y',
    patient_packet_sent_on: Date.new(2003, 2, 3),
    porphyria_type: 'AIP',
    state: 'AL',
    status: 'status',
    waived: 'No',
    zip_code: '55555',
  }.merge(overrides)
end

def post_attributes(overrides={})
  {
      admin_user_id: 1,
      body: 'This is the body of the example post.',
      intro: 'This is the intro to the post.',
      published: true,
      published_at: Time.now,
      title: 'Blog Post Title',
  }.merge(overrides)
end

def tag_attributes(overrides={})
  {
    name: 'Tag Name'
  }.merge(overrides)
end

def x_number
  '800-800-8000'
end