# Counting in Binary and Hex

Het binaire stelsel is een manier van tellen die alleen de getallen 0 en 1 gebruikt. In de informatica is het essentieel omdat computers op elektriciteit werken, wat betekent dat hun systemen alleen de aan- of afwezigheid van een stroom kunnen detecteren - wat perfect wordt weergegeven door de getallen 0 en 1 in het binaire stelsel. Een enkel binaire getal (0 of 1) wordt een 'bit' genoemd, en groepen van 8 bits worden 'bytes' genoemd.

Het hexadecimale stelsel is een talstelsel dat zestien symbolen gebruikt om getallen te representeren. Dit zijn de cijfers 0-9 en de letters A-F, waarbij A tot F de getallen 10 tot 15 voorstellen. 
|F|E|D|C|B|A|9|8|7|6|5|4|3|2|1|
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|15|14|13|12|11|10|9|8|7|6|5|4|3|2|1|

## Key-terms
- Binary/Hex
- Base 2/ Base 10/ Base 16


## Opdracht
### Gebruikte bronnen
- https://www.youtube.com/watch?v=sXxwr66Y79Y
- https://www.youtube.com/watch?v=4EJay-6Bioo
- https://medium.com/@jamesjefferyuk/how-to-convert-decimal-to-binary-7256d7d82b07

### Ervaren problemen
Geen problemen ondervonden. De youtube videos over Binary en Hexadecimals waren kort én krachtig.

### Resultaat


#### Translate the following decimal numbers into binary:

Voorbeeld berekening 228 decimal to binary (using diversion method):
```
228/2 = 114 remainder 0
114/2 = 57  remainder 0
57/2  = 28  remainder 1
28/2  = 14  remainder 0
14/2  = 7   remainder 0
7/2   = 3   remainder 1
3/2   = 1   remainder 1
1/2   = 0   remainder 1

remainders van onder naar boven: 1110 0100
```    


|Decimal|Binary|
|-|-|
|16|0001 0000|
|128|1000 0000|
|228|1110 0100|
|112|0111 0000|
|73|0100 1001|

#### Translate the following binary numbers into decimal:

|1|1|1|1|1|1|1|1|
|-|-|-|-|-|-|-|-|
128|64|32|16|8|4|2|1|

|Binary|Decimal|
|-|-|
|1010 1010|(128+0+32+0+8+0+2+0=) 170|
|1111 0000|(128+64+32+16+0+0+0+0=) 240|
|1101 1011|(128+64+0+16+8+0+2+1=) 219
|1010 0000|(128+0+32+0+0+0+0+0=) 160
|0011 1010|(0+0+32+16+8+0+2+0=) 58

#### Translate the following decimal numbers into hexadecimal:

|F|E|D|C|B|A|9|8|7|6|5|4|3|2|1|
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|15|14|13|12|11|10|9|8|7|6|5|4|3|2|1|

Voorbeeld berekening 246 binary to hex:
```
246/16 = 15 remainder 6
15/16   = 0 remainder 15

remainder van onder naar boven (F=15) F6
```
|Decimal|Hex|
|-|-|
|15|F|
|37|25|
|246|F6|
|125|7D
|209|D1|

#### Translate the following hexadecimal numbers into decimal:

|Hex|Decimal|
|-|-|
|88|((8x16)+(8x1)) = 136|
|e0|((14x16)+(0x1)) = 224|
|cb|((12x16)+(11x1)) = 203|
|2f|((2x16)+(15x1)) = 47|
|d8|((13x16)+(8x1)) = 216|
