int valor = 0;

void setup() {
   Serial.begin(9600);
}
void loop() {
   valor = analogRead(A0)/4;
   Serial.write(valor);
   delay(100);
}
