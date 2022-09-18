module Vector3
( Vector3
, vec3
, vec3zero, vec3one
, vec3up, vec3down, vec3left, vec3right, vec3forward, vec3back
, mul
) where

import Types

newtype Vector3 = Vector3 (Scalar, Scalar, Scalar)

class Mul a where
    mul :: a -> Scalar -> a

instance Show Vector3 where
  show (Vector3 (x, y, z)) = "(" ++ show x ++ ", " ++ show y ++ ", " ++ show z ++")"

instance Num Vector3 where
    abs (Vector3 (x, y, z)) = Vector3 (abs x, abs y, abs z)
    signum (Vector3 (x, y, z)) = Vector3 (signum x, signum y, signum z)
    fromInteger x = Vector3 (fromInteger x, fromInteger x, fromInteger x)
    (+) (Vector3 (x1, y1, z1)) (Vector3 (x2, y2, z2)) = Vector3 (x1 + x2, y1 + y2, z1 + z2)
    (-) (Vector3 (x1, y1, z1)) (Vector3 (x2, y2, z2)) = Vector3 (x1 - x2, y1 - y2, z1 - z2)
    (*) (Vector3 (x1, y1, z1)) (Vector3 (x2, y2, z2)) = Vector3 (x1 * x2, y1 * y2, z1 * z2)

instance Mul Vector3 where
    mul (Vector3 (x1, y1, z1)) s = Vector3 (x1 * s, y1 * s, z1 * s)

vec3 :: Scalar -> Scalar -> Scalar -> Vector3
vec3 x y z = Vector3 (x, y, z)

vec3zero :: Vector3
vec3zero = vec3 0 0 0

vec3one :: Vector3
vec3one = vec3 1 1 1

vec3right :: Vector3
vec3right = vec3 1 0 0

vec3left :: Vector3
vec3left = -vec3right

vec3up :: Vector3
vec3up = vec3 0 1 0

vec3down :: Vector3
vec3down = -vec3up

vec3forward :: Vector3
vec3forward = vec3 0 0 1

vec3back :: Vector3
vec3back = -vec3forward