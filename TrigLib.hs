module TrigLib
( sinD, cosD, tanD
, asinD, acosD, atanD
) where

import Types

toDegrees :: Radians -> Degrees
toDegrees rad = rad * 180 / pi

toRadians :: Degrees -> Radians
toRadians deg = deg * pi / 180

sinD :: Degrees -> Scalar
sinD = sin . toRadians

cosD :: Degrees -> Scalar
cosD = cos . toRadians

tanD :: Degrees -> Scalar
tanD = tan . toRadians

asinD :: Scalar -> Degrees
asinD = toDegrees . asin

acosD :: Scalar -> Degrees
acosD = toDegrees . acos

atanD :: Scalar -> Degrees
atanD = toDegrees . atan