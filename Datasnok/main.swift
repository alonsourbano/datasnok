//
//  main.swift
//  Datasnok
//
//  Created by Vladimir Urbano on 6/28/16.
//  Copyright © 2016 Vladimir Urbano. All rights reserved.
//

import Foundation

if Process.arguments.indices.contains(2) {
	let path = Process.arguments[2]
	freopen(path, "r", stdin)
}

switch Process.arguments[1] {
	// Warm up
case "SolveMeFirst" : _ = SolveMeFirst()
case "SimpleArraySum" : _ = SimpleArraySum()
case "AVeryBigSum" : _ = AVeryBigSum()
case "DiagonalDifference" : _ = DiagonalDifference()
case "PlusMinus" : _ = PlusMinus()
case "Staircase" : _ = Staircase()
case "TimeConversion" : _ = TimeConversion()
	
	// Implementation
case "DivisibleSumPairs" : _ = DivisibleSumPairs()
case "AngryProfessor" : _ = AngryProfessor()
case "SherlockAndTheBeast" : _ = SherlockAndTheBeast()
case "MinimumDistances" : _ = MinimumDistances()
	
	// Strings
case "SuperReducedString" : _ = SuperReducedString()
	
	// Sorting
case "IntroToTutorialChallenges" : _ = IntroToTutorialChallenges()
case "InsertionSortPart1" : _ = InsertionSortPart1()
case "InsertionSortPart2" : _ = InsertionSortPart2()
	
	// Search
case "SherlockAndArray" : _ = SherlockAndArray()
	
	// Graph theory
//case "SynchronousShopping" : _ = SynchronousShopping()
case "SnakesAndLaddersTheQuickestWayUp" : _ = SnakesAndLaddersTheQuickestWayUp()
	
	// Dynamic programming
case "TheMaximumSubarray" : _ = TheMaximumSubarray()
	
	// Bit manipulation
case "LonelyInteger" : _ = LonelyInteger()
	
	// 30 days of code
case "Day0HelloWorld" : _ = Day0HelloWorld()
case "Day1DataTypes" : _ = Day1DataTypes()
case "Day2Operators" : _ = Day2Operators()
case "Day3IntroToConditionalStatements" : _ = Day3IntroToConditionalStatements()
case "Day4ClassVsInstance" : _ = Day4ClassVsInstance()
case "Day5Loops" : _ = Day5Loops()
case "Day6LetsReview" : _ = Day6LetsReview()
case "Day7Arrays" : _ = Day7Arrays()
case "Day8DictionariesAndMaps" : _ = Day8DictionariesAndMaps()
case "Day9Recursion" : _ = Day9Recursion()
case "Day10BinaryNumbers" : _ = Day10BinaryNumbers()
case "Day112DArrays" : _ = Day112DArrays()
case "Day12Inheritance" : _ = Day12Inheritance()
case "Day13AbstractClasses" : _ = Day13AbstractClasses()
case "Day14Scope" : _ = Day14Scope()
case "Day15LinkedList" : _ = Day15LinkedList()
case "Day16ExceptionsStringToInteger" : _ = Day16ExceptionsStringToInteger()
case "Day17MoreExceptions" : _ = Day17MoreExceptions()
case "Day18QueuesAndStacks" : _ = Day18QueuesAndStacks()
case "Day19Interfaces" : _ = Day19Interfaces()
case "Day20Sorting" : _ = Day20Sorting()
case "Day21Generics" : _ = Day21Generics()
case "Day22BinarySearchTrees" : _ = Day22BinarySearchTrees()
case "Day23BSTLevelOrderTraversal" : _ = Day23BSTLevelOrderTraversal()
case "Day24MoreLinkedLists" : _ = Day24MoreLinkedLists()
case "Day25RunningTimeAndComplexity" : _ = Day25RunningTimeAndComplexity()
case "Day26NestedLogic" : _ = Day26NestedLogic()
case "Day27Testing" : _ = Day27Testing()
case "Day28RegExPatternsAndIntroToDatabases" : _ = Day28RegExPatternsAndIntroToDatabases()
	
	// World CodeSprint 5
case "CamelCase" : _ = CamelCase()
	
default :
	print("No method found to be executed")
}
