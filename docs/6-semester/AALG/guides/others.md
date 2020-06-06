---
title: Others
---



## Huffman Coding

[**Based on the 2016 exam set**](../extra/exam-sets/2016-aalg-exam.pdf)



- The goal is to create a tree where the leaves represents each letter and the lower frequency is always to the left

1. Count the frequency/how often each letter is found in a string
    - It is helpful to create a table
2. Do until there is only one root node:
    1. Combine the lowest frequency leaves and/or node and create a new node with their frequencies added together
        - The element with the lowest frequency is put to the left
        - The path of the leaves/nodes to the left are marked with a 0 and the right leaves/nodes with a 1

- To encode a letter with the created coding, navigate through the tree until you find the specified letter
- Remember to read the exercise because it might specify some order of clashing frequencies

