#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>
#include <SoftwareSerial.h>
#include <TinyGPS++.h>
#define RXPin D7
#define TXPin D6

#define FIREBASE_HOST "Private"
#define FIREBASE_AUTH "Private"
#define WIFI_SSID "Private"
#define WIFI_PASSWORD "Private"

static const uint32_t GPSBaud = 9600;
const int buzzer = D2;
const int smokeA0 = A0;
int sensorThres = 600;
SoftwareSerial ss(RXPin, TXPin);
TinyGPSPlus gps;
WiFiClient  client;
void setup() {
  Serial.begin(9600);
  ss.begin(GPSBaud);
  pinMode(buzzer, OUTPUT);
  pinMode(smokeA0, INPUT);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

int n = 0;

void loop() {

  // alcohol sensor
  int analogSensor = analogRead(smokeA0);
  Serial.print("Alcohol_level: ");
  Serial.println(analogSensor);
  // Checks if it has reached the threshold value
  if (analogSensor > sensorThres)
  {
    tone(buzzer, 1000, 200);
    Firebase.setString("Cab_id:001/Driver:Atharwa/Cab_Status", "Dangerous!!");
    Firebase.setInt("Cab_id:001/Driver:Atharwa/Alcohol-level",analogSensor);
  }
  else
  {
    noTone(buzzer);
    Firebase.setString("Cab_id:001/Driver:Atharwa/Cab_Status", "Safe!");
    Firebase.setInt("Cab_id:001/Driver:Atharwa/Alcohol-level",analogSensor);
  }
  delay(1000);
while (ss.available() > 0)
  if (gps.encode(ss.read()))
    displayInfo();

  if (millis() > 5000 && gps.charsProcessed() < 10)
  {
  Serial.println(F("No GPS detected: check wiring."));
  while (true);
  }


  }
void displayInfo()
  {
  // Serial.print(F("Location: "));
  if (gps.location.isValid())
  {

    double latitude = (gps.location.lat());
    double longitude = (gps.location.lng());

    String latbuf;
    latbuf += (String(latitude, 6));
    Serial.println(latbuf);
    Firebase.setString("Cab_id:001/Driver:Atharwa/Latitude",latbuf);

    String lonbuf;
    lonbuf += (String(longitude, 6));
    Serial.println(lonbuf);
    Firebase.setString("Cab_id:001/Driver:Atharwa/Longitude",lonbuf);
  }
  }
