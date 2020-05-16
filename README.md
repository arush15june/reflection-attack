# reflection-attack

A simple challenge-response authentication protocol for a reflection attack.

## Protocol

A compresssed challenge-response protocol is implemented. Taken from pg.514, Note 9.2, On the design of security protocols [M. van Steen and A.S. Tanenbaum, Distributed Systems, 3rd ed., distributed-systems.net, 2017.].

```
Alice wants to talk to Bob,
both of them want to prove their identity to each other.

A is Alice's Identity
B is Bob's Identity

Kab is the pre-shared secret key between Alice and Bob.
This secret key is used encrypt challenges received by Alice or Bob,
and the encrypted text is sent back as the response to the challenge.

Ra is the challenge sent by Alice to Bob
Rb is the challenge sent by Bob to Alice.

Kab(Ra) is Bob's response to Alice's challenge.
Kab(Rb) is Alice's response to Bob's challenge

Protocol

    1. Alice ------- [ A, Ra ]  -------> Bob
    2. Alice <---- [ Rb, Kab(Ra) ] ----- Bob
    3. Alice ------ [ Kab(Rb) ]  ------> Bob

Implementation
    - AES-256-GCM used for encryption using Kab.
    - The IV is fixed to 16 null bytes.
```