# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Download your Firebase private key JSON file from the Firebase console and save it as `config/firebase_private_key.json`.

* Add the following environment variables to your .env file:
```
GOOGLE_APPLICATION_CREDENTIALS_PATH=config/firebase_private_key.json
FIREBASE_PROJECT_ID=your-firebase-project-id
```

* Test sending notification using the following command:
```bash 
curl -X POST http://localhost:3000/notifications \
-H "Content-Type: application/json" \
-d '{
  "token": "recipient_device_token",
  "title": "Hello",
  "body": "This is a test notification using HTTP v1"
}'
 ```