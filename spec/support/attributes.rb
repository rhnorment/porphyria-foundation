def contact_attributes(overrides={})
  {
    address_1:  'Address One',
    address_2:  'Address Two',
    business_phone: x_number,
    cell_phone: x_number,
    city: 'Any Town',
    company: 'Company Name',
    country: 'USA',
    date_of_birth:  Date.new(2000, 2, 3),
    doctor_packet_sent: 'Yes',
    doctor_packet_sent_on: Date.new(2000, 2, 3),
    doctor_specialty: 'specialty',
    email_address: 'contact@example.com',
    fax_number: x_number,
    first_name: 'Example',
    gift_amount: 100.00,
    gift_given_on: Date.new(2002, 2, 3),
    home_phone: x_number,
    keep: false,
    last_name: 'Contact',
    middle_name: 'Test',
    miscellaneous: 'This is some miscellaneous text.',
    name_prefix: 'Mr.',
    name_suffix: 'III',
    patient_packet_sent: 'Yes',
    patient_packet_sent_on: Date.new(2003, 2, 3),
    porphyria_type: 'AIP',
    state: 'AL',
    status: 'status',
    waived: 'no',
    zip_code: '55555',
  }
end

def post_attributes(overrides={})
  {
      author: 'Example Author',
      body: 'This is the body of the example post',
      image: 'image.jpg',
      post_url: '/blog/blog-post-title',
      published: false,
      published_at: nil,
      title: 'Blog Post Title',
  }
end

def x_number
  '800-800-8000'
end