# DDD
A quake like game engine. We are using basic physics, manipulating them with inputs and rendering the result. This is a basic game engine and we recommend not making any games from it.

[Github Link](https://github.com/Braniacslambam/DDD)

## The Basics
### The Object
An `Object` is the class that is used for any object (surprise) used in the DDD engine. Initializer:
```
Object(String location, boolean takesRotation, boolean isKinematic, boolean useGravity, PVector colliderA, PVector colliderB, PVector position, PVector velocity, float mass, float bounce)
```
Argument | Type | Description
--- | --- | ---
location | PVector (3D) | The position of the object, in pixels.
takesRotation | boolean | Does the 3D object take rotation? This should only be true for the camera.
isKinematic | boolean | If set to true, the object will not be affected by physics, but will still have a collider.
useGravity | boolean | Is the object affected by gravity?
colliderA | PVector (3D) | The leastmost point of the collider hitbox rectangle, relative to position. This should be 0 in most cases where the position is set to top left.
colliderB | PVector (3D) | the greatest point of the collider hitbox rectangle, relative to position. This should be (width, height, depth) in most cases where the position is set to top left.
position | PVector (3D) | The position of the object.
velocity | PVector (3D) | The starting velocity of the object. Should usually be (0, 0, 0) in most cases.
mass | float | The mass of the object. The greater the mass, the less the forces affect it.
bounce | float | The amount of energy that goes back into an object on collision. For example, a bounce of 1 will have an object bounce back with the same force, a bounce of 0 would have the object not bounce back, and a bounce of 2 would violate the conservation of energy. When two objects collide, the bounce is **averaged**.

### The Objects HashMap


## Scene Manager
The scene manager helps to... manage scenes.
