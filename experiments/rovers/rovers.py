
import sys
import os
from pathlib import Path
import os.path as path

# add environments module to path
librovers = os.path.abspath(path.join(Path(__file__).resolve().parents[2] ,"environments/rovers/python"))
sys.path.append(librovers)

from librovers import *  # import bindings.
from render_rovers import *

"""
Random walk at every step.
"""
class RandomWalkRover (rovers.IRover):
    def __init__(self, obs_radius=1.0):
        super().__init__(obs_radius)

    def scan(self, agent_pack):
        return rovers.tensor([9.0 for r in agent_pack.agents])

    def reward(self, agent_pack):
        return rovers.rewards.Difference().compute(agent_pack)

    def apply_action(self):
        x = self.position().x + random.uniform(-0.1, 0.1)
        y = self.position().y + random.uniform(-0.1, 0.1)
        self.set_position(x, y)

# aliasing some types to reduce typing
Dense = rovers.Lidar[rovers.Density]        # lidar with density composition
Close = rovers.Lidar[rovers.Closest]        # lidar for closest rover/poi
Discrete = thyme.spaces.Discrete            # Discrete action space

agents = [
    RandomWalkRover(1.0),
    RandomWalkRover(1.0),
    rovers.Rover[Close, Discrete](2.0, Close(90)),
    rovers.Drone()
]
pois = [
    rovers.POI[rovers.CountConstraint](3),
    rovers.POI[rovers.TypeConstraint](2, 1.0),
    rovers.POI[rovers.TypeConstraint](5),
    rovers.POI[rovers.TypeConstraint](2)
]

# Environment with rovers and pois placed in the corners. Defaults to random initialization if unspecified.
Env = rovers.Environment[rovers.CornersInit]
# create an environment with our rovers and pois:
env = Env(rovers.CornersInit(10.0), agents, pois)
states, rewards = env.reset()

renderer = RoversViewer(env)
steps = 20000
for step in range(steps):
    states, rewards = env.step([[0.0] for rover in env.rovers()])
    renderer.update()
    renderer.render()
