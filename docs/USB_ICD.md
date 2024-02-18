This is the general Interface Control Document for Chariot. Specifically, this is for communicating between submodules. Every exchange will follow the format specified below. Most transfers will include data, but some special exchanges only need to send the header, so a second table specifies how payload-less transfers function.
<br><br>

For commands with a payload:

| Byte index | Name | Type | Description|
|-----------:|------|------|------------|
| 0 | Bus Command | uint8  | Indicates broadly the action desired |
| 1-2 | Length    | uint16 | Total length of the payload (n \| n > 0)
| 3-(2+n) | Payload | uint8 | Payload internal to the recipiant device
| (4+n) - (5+n) | CRC | uint16 | CRC-16/MCRF4XX

<br>
For commands without a payload:

| Byte index | Name | Type | Description|
|-----------:|------|------|------------|
| 0 | Bus Command | uint8  | Indicates broadly the action desired |
| 1-2 | Length    | uint16 | Must be 0x0000
| 3-4 | CRC | uint16 | CRC-16/MCRF4XX

The broad nature of the transfers allows each module to implment a nested ICD for controlling their speicific module's functionality.