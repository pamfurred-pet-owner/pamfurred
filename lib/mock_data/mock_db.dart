// This is for appointments, pets, and users mock_data

final Map<String, dynamic> data = {
  "appointments": [
    {
      "appointment_id": 1,
      "user_id": 1,
      "sp_id": 1,
      "pet_id": 1,
      "appointment_item_id": 1,
      "appointment_date": "2024-01-01",
      "appointment_time": "09:00",
      "status": "Done",
      "total_amount": 50.00,
    },
    {
      "appointment_id": 2,
      "user_id": 2,
      "sp_id": 2,
      "pet_id": 2,
      "appointment_item_id": 2,
      "appointment_date": "2024-01-02",
      "appointment_time": "10:00",
      "status": "Upcoming",
      "total_amount": 60.00
    }
  ],
  "users": [
    {
      "user_id": 1,
      "first_name": "John",
      "last_name": "Doe",
      "email": "john.doe@example.com",
      "phone_number": "1234567890"
    },
    {
      "user_id": 2,
      "first_name": "Jane",
      "last_name": "Smith",
      "email": "jane.smith@example.com",
      "phone_number": "0987654321"
    }
  ],
  "pets": [
    {
      "pet_id": 1,
      "user_id": 1,
      "name": "Buddy",
      "species": "Dog",
      "breed": "Golden Retriever",
      "age": 3
    },
    {
      "pet_id": 2,
      "user_id": 2,
      "name": "Whiskers",
      "species": "Cat",
      "breed": "Siamese",
      "age": 2
    }
  ],
  "appointment_items": [
    {"appointment_item_id": 1, "service": "Full Grooming", "price": 50.00},
    {"appointment_item_id": 2, "service": "Bath and Brush", "price": 30.00}
  ]
};
