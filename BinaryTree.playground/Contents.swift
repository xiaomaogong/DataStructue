//: Playground - noun: a place where people can play

import UIKit

//Tree 的遍历，包括前序，中序，后序
let nodes = ["A","B","C","D","E"]

class Node {
    let val: String
    var leftNode: Node?
    var rightNode: Node?
    
    init(val: String, leftNode: Node?, rightNode: Node?) {
        self.val = val
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

struct BinaryTree {
    let rootNode: Node
    
    //root->left->right
    func printPreOrderNodes(node: Node) {
        print(node.val)
        
        if let leftNode = node.leftNode {
            self.printPreOrderNodes(node: leftNode)
        }
        
        if let rightNode = node.rightNode {
            self.printPreOrderNodes(node: rightNode)
        }
    }
    
    //left->root->right
    func printMiddleOrderNodes(node: Node) {
        if let leftNode = node.leftNode {
            self.printMiddleOrderNodes(node: leftNode)
        }
        
        print(node.val)
        
        if let rightNode = node.rightNode {
            self.printMiddleOrderNodes(node: rightNode)
        }
    }
    
    //left->right->root
    func printLastOrderNodes(node: Node) {
        if let leftNode = node.leftNode {
            self.printLastOrderNodes(node: leftNode)
        }
        
        if let rightNode = node.rightNode {
            self.printLastOrderNodes(node: rightNode)
        }
        
        print(node.val)
    }
    
    init?(valueArr: [String]) {
        if let fistVal = valueArr.first {
            self.rootNode = Node(val: fistVal, leftNode: nil, rightNode: nil)
            for (i, val) in valueArr.enumerated() where i > 0 {
                self.insertNodeForVal(node: self.rootNode, val: val)
            }
        }else {
            return nil;
        }
    }
    
    func insertNodeForVal(node: Node, val: String) {
        if val <= node.val {
            if let left = node.leftNode {
               self.insertNodeForVal(node: left, val: val)
            }else {
               node.leftNode = Node(val: val, leftNode: nil, rightNode: nil)
            }
        }else {
            if let right = node.rightNode {
                self.insertNodeForVal(node: right, val: val)
            } else {
                node.rightNode = Node(val: val, leftNode: nil, rightNode: nil)
            }
        }
    }
    
    //Search node
    func findNodeWithVal(val :String) -> Node? {
        return self.findNode(fromNode: self.rootNode, val: val)
    }
    
    private func findNode(fromNode node: Node, val: String) -> Node? {
        if val == node.val {
            return node
        }else if val < node.val,
            let left = node.leftNode {
            return self.findNode(fromNode: left, val: val)
        }else if val > node.val,
            let right = node.rightNode {
            return self.findNode(fromNode: right, val: val)
        }else {
            return nil
        }
    }
}

//let rootNode =  Node(val: "G", leftNode: Node(val: "D", leftNode: Node(), rightNode: <#T##Node?#>)
let tree = BinaryTree(valueArr: ["G","D","A","F","E","M","H","Z"])
if let realTree = tree {
//    realTree.printPreOrderNodes(node: realTree.rootNode)
    realTree.printMiddleOrderNodes(node: realTree.rootNode)
//    realTree.printLastOrderNodes(node: realTree.rootNode)
}
//如果是平衡的二叉树时间复杂度是O(log2n)如1024个数总共只需要10次，而线型查找需要1024次
let foundNode = tree?.findNodeWithVal(val: "E")

