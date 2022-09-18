module Main where

import Types
import PhysicsLib

-- Library code
-----------------------------
main :: IO ()
main = undefined

mean :: [Scalar] -> Scalar
mean xs = sum xs / fromIntegral (length xs)

mmtom :: Scalar -> Scalar
mmtom x = x / 1000

cmtom :: Scalar -> Scalar
cmtom x = x / 100

mstos :: Scalar -> Scalar
mstos x = x / 1000

airtime :: Scalar -> Scalar
airtime h0 = sqrt (2 * h0 / gm)
-----------------------------

-- List of times measured from
--  the ball passing through the photogate
ts :: [Scalar] -- ms
ts = [23.1, 23.6, 23.8, 23.0] 


-- The mean time to reduce potential error
t :: Scalar -- ms -> s
t = mstos $ mean ts

-- The width of the ball bearing
d :: Scalar -- mm -> m
d = mmtom 25

-- The velocity of the ball bearing
--  calculated using the width of the ball bearing
--  divided by the mean duration that the photogate was tripped
v :: Scalar -- m/s
v = d / t -- = 1.0695187165775402

-- The height of the drop
--  measured using a string and plumb bob
--  from the top of the ramp to the floor
h :: Scalar -- cm -> m
h = cmtom 93

-- The estimated landing position
--  calculated using the formula `sqrt (2 * y / g)` (airtime :: Scalar -> Scalar)
est :: Scalar -- m
est = v* airtime h -- = 0.46570441753993086


-- At this point, we attempted the to hit the actual target to see if our calculations were correct.
-- We did not hit the target. The estimated landing position was 0.466 m (46.6 cm), but the actual landing position was 0.425 m (42.5 cm).

-- Next, we were to use the actual landing position to calculate what the velocity of the ball bearing really was.

-- The actual landing position
actual :: Scalar -- m
actual = cmtom 42.5

-- The estimated velocity of the ball bearing
--  calculated using the actual landing position
estv :: Scalar -- m/s
estv = actual / airtime h -- = 0.425 / 0.43543363039983535 = 0.976038528787373

-- The velocity we calculated using the actual landing position was 0.976 m/s
--  which compared to the measured velocity of 1.07 m/s is approximately a 9% error.

-- The lab was completed, so the above results are our final numbers. 
-- This is the moment we realized that our photogate was set up around a milimeter too high.
-- This caused the photogate to activate later and deactivate earlier than it should have, resulting in a shorter duration.
-- We adjusted the photogate and roughly re-ran the experiment.

-- The duration measured from the corrected photogate
correctedt :: Scalar -- s
correctedt = mstos 24.4

rerun_target :: Scalar -- m
rerun_target = (d / correctedt)* airtime h -- = 0.4461410147539297

-- The estimated landing position using the adjusted photogate was 0.446 m (44.6 cm)
-- which is closer to the actual landing position but still approximately 2 cm off.