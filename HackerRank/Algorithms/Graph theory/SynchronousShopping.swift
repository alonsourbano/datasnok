//
//  SynchronousShopping.swift
//  HackerRank
//
//  Created by Vladimir Urbano on 7/7/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

/*
Bitville is a seaside city that has  shopping centers connected via  bidirectional roads. Each road connects exactly two distinct shopping centers and has a travel time associated with it.

There are  different types of fish sold in Bitville. Historically, any shopping center has a fishmonger selling certain types of fish. Buying any amount of fish from any fishmonger takes no time.

Our heroes, Big Cat and Little Cat, are standing at Bitville shopping center number . They have a list of the types of fish sold at each fishmonger, and they want to collectively purchase all  types of fish in a minimal amount of time. To do this, they decide to split the shopping between themselves in the following way:

Both cats choose their own paths, starting at shopping center  and ending at shopping center . It should be noted that Little Cat's path is not necessarily the same as Big Cat's.
While traveling their respective paths, each cat will buy certain types of fish at certain shops.
When the cats reach shopping center , they must have collectively purchased all  types of fish in a minimal amount of time.
If one cat finishes shopping before the other, he waits at shopping center  for his partner to finish; this means that the total shopping time is the maximum of Little and Big Cats' respective shopping times.
It is to be noted that any of the cats can visit the shopping center  in between, but they both have to finish their paths at the shopping center .

Given the layout for Bitville and the list of fish types sold at each fishmonger, what is the minimum amount of time it will take for Big and Little Cat to purchase all  types of fish and meet up at shopping center ?

Input Format

The first line contains  space-separated integers:  (the number of shopping centers),  (the number of roads), and  (the number of types of fish sold in Bitville), respectively.

Each line  of the  subsequent lines () describes a shopping center as a line of space-separated integers. Each line takes the following form:

The first integer, , denotes the number of types of fish that are sold by the fishmonger at the  shopping center.
Each of the  subsequent integers on the line describes a type of fish sold by that fishmonger. Which is denoted by .
Each line  of the  subsequent lines () contains  space-separated integers describing a road. The first two integers,  and , describe the two cities it connects. The third integer, , denotes the amount of time it takes to travel the road (i.e., travel time).

Constraints






All  are different for every fixed .


Each road connectes  distinct shopping centers (i.e., no road connects a shopping center to itself).
Each pair of shopping centers is directly connected by no more than  road.
It is possible to get to any shopping center from any other shopping center.
Each type of fish is always sold by at least one fishmonger.
Output Format

Print the minimum amount of time it will take for the cats to collectively purchase all  fish and meet up at shopping center .

Sample Input

5 5 5
1 1
1 2
1 3
1 4
1 5
1 2 10
1 3 10
2 4 10
3 5 10
4 5 10
Sample Output

30
Explanation

Big Cat can choose the following route: , and buy fish at all of the shopping centers on his way.

Little Cat can choose the following route: , and buy fish from the fishmonger at the  shopping center only.
*/

class SynchronousShopping {
	init() {
		// Reads from input
		var input = readLine()!.characters.split(" ").map({ Int(String($0))! })
		// Assigns read values to n (shopping centers), m (roads) and k (fishes)
		let (n, m, k) = (input[0], input[1], input[2])
		
		// Shopping centers
		var centers = Dictionary<Int, Array<Int>>()
		
		for i in 1 ... n {
			input = readLine()!.characters.split(" ").map({ Int(String($0))! })
			// First element contains the numbers of fishes sold by current mall, so we remove it
			input.removeFirst()
			// Describes shopping center
			centers[i] = input
		}
		
		// Roads
		var roads = Dictionary<Int, Array<(vertex: Int, time: Int)>>()
		
		for _ in 1 ... m {
			input = readLine()!.characters.split(" ").map({ Int(String($0))! })
			let (x, y, z) = (input[0], input[1], input[2])
			// Describes road
			if roads[x] == nil {
				roads[x] = Array<(vertex: Int, time: Int)>()
			}
			if roads[y] == nil {
				roads[y] = Array<(vertex: Int, time: Int)>()
			}
			
			roads[x]!.append((vertex: y, time: z))
			roads[y]!.append((vertex: x, time: z))
		}
		
		// Send first cat
		let genericCat = (time: 0, visited: Array<Int>(), current: 1)
		var fishes = Array<Int>()
		var visited = [1]
		var cat = (big: genericCat, little: genericCat)
		while fishes.count < k {
			while cat.big.current != n {
				// Big cat attempts to buy fish in its current center
				if let center = centers[cat.big.current] {
					if fishes.count == 0 {
						fishes = center
					} else {
						for c in center {
							if fishes.indexOf(c) == nil {
								fishes.append(c)
							}
						}
					}
				}
				
				// Big cat looks for another destination to move
				if let road = roads[cat.big.current] {
					var canMove = false
					for r in road {
						if visited.indexOf(r.vertex) == nil {
							canMove = true
							cat.big.current = r.vertex
							cat.big.time += r.time
							
							if visited.indexOf(cat.big.current) == nil {
								visited.append(cat.big.current)
							}
							
							break
						}
					}
					
					if !canMove {
						for r in road {
							if r.vertex == n {
								canMove = true
								cat.big.current = r.vertex
								cat.big.time += r.time
								
								if visited.indexOf(cat.big.current) == nil {
									visited.append(cat.big.current)
								}
								
								break
							}
						}
					}
					
					if !canMove {
						cat.big.current = road.first!.vertex
						cat.big.time += road.first!.time
						
						if visited.indexOf(cat.big.current) == nil {
							visited.append(cat.big.current)
						}
					}
				}
			}
			
			if let center = centers[n] {
				if fishes.count == 0 {
					fishes = center
				} else {
					for c in center {
						if fishes.indexOf(c) == nil {
							fishes.append(c)
						}
					}
				}
			}
			
			while cat.little.current != n {
				// Little cat attempts to buy fish in its current center
				if let center = centers[cat.little.current] {
					if fishes.count == 0 {
						fishes = center
					} else {
						for c in center {
							if fishes.indexOf(c) == nil {
								fishes.append(c)
							}
						}
					}
				}
				
				// Little cat looks for another destination to move
				if let road = roads[cat.little.current] {
					var canMove = false
					for r in road {
						if visited.indexOf(r.vertex) == nil {
							canMove = true
							cat.little.current = r.vertex
							cat.little.time += r.time
							
							if visited.indexOf(cat.little.current) == nil {
								visited.append(cat.little.current)
							}
							
							break
						}
					}
					
					if !canMove {
						for r in road {
							if r.vertex == n {
								canMove = true
								cat.little.current = r.vertex
								cat.little.time += r.time
								
								if visited.indexOf(cat.little.current) == nil {
									visited.append(cat.little.current)
								}
								
								break
							}
						}
					}
					
					if !canMove {
						cat.little.current = road.first!.vertex
						cat.little.time += road.first!.time
						
						if visited.indexOf(cat.little.current) == nil {
							visited.append(cat.little.current)
						}
					}
				}
			}
		}
		
		if cat.big.time > cat.little.time {
			print(cat.big.time)
		} else {
			print(cat.little.time)
		}
	}
}
