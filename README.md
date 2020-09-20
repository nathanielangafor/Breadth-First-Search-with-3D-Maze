# Breadth-First-Search-with-3D-Visualizer
This is a "maze" solver which utlizes the Breath First Search algorithm and visualizes it in a 3D setting. This was programed in Java and visualized in pjava (Processing). This is my first actual project in Java so please excuse any redundancies in my code. Due to time restraints, the maze has no obstacles within it so the path to the solution is fairly predictable. 

![Screenshot](https://i.gyazo.com/f2ab9d7c5a4f7b89d7625d6b52f629d2.png)
![Screenshot](https://gyazo.com/97e8e94373bffb9d78f591c79da34645.png)


# What is Breadth First Search?
Breadth-first search is an algorithm for traversing or searching tree or graph data structures. It starts at the tree root, and explores all of the neighbor nodes at the present depth prior to moving on to the nodes at the next depth level.

# What are practical uses of this project?
I recently started tinkering with drones and the idea of autonomy. Through the use of a proximity sensor, I was able to use this program as a sort of directional brain for the drones. They would first scan the areas, map out the area as per the images above (It marks the areas with objects as unavailable), then find the shortest path to the destination without interacting with any outside objects. There are honestly limitless possibilities.
