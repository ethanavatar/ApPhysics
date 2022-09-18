module PhysicsLib
( g, gm
) where

import TrigLib
import Types
import Vector3

-- | The magnitude of a acceleration due to gravity on Earth
gm :: Scalar
gm = 9.81

-- | The gravitational acceleration on Earth
g :: Vector3
g = mul vec3down gm